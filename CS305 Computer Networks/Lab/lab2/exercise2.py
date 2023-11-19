import requests
url = 'http://www.baidu.com'
req = requests.Session()

res = req.get(url)
print(res.text)
