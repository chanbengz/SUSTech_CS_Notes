def tolatex(mat):
    for i in range(len(mat)):
        for j in range(len(mat[0])):
            print(mat[i][j], end=" & " if j != len(mat[0]) - 1 else " ")
        print("\\\\" if i != len(mat) - 1 else "")

mat = [[0, 1, 1, 1, 0],
       [1, 0, 1, 0, 0],
       [1, 1, 0, 0, 0],
       [0, 0, 0, 0, 1],
       [1, 0, 0, 0, 0]]

for k in range(5):
    for i in range(5):
        for j in range(5):
            mat[i][j] = max(mat[i][j], mat[i][k] * mat[k][j])
    print("k =", k)
    tolatex(mat)