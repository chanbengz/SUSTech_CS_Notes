import socket, os, tomli
from email.mime.text import MIMEText
from poplib import POP3
from smtplib import SMTP

with open('data/fdns.toml', 'rb') as f:
    FDNS = tomli.load(f)

def fdns_query(domain: str, type_: str) -> str | None:
    domain = domain.rstrip('.') + '.'
    return FDNS[type_][domain]

with open('data/config.toml', 'rb') as f:
    email = 'usr1@mail.sustech.edu.cn'
    password = 'pass1'
    _config = tomli.load(f)
    _domain = email.split('@')[-1]
    SMTP_SERVER = _config['agent'][_domain]['smtp']
    POP_SERVER = _config['agent'][_domain]['pop']

def test_bonus():
    print('[+] Test POP3 server error')
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('localhost', int(fdns_query(POP_SERVER, 'P'))))

    # Test Welcome message
    response = s.recv(1024)
    assert response == b'+OK 12212231\'s dummy POP3 server ready\r\n'
    # Test USER command with valid user
    s.sendall(f'USER {email}\r\n'.encode())
    response = s.recv(1024)
    assert response == b'+OK user found\r\n'

    # Test PASS command with incorrect password
    s.sendall(b'PASS wrongpassword\r\n')
    response = s.recv(1024)
    assert response == b'-ERR wrong password\r\n'

    # Test USER command with invalid user
    s.sendall(b'USER bob\r\n')
    response = s.recv(1024)
    assert response == b'-ERR invalid user\r\n'

    # Test PASS command with correct password
    s.sendall(f'PASS {password}\r\n'.encode())
    response = s.recv(1024)
    assert response == b'+OK user successfully logged on\r\n'

    # Test QUIT command
    s.sendall(b'QUIT\r\n')
    response = s.recv(1024)
    assert response.startswith(b'+OK')

    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('localhost', int(fdns_query(POP_SERVER, 'P'))))
    s.recv(1024) # Welcome message

    # Test LIST command before logging in
    s.sendall(b'LIST\r\n')
    response = s.recv(1024)
    assert response == b'-ERR log in first\r\n'

    # Test STAT command before logging in
    s.sendall(b'STAT\r\n')
    response = s.recv(1024)
    assert response == b'-ERR log in first\r\n'

    # Test RETR command before logging in
    s.sendall(b'RETR 1\r\n')
    response = s.recv(1024)
    assert response == b'-ERR log in first\r\n'

    # Test DELE command before logging in
    s.sendall(b'DELE 1\r\n')
    response = s.recv(1024)
    assert response == b'-ERR log in first\r\n'

    # Test RSET command before logging in
    s.sendall(b'RSET\r\n')
    response = s.recv(1024)
    assert response == b'-ERR log in first\r\n'

    # Test QUIT command
    s.sendall(b'QUIT\r\n')
    response = s.recv(1024)
    assert response.startswith(b'+OK')

    print('[+] POP3 server error passed')

def test_pop3_server():
    print('[+] Test POP3 server')

    # Test all commands after logging in
    conn = POP3('localhost', int(fdns_query(POP_SERVER, 'P')))
    assert conn.getwelcome() == b'+OK 12212231\'s dummy POP3 server ready'

    # Test USER PASS command
    assert conn.user(email) == b'+OK user found'
    assert conn.pass_(password) == b'+OK user successfully logged on'

    msg, bts = conn.stat()[0:2]
    list_len = len(conn.list()[1])
    assert list_len > 0
    assert int(msg) > 0
    assert int(bts) > 0
    mail_msg = '\r\n'.join(list(map(str, conn.retr(1)[1])))
    assert len(mail_msg) > 0
    assert conn.dele(1) == b'+OK message 1 deleted'
    assert len(conn.list()[1]) == list_len - 1
    assert conn.rset() == b'+OK'
    assert len(conn.list()[1]) == list_len
    mail_msg = '\r\n'.join(list(map(str, conn.retr(1)[1])))
    assert len(mail_msg) > 0

    # Test NOOP command
    assert conn.noop() == b'+OK'

    # Test QUIT command
    assert conn.quit() == b'+OK 12212231\'s dummy POP3 server signing off'

    print('[+] POP3 server passed')

def test_smtp_server():
    print('[+] Test SMTP server')

    # Test HELO command
    s = SMTP('localhost', int(fdns_query(SMTP_SERVER, 'P')))

    # Test MAIL DATA RCPT command
    content = 'This is a test email' + os.urandom(256).hex()
    subject = 'Test eamil'

    # send to another email server, myself and other users in my email server
    to = ['usr@gmail.com', 'usr1@mail.sustech.edu.cn', 'usr2@mail.sustech.edu.cn']
    msg = MIMEText(content, 'plain', 'utf-8')
    msg['Subject'] = subject
    msg['From'] = email
    s.sendmail(email, to, msg.as_string())

    # Test QUIT command
    s.quit()

    # Check if the mailbox received the email

    # myself
    conn = POP3('localhost', int(fdns_query(POP_SERVER, 'P')))
    assert conn.getwelcome() == b'+OK 12212231\'s dummy POP3 server ready'
    assert conn.user(email) == b'+OK user found'
    assert conn.pass_(password) == b'+OK user successfully logged on'

    msg, bts = conn.stat()[0:2]
    list_len = len(conn.list()[1])
    assert list_len > 0
    assert int(msg) > 0
    assert int(bts) > 0

    # usr2 at mail.sustech.edu.cn
    conn = POP3('localhost', int(fdns_query(POP_SERVER, 'P')))
    assert conn.getwelcome() == b'+OK 12212231\'s dummy POP3 server ready'
    assert conn.user('usr2@mail.sustech.edu.cn') == b'+OK user found'
    assert conn.pass_('pass2') == b'+OK user successfully logged on'

    msg, bts = conn.stat()[0:2]
    list_len = len(conn.list()[1])
    assert list_len > 0
    assert int(msg) > 0
    assert int(bts) > 0

    # usr at gmail.com
    gmail = 'usr@gmail.com'
    gmail_domain = gmail.split('@')[-1]
    conn = POP3('localhost', int(fdns_query(_config['agent'][gmail_domain]['pop'], 'P')))
    assert conn.getwelcome() == b'+OK 12212231\'s dummy POP3 server ready'
    assert conn.user(gmail) == b'+OK user found'
    assert conn.pass_('pass') == b'+OK user successfully logged on'

    msg, bts = conn.stat()[0:2]
    list_len = len(conn.list()[1])
    assert list_len > 0
    assert int(msg) > 0
    assert int(bts) > 0

    print('[+] SMTP server passed')

if __name__ == '__main__':
    test_bonus()