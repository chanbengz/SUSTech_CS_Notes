# Requirements of CS109 2023S Project
## Team
- Mostly **2** individuals, and you can only team up with those in the same class.
- Solo is acceptable, but we will not give special bonus for it.
- 3 individuals' team is also allowed, but will receive lower score. 
- It's required to fill in your team form by <u>23:55PM, 24 April, 2023.</u> After that, students that don't manage to team up will be assigned a partner randomly.


## Development

The development of your project can be of the following three types,

1. Starting from blank project. We highly recommend it, and will give some bonus points.
2. Modifying from demo project. We will not have any points taken or given for it.
3. Using an existing framework to whatever extent. You have to inform us what framework you use. May receive penalty for doing this and penalty points are dependent on how much the framework is used. For example, if you use a feature (e.g. music playing) provided by the framework, you can't earn points for this part.

Every source code must be written in Java (Kotlin and Scala are allowed). For example, AI algorithm written in Python is forbidden.

### Artificial Intelligence

It's totally acceptable if you learn AI algorithms and written the AI part of your project by yourself.

However, if you directly copy other's code, this part of bonus points will not be given. Also, you'll need to explain the algorithm in detail during presentation.

## Grading Policy

The score of your team consists of two parts, Basic Tasks and Bonus Tasks.
Individual score $n$  is determined by the formulae below. Suppose that
$$
\begin{aligned}
A &= \text{ score of Basic Tasks, 80 at maximum} \\
B &= \text{ score of Bonus Tasks, 20 or 30 at maximum} \\
N &= \text{ number of people in your team} \\
\lambda &= \text{ your contribution ratio} \\
c &= \begin{cases}
  1 &, N \leq 2 \\
  0.7 &, N = 3
\end{cases}
\end{aligned}
$$
Then
$$
k = \ln\big( \ln(0.85 \lambda N + 0.15) + e \big) \\
n = k (A + cB)
$$
Note: Image of function $y = \ln\big( \ln(0.85 x + 0.15) + e \big)$

![image-20230410200157838](/Users/chenben/Library/Application Support/typora-user-images/image-20230410200157838.png)

For Bonus Tasks, you will receive up to 30 points if your team present in Week 15 or up to 20 points if presenting in Week 16. It's required to specify which week you'd like to present.

If your project does well in the presentation of Week 15, you'll be invited to present in the lecture of Week 16, and also receive extra 10 points for each person in your team.

| Basic Score | Bonus Score | Contribution | People | Individual Score |
| ----------- | ----------- | ------------ | ------ | ---------------- |
| 60          | 10          | 100%         | 1      | 70               |
| 80          | 20          | 30%          | 2      | 83               |
| 60          | 20          | 70%          | 2      | 88               |
| 80          | 30          | 20%          | 3      | 84               |
| 80          | 30          | 40%          | 3      | 100              |

Detailed grading rubric will be announced in the presentation day.
