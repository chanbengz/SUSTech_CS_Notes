# 1.Operation for Matrix
## Description
Divide two $n$ by $n$ matrices into four $\frac{n}{2}$ submatrices and then compute A`#`B as in the description.
## Analysis
The Computation algorithm is quite simple. The hardest part lies in how to divide them into submatrices.

So I decided to seperate them during input process. And then output them as submatrices, too.
## Steps
1. Construct the four operations,  add, sub, transpose and multiply

2. Input $\frac{n}{2}$ lines as A1 A2(seperate them by another $\frac{n}{2}$ row) and next $\frac{n}{2}$ lines into A3 A4

3. So do the B matrix

4. Compute and store the result then output the result as input
# 2.Perimeter of Black Grid Cells
## Description
Calculate the perimeter of the black grids, represented by 1.
## Analysis
Each grid has a perimeter of 4 as default, however, the sides are cancelled out by the neighbour grids.

Therefore the perimeter of each grid is `4 - number of neighbor grid`
## Steps
1. Input the map

2. Calculate the perimeter of each grid as above and store in the array.

3. Add up the the perimeter in the array.
# 3.Calculating area
## Description
Draw square of circle on the canvas, calculate the area of the pattern.
## Analysis
In this case, we should figure out how to deal with the problem of coverage, firstly. We know a square can fill in the whole grid, and two different quarters of circle can make a new pattern (noted as np for short) as in hint. Also, some quarters can fill the grid with some corresponding *np*. The second problem is how to encode the grids and transform the status of grids. That differs with everyone, try to find your own.
## Steps
1. Use 10 status to represent every grid, blank, square, 4 quarters of circle and new pattern in 4 shapes(my way)

2. Store the status in the left-down point of grid.

3. Transform the status when the current grid is being covered. 
# 4.Fill Matrix
## Description
Fill in the matrix in the shape of a snake
## Analysis
It contains four generic operations, move down, move right, move up and move left.
Make sure to stop when reach the boundary and the boundary needs to be changed when each operation ends.
When the count of operations equals to the numbers of elements, stop the whole procedure.
## Steps
1. Perform the 4 operations one by one. 
Tips, NOT to reset the index but turn back to the previous status (due to the for loop)

2. Stop when the numbers are put in entirely, by using a counter

3. Output the matrix normally
# 5.Five Wins
## Description
Find the right step to win.
## Analysis
Just determine whether it can win, by checking the column, the row and the diagonals.
## Steps
1. Go through the board and put the chess if the position is empty

2. Determine whether this position can win, if so, output coordinate; if there's no answer, output `-1`
(employ a status variable to determine whether to ouput `-1`)

3. Reset the position