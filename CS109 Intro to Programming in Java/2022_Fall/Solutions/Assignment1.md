# 1.Months with 31 days
## Description
The program aims to find whether the input months have 31 days.
## Analysis
According to the knowledge we've learnt in childhood, we should pair 7 months to a group, where
the odd ones have 31 days.
## Steps
1.we should judge whether it's 7, because 7 % 7 equals 0, which means it's even(wrong).
2.we mod the months with 7, which makes 8 the 1, 9 the 2 and so on.
3.if the result is odd, the month has 31 days, otherwise doesn't.
4.we generally use *for* loop to achieve the multiple input and process the each one.
## Code
Don't even think about it.

# 2.Slope
## Description
The program processes two points, (x1,y1) and (x2,y2) which makes a line, and find the y3 of x3
# Analysis
As learnt at the middle school, the gradient of a slope is $$ \frac{y_{1}-y_{2}}{x_{1}-x_{2}} $$
and $$b = y_{1}-kx_{1}$$, therefore calculate the y3
## Steps
1.Input number of cases
2.Calculate each cases

# 3.Leap Years
## Description
Determine whether the input years are leap years. If so, also output the days between the 30th, Febr
of the year and 1st, Jan, 2000.
## Analysis
According to the hints, we know how to determine a leap year, but the difficulty is how to calculate
the days. Obviously, $$day = (2000-year) * 365 + NumbersOfLeap * 1 - 60 + 1$$.
## Steps
1.Determine the year, output yes of no.
2.If yes, output the days by calculating the fomular.

# 4.Grades
## Description
Input a group of scores and count the numbers of Grade A,B,C,D, but no F.
## Analysis
Use the *for* loop to judge the grade of the score. If a grade is A, then number_of_A++
## Steps
1.set the storage variables to zero and use *for* loop to count.
2.output the answer by four format strings.
