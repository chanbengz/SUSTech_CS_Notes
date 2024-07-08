# Data Structure and Algorithm Analysis (CS207)

The problems can be viewed at [ACM OJ](https://acm.sustech.edu.cn/onlinejudge/), BUT it should be restricted to student-only for now.

## About
 - **Instructor:** `Bo Tang (唐博)`
 - **TA:** `Yun Shen (沈昀)`
 - **Semester:** `Fall 2023`

## Content

The course contains only two parts, theory and lab. Project is excluded and the assignment is to finish all labs.

### Theory

For quiz, midterm and final exams.

| Lecture         | Content                                | Duration |
| --------------- | -------------------------------------- | -------- |
| Introduction    | Intro to Data Structure and Algorithm  | 1 week   |
| Binary Search   | Complexity Analysis and Binary Search  | 2 weeks  |
| Sort            | Bubble Sort, Merge Sort and Quick Sort | 2 weeks  |
| Linked List     | Linked List and doubly Linked List     | 1 week   |
| Stack and Queue | Stack, Queue, Ring Queue and Deque     | 1 week   |
| String          | KMP, Robin-Karp and FSM                | 1 week   |
| Tree            | Intro to Tree and Advanced Tree        | 2 weeks  |
| Graph           | Intro to Graph and Advanced Graph      | 2 weeks  |

### Lab Exercise

> [!WARNING]
> The source codes are only for learning purpose. **DON'T** copy directly and submit to OJ, which might ruin you. Try understanding the idea, if trapped, feel free to contact [me](mailto:chanben04gz@gmail.com).

There're 10 labs in total and six problems for each lab with (15 + 15 + 20 + 20 + 25 + 25) points.

| Lab                | Problem                                                  | Note                                    |
| ------------------ | -------------------------------------------------------- | --------------------------------------- |
| [lab0](Labs/lab0/) | [Search Problem I](Labs/lab0/ProblemA.cpp)               | Brute Force                             |
| Welcome Lab        | [Search Problem II](Labs/lab0/ProblemB.cpp)              | Sort + Binary Search                    |
|                    | [Majsoul](Labs/lab0/ProblemC.java)                       | Sort + Simulation                       |
|                    | [Maximum difference](Labs/lab0/ProblemD.cpp)             | Greedy                                  |
|                    | [3-D Print](Labs/lab0/ProblemE.cpp)                      | Simulation                              |
|                    | [Mahhjong](Labs/lab0/ProblemF.cpp)                       | DFS                                     |
| [lab1](Labs/lab1/) | [Binary Search](Labs/lab1/ProblemA.cpp)                  | Binary Search Template                  |
| Complexity         | [Sum](Labs/lab1/ProblemB.java)                           | Math + High Accuracy                    |
| Binary Search      | [Simple Problem](Labs/lab1/ProblemC.cpp)                 | Binary Search                           |
|                    | [Counting Triples](Labs/lab1/ProblemD.cpp)               | Binary Search + Double Pointer          |
|                    | [Sport Meeting](Labs/lab1/ProblemE.cpp)                  | Binary Search of Solutions + Greedy     |
|                    | [Catching Neko](Labs/lab1/ProblemF.cpp)                  | Binary Search of Solutions + Simulation |
| [lab2](Labs/lab2/) | [Merge](Labs/lab2/ProblemA.cpp)                          | Merge Sort Template (Merge part)        |
| Sorting            | [Double Median](Labs/lab2/ProblemB.cpp)                  | Sort                                    |
|                    | [Bubble Sort](Labs/lab2/ProblemC.cpp)                    | Count Inversions (Merge Sort)           |
|                    | [Lucky Number](Labs/lab2/ProblemD.cpp)                   | Sort ($k$-th number)                    |
|                    | [Arrange Seats in a Round Table](Labs/lab2/ProblemE.cpp) | Sort + Greedy                           |
|                    | [Plants vs. Zombies](Labs/lab2/ProblemF.cpp)             | Sort + Greedy                           |
| [lab3](Labs/lab3/) | [Polynomial Summation](Labs/lab3/ProblemA.cpp)           | LinkedList Template                     |
| LinkedList         | [Help Narnal](Labs/lab3/ProblemB.cpp)                    | LinkedList + Simulation (Text Editor)   |
|                    | [Black era](Labs/lab3/ProblemC.cpp)                      | LinkedList + Section Exchange + Sort    |
|                    | [LowbieH's best friend](Labs/lab3/ProblemD.cpp)          | LinkedList + Deletion + Sort            |
|                    | [Minimum Difference](Labs/lab3/ProblemE.cpp)             | LinkedList + Deletion + Sort            |
|                    | [Non-decreasing Sequence](Labs/lab3/ProblemF.cpp)        | LinkedList + Deletion + Optimization    |
| [lab4](Labs/lab4/) | [Brackets Matching](Labs/lab4/ProblemA.cpp)              | Stack and Queue Template                |
| Stack & Queue      | [Cinema](Labs/lab4/ProblemB.cpp)                         | Queue                                   |
| Deque              | [Playroom](Labs/lab4/ProblemC.cpp)                       | Evaluation Process                      |
|                    | [Exciting Spider](Labs/lab4/ProblemD.cpp)                | Minimum Lexicographical Order           |
|                    | [Magic Sequences](Labs/lab4/ProblemE.cpp)                | Deque + Sliding Window                  |
|                    | [Fencing Hall](Labs/lab4/ProblemF.cpp)                   | Duque + Sliding Window                  |
| [lab5](Labs/lab5/) | [How many substrings](Labs/lab5/ProblemA.cpp)            | String Basic                            |
| String             | [Find Next](Labs/lab5/ProblemB.cpp)                      | KMP Basic                               |
|                    | [FSA](Labs/lab5/ProblemC.cpp)                            | FSA Basic                               |
|                    | [Necklace!](Labs/lab5/ProblemD.cpp)                      | Next Array                              |
|                    | [Stick!](Labs/lab5/ProblemE.cpp)                         | Rabin-Karp                              |
|                    | [String Problem F](Labs/lab5/ProblemF.cpp)               | Next Array                              |
| [lab6](Labs/lab6/) | [Leaves](Labs/lab6/ProblemA.cpp)                         | Leaf Node                               |
| Tree               | [Paths](Labs/lab6/ProblemB.cpp)                          | Path between Root and Leaf Node         |
|                    | [Pre, in and post](Labs/lab6/ProblemC.cpp)               | Tree Traversal                          |
|                    | [Cut the Stick](Labs/lab6/ProblemD.cpp)                  | Min Heap/Huffman Tree                   |
|                    | [Giant](Labs/lab6/ProblemE.cpp)                          | Search + Simulation                     |
|                    | [Node Activation](Labs/lab6/ProblemF.cpp)                | Root Exchange DP                        |
| [lab7](Labs/lab7)  | [Judgement](Labs/lab7/ProblemA.cpp)                      | Heap                                    |
| Advanced Tree      | [Meet my friend HEAP!](Labs/lab7/ProblemB.cpp)           | Heap Swap                               |
|                    | [We only want the smallest](Labs/lab7/ProblemC.cpp)      | Heap + Greedy                           |
|                    | [Funny Fluffy Tuzi](Labs/lab7/ProblemD.cpp)              | Heap + Simulation                       |
|                    | [Nth Element in Sliding Window](Labs/lab7/ProblemE.cpp)  | AVL Tree + Nth Element                  |
|                    | [Pet Adoption](Labs/lab7/ProblemF.cpp)                   | AVL Tree + Succeeder                    |
| [lab8](Labs/lab9)  | [Adjacency Matrix](Labs/lab8/ProblemA.cpp)               | Matrix Representation                   |
| Graph              | [Shortest Path](Labs/lab8/ProblemB.cpp)                  | BFS                                     |
|                    | [Defensive Tower](Labs/lab8/ProblemC.cpp)                | Simulation                              |
|                    | [Ancestor](Labs/lab8/ProblemD.cpp)                       | DFS Order                               |
|                    | [Sum](Labs/lab8/ProblemE.cpp)                            | Search                                  |
|                    | [The Elves](Labs/lab8/ProblemF.cpp)                      | Traverse                                |
| [lab9](Labs/lab9)  | [Travel](Labs/lab9/ProblemA.cpp)                         | SPFA Shortest Path                      |
| Advanced Graph     | [Sign in Problem](Labs/lab9/ProblemB.cpp)                | Kruskal Minimum Spanning Tree           |
|                    | [Game](Labs/lab9/ProblemC.cpp)                           | Kruskal Maximum Spanning Tree           |
|                    | [Naive Problem](Labs/lab9/ProblemD.cpp)                  | Dijstra + Multiple Source               |
|                    | [Simple Problem](Labs/lab9/ProblemE.cpp)                 | Tarjan SCC                              |
|                    | [Portal](Labs/lab9/ProblemF.cpp)                         | Dijstra + Layer                         |

