from socket import *

step = 65508
conn = socket(AF_INET, SOCK_DGRAM)
data = open('alice.txt', 'r').read()
segment = [data[i:i + step] for i in range(0, len(data), step)]
for d in segment:
    conn.sendto(d.encode(),("", 7781))

conn.close()
