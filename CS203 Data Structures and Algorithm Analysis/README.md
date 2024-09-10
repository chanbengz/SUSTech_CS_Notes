# Data Structure and Algorithm Analysis (CS207)

The problems can be viewed at [ACM OJ](https://acm.sustech.edu.cn/onlinejudge/), BUT it should be restricted to student-only for now.

## About
 - **Instructor:** `Bo Tang (唐博)`
 - **TA:** `Yun Shen (沈昀)`
 - **Semester:** `Fall 2023`
 - **Textbook:** `Data Structures and Algorithm Analysis in C++ (4th Edition)`

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
> The source codes are only for learning purpose. **DON'T** copy directly and submit to OJ, which might ruin you. Try understanding the idea, if trapped, feel free to contact me.

There're 10 labs in total and 6 problems for each lab with (15 + 15 + 20 + 20 + 25 + 25) points.

| Lab                  | Problem                                                  | Note                                    |
| -------------------- | -------------------------------------------------------- | --------------------------------------- |
| [lab0](./Lab/lab0/) | [Search Problem I](./Lab/lab0/ProblemA.cpp)             | Brute Force                             |
| Welcome Lab          | [Search Problem II](./Lab/lab0/ProblemB.cpp)              | Sort + Binary Search                    |
|                      | [Majsoul](./Lab/lab0/ProblemC.java)                       | Sort + Simulation                       |
|                      | [Maximum difference](./Lab/lab0/ProblemD.cpp)             | Greedy                                  |
|                      | [3-D Print](./Lab/lab0/ProblemE.cpp)                      | Simulation                              |
|                      | [Mahhjong](./Lab/lab0/ProblemF.cpp)                       | DFS                                     |
| [lab1](././Lab/lab1/) | [Binary Search](./Lab/lab1/ProblemA.cpp)                  | Binary Search Template                  |
| Complexity           | [Sum](./Lab/lab1/ProblemB.java)                         | Math + High Accuracy                    |
| Binary Search        | [Simple Problem](./Lab/lab1/ProblemC.cpp)               | Binary Search                           |
|                      | [Counting Triples](./Lab/lab1/ProblemD.cpp)               | Binary Search + Double Pointer          |
|                      | [Sport Meeting](./Lab/lab1/ProblemE.cpp)                  | Binary Search of Solutions + Greedy     |
|                      | [Catching Neko](./Lab/lab1/ProblemF.cpp)                  | Binary Search of Solutions + Simulation |
| [lab2](./Lab/lab2/)   | [Merge](./Lab/lab2/ProblemA.cpp)                          | Merge Sort Template (Merge part)        |
| Sorting              | [Double Median](./Lab/lab2/ProblemB.cpp)                  | Sort                                    |
|                      | [Bubble Sort](./Lab/lab2/ProblemC.cpp)                    | Count Inversions (Merge Sort)           |
|                      | [Lucky Number](./Lab/lab2/ProblemD.cpp)                   | Sort ($k$-th number)                    |
|                      | [Arrange Seats in a Round Table](./Lab/lab2/ProblemE.cpp) | Sort + Greedy                           |
|                      | [Plants vs. Zombies](./Lab/lab2/ProblemF.cpp)             | Sort + Greedy                           |
| [lab3](./Lab/lab3/)   | [Polynomial Summation](./Lab/lab3/ProblemA.cpp)           | LinkedList Template                     |
| LinkedList           | [Help Narnal](./Lab/lab3/ProblemB.cpp)                    | LinkedList + Simulation (Text Editor)   |
|                      | [Black era](./Lab/lab3/ProblemC.cpp)                      | LinkedList + Section Exchange + Sort    |
|                      | [LowbieH's best friend](./Lab/lab3/ProblemD.cpp)          | LinkedList + Deletion + Sort            |
|                      | [Minimum Difference](./Lab/lab3/ProblemE.cpp)             | LinkedList + Deletion + Sort            |
|                      | [Non-decreasing Sequence](./Lab/lab3/ProblemF.cpp)        | LinkedList + Deletion + Optimization    |
| [lab4](./Lab/lab4/)   | [Brackets Matching](./Lab/lab4/ProblemA.cpp)              | Stack and Queue Template                |
| Stack & Queue        | [Cinema](./Lab/lab4/ProblemB.cpp)                         | Queue                                   |
| Deque                | [Playroom](./Lab/lab4/ProblemC.cpp)                       | Evaluation Process                      |
|                      | [Exciting Spider](./Lab/lab4/ProblemD.cpp)                | Minimum Lexicographical Order           |
|                      | [Magic Sequences](./Lab/lab4/ProblemE.cpp)                | Deque + Sliding Window                  |
|                      | [Fencing Hall](./Lab/lab4/ProblemF.cpp)                   | Duque + Sliding Window                  |
| [lab5](./Lab/lab5/)   | [How many substrings](./Lab/lab5/ProblemA.cpp)            | String Basic                            |
| String               | [Find Next](./Lab/lab5/ProblemB.cpp)                      | KMP Basic                               |
|                      | [FSA](./Lab/lab5/ProblemC.cpp)                            | FSA Basic                               |
|                      | [Necklace!](./Lab/lab5/ProblemD.cpp)                      | Next Array                              |
|                      | [Stick!](./Lab/lab5/ProblemE.cpp)                         | Rabin-Karp                              |
|                      | [String Problem F](./Lab/lab5/ProblemF.cpp)               | Next Array                              |
| [lab6](./Lab/lab6/)   | [Leaves](./Lab/lab6/ProblemA.cpp)                         | Leaf Node                               |
| Tree                 | [Paths](./Lab/lab6/ProblemB.cpp)                          | Path between Root and Leaf Node         |
|                      | [Pre, in and post](./Lab/lab6/ProblemC.cpp)               | Tree Traversal                          |
|                      | [Cut the Stick](./Lab/lab6/ProblemD.cpp)                  | Min Heap/Huffman Tree                   |
|                      | [Giant](./Lab/lab6/ProblemE.cpp)                          | Search + Simulation                     |
|                      | [Node Activation](./Lab/lab6/ProblemF.cpp)                | Root Exchange DP                        |
| [lab7](./Lab/lab7)    | [Judgement](./Lab/lab7/ProblemA.cpp)                      | Heap                                    |
| Advanced Tree        | [Meet my friend HEAP!](./Lab/lab7/ProblemB.cpp)           | Heap Swap                               |
|                      | [We only want the smallest](./Lab/lab7/ProblemC.cpp)      | Heap + Greedy                           |
|                      | [Funny Fluffy Tuzi](./Lab/lab7/ProblemD.cpp)              | Heap + Simulation                       |
|                      | [Nth Element in Sliding Window](./Lab/lab7/ProblemE.cpp)  | AVL Tree + Nth Element                  |
|                      | [Pet Adoption](./Lab/lab7/ProblemF.cpp)                   | AVL Tree + Succeeder                    |
| [lab8](./Lab/lab9)    | [Adjacency Matrix](./Lab/lab8/ProblemA.cpp)               | Matrix Representation                   |
| Graph                | [Shortest Path](./Lab/lab8/ProblemB.cpp)                  | BFS                                     |
|                      | [Defensive Tower](./Lab/lab8/ProblemC.cpp)                | Simulation                              |
|                      | [Ancestor](./Lab/lab8/ProblemD.cpp)                       | DFS Order                               |
|                      | [Sum](./Lab/lab8/ProblemE.cpp)                            | Search                                  |
|                      | [The Elves](./Lab/lab8/ProblemF.cpp)                      | Traverse                                |
| [lab9](./Lab/lab9)    | [Travel](./Lab/lab9/ProblemA.cpp)                         | SPFA Shortest Path                      |
| Advanced Graph       | [Sign in Problem](./Lab/lab9/ProblemB.cpp)                | Kruskal Minimum Spanning Tree           |
|                      | [Game](./Lab/lab9/ProblemC.cpp)                           | Kruskal Maximum Spanning Tree           |
|                      | [Naive Problem](./Lab/lab9/ProblemD.cpp)                  | Dijstra + Multiple Source               |
|                      | [Simple Problem](./Lab/lab9/ProblemE.cpp)                 | Tarjan SCC                              |
|                      | [Portal](./Lab/lab9/ProblemF.cpp)                         | Dijstra + Layer                         |

