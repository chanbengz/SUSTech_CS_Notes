# 1.Large Number Addition
## Description
This problem requires to add up two large numbers which can't be done directly.
## Analysis
We got two data from each case, *digits* of the two integers and themselves.
I felt like crying for the fact that the TA seperates every digits of the large integers,
otherwise I'll have to solve it by String.
## Steps
1.Input the digits indexed from $n-p$ to $n-1$ and from $n-q$ to $n-1$

2.Do the addition by the reverse order (from higher address to lower address), and store the result in a array

3.Determine whether the next digit should be carried, and minus 10 from the current one

4.Output without space seperation
# 2.Missing Numbers
## Description
The *n* numbers range from 1 to n, and some of them are missing.
## Analysis
We apply a array into a storage of statues, where $flag[i]$ represents the numbers of i.
That $flag[i]$ is zero means $i$ is missing.
## Steps
1.Input each number $i$ and then `flag[i]++`

2.Find the index of last non-existent number

3.Output $i$ if $flag[i] == 0$ but I shall note that the index of the last mark the end of output where we shouldn't output empty space.
# 3.English Exam Preparation
## Description
We should find the least days Zhangsan could take to achieve 100 point.
## Analysis
At first I thought it might be a DP problem, but it's too hard for us.
So Zhangsan only need to take the least required days and improve that part until reaching its full mark.
However, we should use a 2D array to connect days with parts.
## Steps
1.Input points in $a[i][0]$ and days in $a[i][1]$ and find the total points

2.Determine if the total is 100 or more, if not, continue solving

3.Use a *while* loop under the condition of $total < 100$, don't forget to add up total and point of current part

4.If the current part Zhangsan studies reaches 30 point, set its days into 101(the most days).
# 4.Best Poker Hand
## Description
Find the best hand that a set of 5 poker cards can make.
## Analysis
We can use boolean to store the types, and check them by the order.
## Steps
1.Determine if the suits can make a `flush`, by storing the previous suit and compare it with current one

2.Use a *for* loop to find what the ranks of cards can make

3.Little tips, if $a[i]==a[i+1]$, they can make a  `Three of A Kind` or `Pair` and break the loop,
otherwise check if $a[i]==a[i+1]-1$ and if so, continue.By the end set the statues.

4.Check statues
# 5.Little-Endian and Big-Endian
## Description
Little-Endian means the data stored in the memory is by a reverse order.
As learnt at junior school, the smallest unit in memory is $byte$
## Analysis
A 32-bit hex string has 4 bytes, we just need to reverse the 4 bytes.
## Steps
1.Use `substring` to seperate each byte and add them up invertedly.