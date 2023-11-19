from socket import *

conn = socket(AF_INET,SOCK_DGRAM)
conn.bind(("", 7781))
while True:
    receiveData += conn.recvfrom(65535)

conn.close()
