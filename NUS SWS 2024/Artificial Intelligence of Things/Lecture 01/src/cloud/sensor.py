from flask import make_response, abort

import sqlite3



def create(sensor):
	
	devicename = sensor.get('devicename', None)
	temp = sensor.get('temp', None)
	humidity = sensor.get('humidity', None)
	rain = sensor.get('rain', None)
	timestamp = sensor.get('timestamp', None)
	
	print('timestamp: ' + timestamp)

	dbConn = sqlite3.connect('aiot.db')

	c = dbConn.cursor()
	
	rainInt = 0
	
	if rain == 'Yes':
	
		rainInt = 1
	
	sql = "INSERT INTO sensor (devicename, temp, humidity, rain, timestamp) VALUES('" + devicename + "', " + str(temp) + ", " + str(humidity) + ", " + str(rainInt) + ", datetime('" + str(timestamp) + "'))"
	c.execute(sql)

	dbConn.commit()
	c.close()	
	dbConn.close()

	return make_response('Sensor data record successfully created', 200)
