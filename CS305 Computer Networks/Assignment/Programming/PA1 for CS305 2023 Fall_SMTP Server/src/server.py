from __future__ import annotations
from argparse import ArgumentParser
from email import message_from_string
from socketserver import ThreadingTCPServer, BaseRequestHandler
from threading import Thread
import tomli, socket


def student_id() -> int:
    return 12212231


parser = ArgumentParser()
parser.add_argument('--name', '-n', type=str, required=True)
parser.add_argument('--smtp', '-s', type=int)
parser.add_argument('--pop', '-p', type=int)

args = parser.parse_args()

with open('data/config.toml', 'rb') as f:
    _config = tomli.load(f)
    SMTP_PORT = args.smtp or int(_config['server'][args.name]['smtp'])
    POP_PORT = args.pop or int(_config['server'][args.name]['pop'])
    ACCOUNTS = _config['accounts'][args.name]
    MAILBOXES = {account: [] for account in ACCOUNTS.keys()}

with open('data/fdns.toml', 'rb') as f:
    FDNS = tomli.load(f)

ThreadingTCPServer.allow_reuse_address = True


def fdns_query(domain: str, type_: str) -> str | None:
    domain = domain.rstrip('.') + '.'
    return FDNS[type_][domain]

email_domain = {'gmail.com': 'gmail.com', 'mail.sustech.edu.cn': 'exmail.qq.com'}

def add_email(account, mail):
    if account not in MAILBOXES.keys():
        return
    MAILBOXES[account].append(mail)

class POP3Server(BaseRequestHandler):
    def handle(self):
        conn = self.request
        conn.sendall(f'+OK {student_id()}\'s dummy POP3 server ready\r\n'.encode())
        account = ''
        dele_mail = set()
        login = False
        while True:
            msg = conn.recv(1024).strip().decode()            
            if msg == '':
                continue
            
            if login:
                mail_count = len(MAILBOXES[account])
            if len(msg) == 4:
                cmd = msg.upper()
                if cmd == 'QUIT':
                    tmp = []
                    for i in dele_mail:
                        tmp.append(MAILBOXES[account][i])
                    dele_mail.clear()
                    for i in tmp:
                        MAILBOXES[account].remove(i)
                    conn.sendall(f'+OK {student_id()}\'s dummy POP3 server signing off\r\n'.encode())
                    conn.close()
                    break
                elif cmd == 'STAT':
                    if login:
                        mail_total = 0
                        byts_total = 0
                        for i in range(len(MAILBOXES[account])):
                            if i not in dele_mail:
                                mail_total += 1
                                byts_total += len(MAILBOXES[account][i].as_string())
                        conn.sendall(f'+OK {mail_total} {byts_total}\r\n'.encode())
                    else:
                        conn.sendall(b'-ERR log in first\r\n')
                elif cmd == 'LIST':
                    if not login:
                        conn.sendall(b'-ERR log in first\r\n')
                        continue
                    conn.sendall(f'+OK {mail_count} messages\r\n'.encode())
                    for i in range(len(MAILBOXES[account])):
                        if i not in dele_mail:
                            mail = MAILBOXES[account][i]
                            size = len(mail.as_string())
                            conn.sendall(f'{i + 1} {size}\r\n'.encode())
                    conn.sendall(b'.\r\n')
                elif cmd == 'NOOP':
                    conn.sendall(b'+OK\r\n')
                elif cmd == 'RSET':
                    if login:
                        dele_mail.clear()
                        conn.sendall(b'+OK\r\n')
                    else:
                        conn.sendall(b'-ERR log in first\r\n')
                else:
                    conn.sendall(b'-ERR illegal command\r\n')
            else:
                cmd, arg = msg.split()
                cmd = cmd.upper()
                if cmd == 'USER':
                    if ACCOUNTS.__contains__(arg):
                        conn.sendall(b'+OK user found\r\n')
                        account = arg
                    else:
                        conn.sendall(b'-ERR invalid user\r\n')
                elif cmd == 'PASS':
                    if account == '':
                        conn.sendall(b'-ERR please specific user\r\n')
                    elif ACCOUNTS[account] != arg:
                        conn.sendall(b'-ERR wrong password\r\n')
                    else:
                        login = True
                        mail_count = len(MAILBOXES[account])
                        conn.sendall(b'+OK user successfully logged on\r\n')
                elif cmd == 'LIST':
                    try:
                        if not login:
                            raise
                        id = int(arg) - 1
                        if id >= mail_count or id < 0:
                            raise
                        if id in dele_mail:
                            raise
                        size = 0
                        if mail_count != 0:
                            mail = MAILBOXES[account][id]
                            size = len(mail.as_string())
                        conn.sendall(f'+OK {id + 1} {size}\r\n'.encode())
                    except:
                        conn.sendall(b'-ERR\r\n')
                elif cmd == 'RETR':
                    try:
                        if not login:
                            conn.sendall(b'-ERR log in first\r\n')
                            continue
                        id = int(arg) - 1
                        if id >= mail_count or id < 0:
                            raise
                        if id in dele_mail:
                            raise
                        mail_message =  MAILBOXES[account][id]
                        mail = mail_message.as_string().strip()
                        mail = mail.replace('\n', '\r\n')
                        conn.sendall('+OK\r\n'.encode())
                        conn.sendall((mail + '\r\n').encode())
                        conn.sendall(b'.\r\n')
                    except:
                        conn.sendall(b'-ERR invalid mail id\r\n')
                elif cmd == 'DELE':
                    try:
                        if not login:
                            conn.sendall(b'-ERR log in first\r\n')
                            continue
                        id = int(arg) - 1
                        if id >= mail_count or id < 0:
                            raise
                        dele_mail.add(id)
                        conn.sendall(f'+OK message {id + 1} deleted\r\n'.encode())
                    except:
                        conn.sendall(b'-ERR\r\n')
                else:
                    conn.sendall(b'-ERR illegal command\r\n')


def SMTPClient(fr, to, msg):
    domain = to[0].split('@')[-1] + '.'
    SMTP_SERVER = fdns_query(domain, 'MX')
    conn = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    conn.connect(('localhost', int(fdns_query(SMTP_SERVER, 'P'))))
    res = conn.recv(1024).strip().decode()
    assert res.startswith('220')
    conn.sendall(f'ehlo {args.name}\r\n'.encode())
    res = conn.recv(1024).strip().decode()
    assert res.startswith('250')
    conn.sendall(f'mail FROM:<{fr}>\r\n'.encode())
    res = conn.recv(1024).strip().decode()
    assert res.startswith('250')
    for receiver in to:
        conn.sendall(f'rcpt TO:<{receiver}>\r\n'.encode())
        res = conn.recv(1024).strip().decode()
        assert res.startswith('250')
    conn.sendall(b'data\r\n')
    res = conn.recv(1024).strip().decode()
    assert res.startswith('354')
    conn.sendall(msg.as_string().replace('\n', '\r\n').encode())
    res = conn.recv(1024).strip().decode()
    assert res.startswith('250')
    conn.sendall(b'quit\r\n')
    res = conn.recv(1024).strip().decode()
    assert res.startswith('221')
    conn.close()

class SMTPServer(BaseRequestHandler):
    def handle(self):
        conn = self.request
        conn.sendall(f'220 {args.name} SMTP server ready\r\n'.encode())
        sender = ''
        server = False
        auth = False
        mail_from = False
        rcpt_to = dict()
        sent = False
        while True:
            msg = conn.recv(1024).strip().decode()
            if msg == '':
                continue

            if len(msg) == 4:
                cmd = msg.upper()
                if cmd == 'DATA':
                    if len(rcpt_to) > 0 and not sent and auth and mail_from:
                        conn.sendall(b'354 Start mail input; end with <CRLF>.<CRLF>\r\n')
                        msg = conn.recv(1024).strip().decode()
                        mail = message_from_string(msg.strip('.'))
                        if server:
                            for receiver in rcpt_to[args.name]:
                                add_email(receiver, mail)
                        else:
                            for domain in rcpt_to:
                                to = rcpt_to[domain]
                                if domain == args.name:
                                    for receiver in to:
                                        add_email(receiver, mail)
                                else:
                                    for i in to:
                                        if i not in _config['accounts'][domain]:
                                            add_email(sender, mail)
                                            break
                                    SMTPClient(sender, to, mail)
                        conn.sendall(b'250 OK\r\n')
                        sent = True
                    else:
                        conn.sendall(b'503 Bad sequence of command\r\n')
                elif cmd == 'QUIT':
                    conn.sendall(b'221 Bye\r\n') # open until the client receives
                    break
                else:
                    conn.sendall(b'501 Syntax error\r\n')
            else:
                cmd = msg.split()
                cmd[0] = cmd[0].upper()
                if cmd[0] == 'HELO' or cmd[0] == 'EHLO':
                    server = cmd[1] in _config['server']
                    if not server:
                        prefix = cmd[1].split('.')[-1]
                        if prefix != 'arpa' and prefix != 'local':
                            conn.sendall(b'551 User not local\r\n')
                            continue
                    auth = True
                    conn.sendall(b'250 HELLO\r\n')
                elif cmd[0] == 'MAIL':
                    if auth:
                        if mail_from:
                            conn.sendall(b'503 Bad sequence of command\r\n')
                            break
                        fr = cmd[1][6:-1]
                        if not server and fr not in ACCOUNTS.keys():
                            conn.sendall(b'553 User not exists\r\n')
                            continue
                        sender = fr
                        mail_from = True
                        conn.sendall(b'250 OK\r\n')
                    else:
                        conn.sendall(b'503 Bad sequence of command\r\n')
                elif cmd[0] == 'RCPT':
                    if not mail_from or sent:
                        conn.sendall(b'503 Bad sequence of command\r\n')
                    else:
                        mail_to = cmd[1][4:-1]
                        domain = email_domain[mail_to.split('@')[-1]]
                        if domain in rcpt_to.keys():
                            rcpt_to[domain].append(mail_to)
                        else:
                            rcpt_to[domain] = []
                            rcpt_to[domain].append(mail_to)
                        conn.sendall(b'250 OK\r\n')
                else:
                    conn.sendall(b'501 Syntax error\r\n')


if __name__ == '__main__':
    if student_id() % 10000 == 0:
        raise ValueError('Invalid student ID')

    smtp_server = ThreadingTCPServer(('', SMTP_PORT), SMTPServer)
    pop_server = ThreadingTCPServer(('', POP_PORT), POP3Server)
    Thread(target=smtp_server.serve_forever).start()
    Thread(target=pop_server.serve_forever).start()
