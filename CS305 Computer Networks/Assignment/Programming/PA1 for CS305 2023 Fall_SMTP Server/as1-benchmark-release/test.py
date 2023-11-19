from __future__ import annotations

import os
import sys
import subprocess as sp
import time
from argparse import ArgumentParser
from collections import Counter
from contextlib import suppress
from dataclasses import dataclass
from email.mime.text import MIMEText
from keyword import iskeyword
from poplib import POP3
from smtplib import SMTP
from socketserver import ThreadingTCPServer
from typing import Literal
from timeout_decorator import timeout, TimeoutError
import tomli
import yaml
import psutil

ThreadingTCPServer.allow_reuse_address = True

with open('data/config.toml', 'rb') as f:
    CONFIG = tomli.load(f)

with open('data/fdns.toml', 'rb') as f:
    FDNS = tomli.load(f)

conn: POP3


def safe_dict(d: dict[str, object]) -> dict[str, object]:
    d = d or {}
    return {f'{k}_' if iskeyword(k) else k: v for k, v in d.items()}


def fdns_query(domain: str, type_: str) -> str | None:
    domain = domain.rstrip('.') + '.'
    return FDNS[type_][domain]


class TestScenario:
    def __init__(self, filename: str):
        def to_runnable(server: dict[str, str]) -> sp.Popen:
            code = 'server.py' if server['type'] == 'student' else 'std_server.py'
            return sp.Popen(f'python3 {code} -n {server["domain"]}', shell=True,
                            stdout=sp.DEVNULL, stderr=sp.DEVNULL
                            )

        with open(filename, 'r', encoding='utf-8') as f:
            desc = yaml.load(f, Loader=yaml.FullLoader)

        self.scenario = desc['scenario']
        self.credit = int(desc['credit'])
        self.servers = desc['servers']
        self.subprocesses = list(map(to_runnable, self.servers))
        self.steps = [TestStep(**safe_dict(step)) for step in desc['steps']]

    def __enter__(self) -> TestScenario:
        print(f'Setup scenario: {self.scenario}')
        time.sleep(2)
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        print(f'Teardown scenario: {self.scenario}')
        for proc in self.subprocesses:
            proccccc = psutil.Process(proc.pid)
            for c in proccccc.children(recursive=True):
                c.kill()
            proc.kill()
        time.sleep(3)

    def run(self) -> TestResult:
        for step in self.steps:
            try:
                try:
                    step.run()
                except Exception as e:
                    if step.excepted_error is None:
                        raise e
                    ee = e
                    while type(ee) is not Exception:
                        ee_type = type(ee).__name__
                        if ee_type in step.excepted_error:
                            return TestResult(
                                scenario=self.scenario,
                                possible_credit=self.credit,
                                actual_credit=step.excepted_error[ee_type],
                                stats='PARTIALLY PASSED',
                                message=f'Raised error in step {step.name}: {ee_type} -> {step.excepted_error[ee_type]} pts',
                            )
                        ee = ee.__class__.__bases__[0]
                    raise e
            except TimeoutError:
                return TestResult(
                    scenario=self.scenario,
                    possible_credit=self.credit,
                    actual_credit=0,
                    stats='ERROR',
                    message=f'Timeout in step {step.name}',
                )
            except AssertionError:
                return TestResult(
                    scenario=self.scenario,
                    possible_credit=self.credit,
                    actual_credit=0,
                    stats='FAILED',
                    message=f'Result mismatch in step {step.name}',
                )
            except Exception as e:
                return TestResult(
                    scenario=self.scenario,
                    possible_credit=self.credit,
                    actual_credit=0,
                    stats='ERROR',
                    message=f'Error in step {step.name}: {repr(e)}',
                )
        return TestResult(
            scenario=self.scenario,
            possible_credit=self.credit,
            actual_credit=self.credit,
            stats='PASSED',
            message=None,
        )


def WAIT(seconds: float):
    time.sleep(seconds)


@timeout(10)
def SENDMAIL(from_: str, to: list[str] | str, subject: str, body: str):
    domain = from_.split('@')[-1]
    smtp_server = CONFIG['agent'][domain]['smtp']
    conn = SMTP('localhost', int(fdns_query(smtp_server, 'P')))
    msg = MIMEText(body, 'plain', 'utf-8')
    msg['Subject'] = subject
    msg['From'] = from_
    conn.sendmail(from_, to, msg.as_string())
    WAIT(3)
    conn.quit()


@timeout(8)
def LOGIN(user: str, pass_: str):
    global conn
    domain = user.split('@')[-1]
    pop3_server = CONFIG['agent'][domain]['pop']
    conn = POP3('localhost', int(fdns_query(pop3_server, 'P')))
    conn.user(user)
    conn.pass_(pass_)


@timeout(8)
def STAT() -> dict[str, int]:
    return [dict(zip(('count', 'size'), conn.stat()))]


@timeout(8)
def LIST() -> list[dict[dict, int]]:
    res = conn.list()[1]
    return [dict(zip(('mesg_num', 'octets'), map(int, r.split()))) for r in res]


@timeout(8)
def RETR(which: int) -> dict[str, str]:
    data0 = conn.retr(which)
    data = data0[1]
    sub, from_ = None, None
    for i, line in enumerate(data):
        if line.startswith(b'Subject:'):
            sub = line.decode().split('Subject: ', 1)[1]
    for i, line in enumerate(data):
        if line.startswith(b'From:'):
            from_ = line.decode().split('From: ', 1)[1]
    return {'from': from_, 'subject': sub}


@timeout(8)
def DELE(which: int):
    resp = str(conn.dele(which))
    return {'resp': resp}


@timeout(8)
def RSET():
    resp = str(conn.rset())
    return {'resp': resp}


@timeout(8)
def QUIT():
    conn.quit()

@timeout(8)
def NOOP():
    resp = str(conn.noop())
    return {'resp': resp}


@dataclass
class TestStep:
    uses: str
    name: str | None = None
    args: dict[str, object] | None = None
    expect: dict[str, object] | None = None
    excepted_error: dict[str, int] | None = None

    def run(self):
        self.name = self.name or self.uses

        func = globals()[self.uses.upper()]
        actual = func(**safe_dict(self.args))
        print('TEST>>> Step:', self.name)
        if self.expect is not None:
            print('    >>> Expect:', self.expect)
            print('    >>> Actual:', actual)

            if type(self.expect) is dict:
                for k, v in self.expect.items():
                    if type(v) is str:
                        # assert v in actual[k]
                        assert actual[k][:len(v)] == v
                    else:
                        assert actual[k] == v
            elif type(self.expect) is list:
                if len(self.expect) == 0:
                    assert len(actual) == 0
                for i, item in enumerate(self.expect):
                    if type(item) is dict:
                        for k, v in item.items():
                            assert actual[i][k] == v
                    else:
                        assert actual[i] == item


@dataclass
class TestResult:
    scenario: str
    possible_credit: int
    actual_credit: int
    stats: Literal['PASSED', 'FAILED', 'ERROR', 'PARTIALLY PASSED']
    message: str | None

    def __str__(self):
        return f'[{self.stats}] {self.scenario}:\n\tCredit: {self.actual_credit}/{self.possible_credit}\n\tMessage: {self.message}'


if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument('--output', '-o', type=str)
    parser.add_argument('--fixtures', '-f', type=str, default=None)
    args = parser.parse_args()
    FILE = open(args.output, 'a+') if args.output else None

    fixtures_to_run = args.fixtures.split(',') if args.fixtures else None

    res = []
    for filename in sorted(os.listdir('fixtures')):
        if not fixtures_to_run or filename.rstrip('.yml') in fixtures_to_run:
            with TestScenario(os.path.join('fixtures', filename)) as scenario:
                res.append(scenario.run())

    cnt = Counter(r.stats for r in res)
    total_credit = sum(r.possible_credit for r in res)
    actual_credit = sum(r.actual_credit for r in res)

    print('\n\n')

    sys.argv[1:] = ["--name", "gmail.com"]
    from server import student_id

    print('***** TEST SUMMARY *****', file=FILE)
    print(f'StudentID: {student_id()}', file=FILE)
    print(f'Score: {actual_credit}/{total_credit}', file=FILE)
    print('\t'.join(f'{k}: {v}' for k, v in cnt.items()), file=FILE)

    print('\n***** TEST DETAILS *****', file=FILE)
    for r in res:
        print(r, file=FILE)

    if FILE:
        print('***** TEST SUMMARY *****')
        print(f'StudentID: {student_id()}')
        print(f'Score: {actual_credit}/{total_credit}')
        print('\t'.join(f'{k}: {v}' for k, v in cnt.items()))

        print('\n***** TEST DETAILS *****')
        for r in res:
            print(r)

    with suppress(Exception):
        if FILE:
            FILE.close()
