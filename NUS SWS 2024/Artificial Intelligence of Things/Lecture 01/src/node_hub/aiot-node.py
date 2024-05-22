import time
from datetime import datetime

import RPi.GPIO as GPIO
from gpiozero import InputDevice

import board
from adafruit_dht import DHT11

import sqlite3

import socket
import _thread as thread

import requests
import json



def init():
    
    global ledStatusPin
    ledStatusPin = 21 # board pin 40
    global ledRainPin
    ledRainPin = 20 # board pin 38
    global ledWindowPin
    ledWindowPin = 16 # board pin 36
    global rainSensorPin
    rainSensorPin = 19 # board pin 35

    GPIO.setmode(GPIO.BCM)
    GPIO.setup(ledStatusPin, GPIO.OUT)
    GPIO.setup(ledRainPin, GPIO.OUT)
    GPIO.setup(ledWindowPin, GPIO.OUT)
    
    global rainSensor
    rainSensor = InputDevice(rainSensorPin)

    global dht11
    dht11 = DHT11(board.D26, False)
    
    GPIO.output(ledStatusPin, True)
    GPIO.output(ledRainPin, False)
    GPIO.output(ledWindowPin, True)
    
    global dbConn
    dbConn = sqlite3.connect('aiot.db')



def service_client(client_socket, address):        
    
    while True:
        
        data = client_socket.recv(1024).decode('utf-8')
        
        if not data:
            break
        
        print('[Command from {}] {}'.format(str(address), data))
        
        if data == 'open':
            
            GPIO.output(ledWindowPin, True)
        
        elif data == 'close':
            
            GPIO.output(ledWindowPin, False)
    
    client_socket.close()



def listenCommand():
    
    host = socket.gethostname()
    port = 8888

    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    s.bind((host, port))
    
    while True:
        
        s.listen(1)
        client_socket, address = s.accept()            
        thread.start_new_thread(service_client, (client_socket, address))
    
    s.close()



def relaySensorData():
    
    # To update IP address of laptop on direct ethernet connection to Rpi
    base_uri = 'http://169.254.177.201:5000/'
    sensor_uri = base_uri + 'api/sensor'
    headers = {'content-type': 'application/json'}
    
    while True:
        
        time.sleep(30)
        
        print('[Relaying sensor data to cloud]')
        
        localDbConn = sqlite3.connect('aiot.db')
        c = localDbConn.cursor()
        c.execute('SELECT id, devicename, timestamp, temp, humidity, rain FROM sensor WHERE tocloud = 0')
        results = c.fetchall()
        
        for result in results:
            
            sensordata = {
                'devicename':result[1],                
                'timestamp':result[2],
                'temp':result[3],
                'humidity':result[4],
                'rain':result[5],
            }
            
            req = requests.put(sensor_uri, headers = headers, data = json.dumps(sensordata))
            
            c.execute('UPDATE sensor SET tocloud = 1 WHERE id = ' + str(result[0]))
                
        c.close()
        localDbConn.commit()
        localDbConn.close()



def saveSensorData(temp, humidity, rain):
    
    c = dbConn.cursor()
    sql = "INSERT INTO sensor (devicename, temp, humidity, rain, timestamp) VALUES('home', " + str(temp) + ", " + str(humidity) + ", '" + rain + "', datetime('now', 'localtime'))"
    c.execute(sql)
    
    dbConn.commit()
    c.close()



def main():
    
    init()
    
    thread.start_new_thread(listenCommand, ())
    thread.start_new_thread(relaySensorData, ())
    
    print('Program running... Press CTRL+C to exit')
    
    while True:

        try:
            
            temperature = dht11.temperature
            humidity = dht11.humidity        
            
            if not rainSensor.is_active:
                
                raining = 'Yes'
                GPIO.output(ledRainPin, True)
            
            else:
                
                raining = 'No'
                GPIO.output(ledRainPin, False)
                
            print('{}: DHT11: Temperature={}; Humidity={} || Rain Sensor: {}'.format(datetime.now(), temperature, humidity, raining))
            saveSensorData(temperature, humidity, raining)

            time.sleep(1)
            
        except RuntimeError:
            
            time.sleep(5)
            
            continue
        
        except Exception as error:
            
            print('Error: {}'.format(error.args[0]))
            continue
            
        except KeyboardInterrupt:
            
            print('Program terminating...')    
            break



    if dht11 != None:
                
        dht11.exit()

    GPIO.cleanup()
    
    if dbConn != None:
        
        dbConn.close()

    print('Program exited...')



if __name__ == '__main__':
    
    main()
