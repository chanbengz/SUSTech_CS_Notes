import time

import sqlite3

import numpy as np
import pandas as pd

from sklearn.model_selection import train_test_split
from sklearn import tree
from sklearn import metrics
import graphviz

from joblib import dump, load



def main():
	
	print('Starting rain classifier training process')
	
	np.random.seed(int(round(time.time())))

	while True:

		try:        			

			conn = sqlite3.connect('aiot.db')
			c = conn.cursor()
			c.execute('select devicename, strftime("%Y-%m-%d %H:%M", timestamp), avg(temp), avg(humidity), avg(rain) from sensor group by devicename, strftime("%Y-%m-%d %H:%M", timestamp)')
			results = c.fetchall()
			
			df = pd.DataFrame(columns=['timestamp', 'avgtemp', 'avghumidity', 'rain'])
			print(df)
			
			for result in results:
				
				strRain = 'No'
				
				if result[4] > 0.0:
					
					strRain = 'Yes'
				
				df = df.append({'timestamp': str(result[1]), 'avgtemp': result[2], 'avghumidity': result[3], 'rain': strRain}, ignore_index=True)

			conn.close()		
			print(df)
			
			# train a decision tree classifier to predict rain
			random_state = np.random.randint(2**31-1)
			X = df.drop('timestamp', axis=1).drop('rain', axis=1).values
			y = df['rain'].values
			X_train, X_test, y_train, y_test = train_test_split(X, y, train_size = 0.7, test_size = 0.3, shuffle = True, random_state=random_state, stratify=df['rain'])
			X_headers = df.drop('timestamp', axis=1).drop('rain', axis=1).columns.values
			
			clf = tree.DecisionTreeClassifier(criterion='gini', splitter='best')
			clf = clf.fit(X_train, y_train)
			y_train_pred = clf.predict(X_train)

			print('Training Accuracy = {}'.format(metrics.accuracy_score(y_train, y_train_pred)))
			print('Training Confusion = \n{}'.format(metrics.confusion_matrix(y_true=y_train, y_pred=y_train_pred, labels=['No', 'Yes'])))
			
			y_test_pred = clf.predict(X_test)
			
			print('Testing Accuracy = {}'.format(metrics.accuracy_score(y_test, y_test_pred)))
			print('Testing Confusion = \n{}'.format(metrics.confusion_matrix(y_true=y_test, y_pred=y_test_pred, labels=['No', 'Yes'])))

			# generate the decision tree for visualisation
			dot_data = tree.export_graphviz(clf, out_file=None, feature_names=X_headers, class_names=['No', 'Yes'], 
			filled=True, rounded=True, special_characters=True)
			graph = graphviz.Source(dot_data)
			graph.render("rain-train")
			
			# export the classifier model for future use
			dump(clf, 'rain-classifier.joblib')			

		except Exception as error:

			print('Error: {}'.format(error.args[0]))
			continue

		except KeyboardInterrupt:

			print('Program terminating...')    
			break

		finally:

			time.sleep(30)



if __name__ == '__main__':
	
	main()
