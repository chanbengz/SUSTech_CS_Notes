# Lab 2 Part 4: Padding Oracle Attack

## Answers

#### How many padding bytes are there?

`2 bytes`

#### What is the last character of the password?

`!`

#### What is the second-to-last character of the password?

`3`

#### What is the secret password?

`S3cr3tM3ss@g3!`

## Solution

```python
import subprocess

iv_origin, enc = subprocess.check_output(['./oracle']).decode().split()
mid = [0] * 16 # decryption result of encryptbox
iv = [0] * 16  # iv for brute force

# brute force the pos-th byte of the iv
def crack_pos(pos):
    for i in range(pos):
        iv[15 - i] = mid[15 - i] ^ (pos + 1)

    for i in range(256):
        iv[15 - pos] = i
        print(iv)
        try:
            # query the oracle
            res = subprocess.check_output(['./oracle', bytes(iv).hex(), enc])
            if len(res) == 0: # useless condition just to make sure
                mid[15 - pos] = (pos + 1) ^ i
                return
        except:
            # wrong padding
            continue

for pos in range(16):
    crack_pos(pos)

# get the decrypted result from the box
msg = []
for i, num in enumerate(mid):
    iv_char = int(iv_origin[i * 2: i * 2 + 2], 16)
    msg.append(iv_char ^ num)

print(msg)
print(''.join([chr(i) for i in msg[:-2]]))

# [83, 51, 99, 114, 51, 116, 77, 51, 115, 115, 64, 103, 51, 33, 2, 2]
# S3cr3tM3ss@g3!
```

