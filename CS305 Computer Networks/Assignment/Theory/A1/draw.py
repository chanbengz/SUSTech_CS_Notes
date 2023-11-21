import matplotlib.pyplot as plt
from numpy import *

def max(a, x, cond):
    interval0 = [1 if a > cond(i) else 0 for i in x]
    interval1 = [1 if cond(i) >= a else 0 for i in x]
    return array([a] * 1000) * interval0 + cond(x) * interval1

plt.xlabel('N')
plt.ylabel('Time')
plt.xlim(1,1000)

x = linspace(1, 1000, 1000)
y1 = max(5000, x, lambda a: 4000 / 3 * a)
y2 = max(5000, x, lambda a: a * 20000 / (15 + a * 0.1))
y3 = max(5000, x, lambda a: a * 20000 / (15 + a * 0.6))
y4 = max(5000, x, lambda a: a * 20000 / (15 + a * 4))

plt.plot(x, y1, color='blue', label='Server-client')
plt.plot(x, y2, color='red', label='P2P 100Kbps')
plt.plot(x, y3, color='orange', label='P2P 600kbps')
plt.plot(x, y4, color='green', label='P2P 4Mbps')

plt.legend()
plt.show()
