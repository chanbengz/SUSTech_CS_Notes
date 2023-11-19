seq = '2023'
num = int(input())

for i in range(4, num + 4):
    seq += str((int(seq[i - 1]) * int(seq[i - 2])) % 10)

print(seq)
print(seq[num + 3])
