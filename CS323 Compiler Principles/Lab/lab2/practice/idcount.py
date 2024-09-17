from string import ascii_letters, digits
from enum import Enum

"""
Regular Definition
letter_ -> [a-zA-Z_]
digit -> [0-9]
identifier -> letter_ (letter_ | digit)*
"""
letters_ = ascii_letters + '_'
letters_digits = letters_ + digits

reserved_words = ['if', 'else', 'while', 'struct', 'return', 'int', 'float', 'char']


class Token:
    """
    Token class specitially for identifier
    Regular expression: ({a-zA-Z_}|{a-zA-Z0-9_})*
    NFA:      [a-zA-Z_]         [a-zA-Z0-9_]
        (q0) -----------> (q1) --------------> (q2)
    """

    def __init__(self, value: str):
        self.value = value

    def __str__(self):
        return self.value

    def __eq__(self, other):
        return self.value == other.value

    def __hash__(self):
        return hash(self.value)


class State(Enum):
    """
    State of NFA for identifier:
    q0: match letters_
    q1: match letters_digits
    """
    q0 = 0
    q1 = 1


def getIdentifier(source: str) -> (Token, str):
    """
    NFA to match valid identifiers
    """
    tmp_str = ''
    current_state = State.q0
    pointer = 0
    while True:
        match current_state:
            case State.q0:
                if source[pointer] in letters_:
                    current_state = State.q1
                    tmp_str += source[pointer]
                    pointer += 1
                elif source[pointer:pointer+2] == '\\x':
                    # skip hex numbers
                    pointer += 2
                    while source[pointer] in digits:
                        pointer += 1
                    return None, source[pointer + 1:]
                else:
                    # skip current invalid ID
                    while source[pointer] in letters_digits:
                        pointer += 1
                    return None, source[pointer + 1:]
            case State.q1:
                if source[pointer] in letters_digits:
                    tmp_str += source[pointer]
                    pointer += 1
                else:
                    if tmp_str in reserved_words:
                        return None, source[pointer:]
                    return Token(tmp_str), source[pointer:]


def parse(source: str) -> list[Token]:
    token_list = []
    while True:
        source = source.lstrip()
        if not source:
            return token_list
        token, source = getIdentifier(source)
        if token:
            token_list.append(token)


if __name__ == '__main__':
    cases = ['02', '03', '06', '07', '09', '11']
    for case in cases:
        with open(f'./testcases/test_1_r{case}.spl', 'r') as f:
            source = f.read()
            tokens = list(set(parse(source)))
            print(f"Found {tokens.__len__()} unique IDs: ", end="")
            for token in tokens:
                print(token, end=", " if token != tokens[-1] else "\n")
