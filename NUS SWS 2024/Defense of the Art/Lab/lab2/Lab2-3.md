# DOTA Lab 2 Part 2

## Task 1: Encrypt with CBC and ECB

The orginal picture `pic_origin.bmp`

![](https://gist.githubusercontent.com/chanbengz/a29058bb1ffbb8928a160b6546d4ce63/raw/6f2f78c782266ace3152a425886e1a1e0cce5561/pic_original.bmp)

For this task, I use [CyberChef](https://gchq.github.io/CyberChef/) to encrypt the plaintext with the key `00112233445566778889aabbccddeeff` and iv `0102030405060708090A0B0C0D0E0F00` for both CBC and ECB.

Next, use ImHex software to modify the header in order to view the bmp pic.

### ECB

Encrypt the origin picture

![](https://gist.githubusercontent.com/chanbengz/a29058bb1ffbb8928a160b6546d4ce63/raw/6f2f78c782266ace3152a425886e1a1e0cce5561/ecb_encrypt.png)

And get the encrypted picture

![](https://gist.githubusercontent.com/chanbengz/a29058bb1ffbb8928a160b6546d4ce63/raw/6f2f78c782266ace3152a425886e1a1e0cce5561/ecb_enc_pic.bmp)

It's clear that though the color information is encrypted, the pattern of the encrypted picture is still visible, and similar to the original picture. The ECB mode is not secure since the ciphertext still contains information about the plaintext, which violates the perfect secrecy.

### CBC

Encrypt the origin picture

![](https://gist.githubusercontent.com/chanbengz/a29058bb1ffbb8928a160b6546d4ce63/raw/6f2f78c782266ace3152a425886e1a1e0cce5561/cbc_encrypt.png)

And get the encrypted picture

![](https://gist.githubusercontent.com/chanbengz/a29058bb1ffbb8928a160b6546d4ce63/raw/6f2f78c782266ace3152a425886e1a1e0cce5561/cbc_enc_pic.bmp)

The encrypted picture looks chaotic and does not contain any information about the original picture. The CBC mode is secure since the ciphertext does not contain any information about the plaintext. We cannot derive any useful information from the encrypted picture.

## Task 2 Corrupted Cipher Text

Using the same key and iv from task 1, 16 bytes length. Question 1 & 2 is answered under each encryption mode.

The plaintext
```
Hi, I'm texting you to let me pass the lab2 because the part 3 is hard to do. Thank you!

len(plaintext) = 88 > 64
```

### ECB

Encryption result (in hex)
```
7b57a52598ed0007f8226c28a04b828214ccf73e1a055e7f029965ac7ea9c9570a19418d5ac0413f239bd843997afe23fec9ae4fd8fd60027b87a27873c5e273b8f5e9eea963c61eb848eaa9021403040a25a1167f4f1a4f262f8dbdcf679098
```

Change the 30-th byte `a9` into `00` and decrypt the ciphertext to get

```
Hi, I'm texting \xf7\x97\xcd\xac\x57\xbb\xa5\xe5\xdd\xd3\xeb\x87\xd6\x3b\x95Lss the lab2 because the part 3 is hard to do. Thank you!
```

Only part of the plaintext is corrupted, and the rest is totally correct. The result implies that the ECB mode has each block encrypted independently, and the blocks will not affect each other. Though the ECB mode might not be secure, it can resist the corruption and protect the rest of the plaintext.

### CBC

Encryption result (in hex)
```
23be4456c64d34ade4438d115be105c8adf4f939e0f83ffd55883868400c73800ec682f7c529d7674236e02c75f5b18ec18cbea7c8382e36d2dd9d8ba2fed36076fc22569f2fa8427413452839ff967d385161e12bb94e7ee86887d47824bf25
```

Change the 30-th byte `0c` into `00` and decrypt the ciphertext to get

```
Hi, I'm texting \xf0\xa7\xa3\x30\xa3\x06\xf5\xa5\x07\x8b\xe2\x6e\xb7\xc5\x2a\xe8ss the lab2 bicause the part 3 is hard to do. Thank you!
```

Similar to ECB mode, the corrupted block cannot decrypt correctly. However, the position of the corrupted byte at the block next to the corrupted block is also corrupted, say `t` becomes `y` since
```python
ord(t) ^ 0x0C = ord(y)
```
which implies that the CBC mode has a mechanism to encrypt/decrypt the block using the previous/next block as the IV, and thus, the corrupted block will affect the next block when decrypting.

### CFB

Encryption result (in hex)
```
4fe2fc662d2dc0dd33a04046e95a3f18fd58856de9ba6f8b606eca788a0e6a2ade3b7cf8c6013a86225852471c2cfafe7c90ee142482e46fc781142bed787620bd877b0264a5523442a6ca50b64cba1b15b65bb694bf54bd
```

Change the 30-th byte `0e` into `00` and decrypt the ciphertext to get

```
Hi, I'm texting you to let me\x70\x61\xb9\xae\xa7\xdd\x21\x5a\x96\xe5\x52\x9b\x9c\xca\x20\x0e\xf7\xf4use the part 3 is hard to do. Thank you!
```

Unlike the previous ones, the message next to the corrupted block is corrupted, implying that the encryption scheme is different from the previous ones, say, $E_k(IV)$ first and then $m_1 \oplus E_k(IV)$. Thus the corrupted block will affect the next block when decrypting.

### OFB

Encryption result (in hex)
```
4fe2fc662d2dc0dd33a04046e95a3f18e3d55a6dde88704b752c82cc9d343046a262c670bd77ce5f89fc608d4da43772fa0a4590866f9fdf08b3b74336764176684c63701ba0320d53e62111c8d9ba43fff16f339940d975
```

Change the 30-th byte `34` into `00` and decrypt the ciphertext to get

```
Hi, I'm texting you to let me\x14pass the lab2 because the part 3 is hard to do. Thank you!
```

Only one character is corrupted, the best in corruption resistance but meanwhile, the encryption scheme is easy to be attacked by the known plaintext attack. The decryption result shows that OFB is similar to CFB, but the difference is that blocks will not use the previous encrypted block, instead, use $E_k(IV)$ to generate the keystream.

