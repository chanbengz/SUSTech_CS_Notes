# python -m flask --app aiot-hub run

from flask import Flask

import sqlite3

import socket

import requests



app = Flask(__name__)



def sendCommand(rainPrediction):
    
    command = 'error'
    
    if rainPrediction == 'Unknown':
            
        command = 'unknown'
    
    elif rainPrediction == 'Yes':
        
        command = 'close'
    
    elif rainPrediction == 'No':
        
        command = 'open'
    
    host = socket.gethostname()
    port = 8888

    s = socket.socket()
    s.connect((host, port))
    s.send(command.encode('utf-8'))
    s.close()



def predictRain(temp, humidity):
    
    # To update IP address of laptop on direct ethernet connection to Rpi
    base_uri = 'http://169.254.142.28:5000/'
    predict_uri = base_uri + 'api/predictrain'
    
    response = requests.get(predict_uri + '?temp=' + str(temp) + '&humidity=' + str(humidity))
    
    return response.text.replace('"', '').strip()
    


@app.route('/')
def index():

    conn = sqlite3.connect('aiot.db')
    c = conn.cursor()
    c.execute('SELECT id, devicename, timestamp, temp, humidity, rain, tocloud FROM sensor ORDER BY devicename ASC, timestamp DESC')
    results = c.fetchall()
    firstRow = None
    
    if len(results) > 0:
        
        firstRow = results[0]
        
        
    htmlTableRows = ''
    
    for result in results:
                
        htmlTableRows += '<tr><td>' + str(result[0]) + '</td><td>' + str(result[1]) + '</td><td>' + str(result[2]) + '</td><td>' + str(result[3]) + '</td><td>' + str(result[4]) + '</td><td>' + str(result[5]) + '</td><td>' + str(result[6]) + '</td></tr>'
    
    c.close()
    conn.close()
    
    html = '<html><head><title>Edge Processor</title><meta http-equiv="refresh" content="10" /></head><body>'
    html += '<h1>Latest Sensor Data</h1><table width="100%" cellspacing="1" cellpadding="3" border="1">'
    
    if firstRow != None:
        
        rainPrediction = predictRain(firstRow[3], firstRow[4]) # 'Unknown'
        
        sendCommand(rainPrediction)        
        
        html += '<tr><th>ID</th><td>' + str(firstRow[0]) + '</td></tr><tr><th>Device Name</th><td>' + str(firstRow[1]) + '</td></tr><tr><th>Timestamp</th><td>' + str(firstRow[2]) + '</td></tr><tr><th>Temperature</th><td>' + str(firstRow[3]) + '</td></tr><tr><th>Humidity</th><td>' + str(firstRow[4]) + '</td></tr><tr><th>Rain Prediction</th><td>' + rainPrediction + '</td></tr>'
        
    else:
        
        html += '<tr><th>No Data</th></tr>'
    
    html += '</table><hr />'
    html += '<h1>Historical Sensor Data</h1><table width="100%" cellspacing="1" cellpadding="3" border="1"><tr><th>ID</th><th>Device Name</th><th>Timestamp</th><th>Temperature</th><th>Humidity</th><th>Rain</th><th>To Cloud</th></tr>' + htmlTableRows + '</table></body></html>'        
    
    return html
