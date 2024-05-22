import connexion

import sqlite3



app = connexion.App(__name__, specification_dir='./')
app.add_api('aiot-cloud.yml')



@app.route('/')
def index():
	
	conn = sqlite3.connect('aiot.db')
	c = conn.cursor()
	c.execute('SELECT id, devicename, timestamp, temp, humidity, rain FROM sensor ORDER BY devicename ASC, timestamp DESC')
	results = c.fetchall()

	htmlTableRows = ''

	for result in results:

		htmlTableRows += '<tr><td>' + str(result[0]) + '</td><td>' + str(result[1]) + '</td><td>' + str(result[2]) + '</td><td>' + str(result[3]) + '</td><td>' + str(result[4]) + '</td><td>' + str(result[5]) + '</td></tr>'

	html = '<html><head><title>Cloud Server</title><meta http-equiv="refresh" content="5" /></head><body>'    
	html += '<h1>Global Historical Sensor Data</h1><table width="100%" cellspacing="1" cellpadding="3" border="1"><tr><th>ID</th><th>Device Name</th><th>Timestamp</th><th>Temperature</th><th>Humidity</th><th>Rain</th></tr>' + htmlTableRows + '</table></body></html>'

	c.close()
	conn.close()

	return html



# If we're running in stand alone mode, run the application
if __name__ == '__main__':
	app.run(host='0.0.0.0', port=5000, debug=True)
