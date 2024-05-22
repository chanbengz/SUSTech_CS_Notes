from flask import make_response, abort

from joblib import dump, load



def predict(temp, humidity):
	
	try:
		
		# predict new temperature and humidity observation
		clf = load('rain-classifier.joblib')

		# temperature, humidity
		newX = [[temp, humidity]]
		result = clf.predict(newX)
		print('Predict Rain: temp={}; humidity={}; rain={}'.format(temp, humidity, result[0]))

		return str(result[0])
		
	except Exception as error:

		return 'Unknown'
