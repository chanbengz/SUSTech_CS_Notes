import http.client
import sys

def get_hello_world(host, port):
    connection = http.client.HTTPConnection(host, port)
    try:
        connection.request('GET', '/')
        response = connection.getresponse()
        print('Status:', response.status, response.reason)
        data = response.read()
        print('Response from server:', data.decode())
    except Exception as e:
        print('Error accessing server:', e)
    finally:
        connection.close()

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print("Usage: python script.py <host> <port>")
        sys.exit(1)

    host = sys.argv[1]
    try:
        port = int(sys.argv[2])
    except ValueError:
        print("Please enter a valid port number.")
        sys.exit(1)

    get_hello_world(host, port)
