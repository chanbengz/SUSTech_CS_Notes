i = 1

def move(n, fr, to):
    global i
    print("第%d步：将%d号盘子从%s -> %s"%(i, n, fr, to))
    i += 1

def hanoi(n, A, B, C):
    if n == 1:
        move(1, A, C)
    else:
        hanoi(n - 1, A, C, B)
        move(n, A, C)
        hanoi(n - 1, B, A, C)
if __name__ == "__main__":
    try:
        n=int(input('please input a integer :'))
        print('移动步骤：')
        hanoi(n,'A','B','C')
    except ValueError :
        print('please input a integer n(n>0)!')
