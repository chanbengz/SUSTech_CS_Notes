#import "template.typ": *

#show: project.with(
  title: "Algorithm Assignment 6",
  authors: (
    (
      name: "陈贲(12212231)",
    ),
  ),
)

#problem[
  #set enum(numbering: "(a)")
  Suppose you're managing a consulting team of expert computer hackers, and each week you have to choose a job for them to undertake. Now, as you can well imagine, the set of possible jobs is divided into those that are low-stress (e.g., setting up a Web site for a class at the local elementary school) and those that are high-stress (e.g., protecting the nation's most valuable secrets, or helping a desperate group of Cornell students finish a project that has something to do with compilers). The basic question, each week, is whether to take on a low-stress job or a high-stress job.

  If you select a low-stress job for your team in week $i$, then you get a revenue of $cal(l)_i > 0$ dollars; if you select a high-stress job, you get a revenue of $cal(h)_i > 0$ dollars. The catch, however, is that in order for the team to take on a high-stress job in week $i$, it's  required that they do no job (of either type) in week $i - 1$; they need a full week of prep time to get ready for the crushing stress level. On the other hand, it's okay for them to take a low-stress job in week $i$ even if they have done a job (of either type) in week $i - 1$.

  So, given a sequence of n weeks, a plan is specified by a choice of “low-stress,” “high-stress,” or “none” for each of the $n$ weeks, with the property that if “high-stress” is chosen for week $i > 1$, then "none" has to be chosen for week $i - 1$. (It's okay to choose a high-address job in wekk 1.) The value of the plan is determined in the natural way: for each $i$, you add $cal(l)_i$ to the value if you choose "low-stress" in wekk $i$, and you add $h_i$ to the value if you choose "high-stress" in week $i$. (You add 0 if you choose "none" in week $i$.)

  *The problem.* Given sets of values $cal(l)_1, cal(l)_2, dots, cal(l)_n$ and $cal(h)_1, cal(h)_2, dots, cal(h)_n$, find a plan of maximum value. (Such a plan will be called optimal.)

  + Show that the following algorithm does not correctly solve this problem, by giving an instance on which it does not return the correct answer. In your example, say what the correct answer is and what the algorithm returns.
  + Give an efficient algorithm that takes values for $cal(l)_1, cal(l)_2, dots, cal(l)_n$ and $cal(h)_1, cal(h)_2, dots, cal(h)_n$ as input and returns an optimal plan.
]

#solution[
  #set enum(numbering: "(a)")
  + The algorithm is short-sighted as if current high-stress job is bigger than the sum of previous low-stress jobs, it will definitely take it, without considering that next high-stress job may be even bigger. For example, #align(center, table(columns: 4, [], [Week 1], [Week 2], [Week 3], $cal(l)$, [2], [2], [2], $cal(h)$, [1], [4], [8]))The algorithm decides to take none in week1 to do high-stress job in week2, and then take low-stress job in week3, which gives $0 + 4 + 2 = 6$ as answer. However, the optimal solution is to take low-stress job in week1, then none in week2 and high-stress job in week3, which gives $2 + 0 + 8 = 10$ as answer.
  + To solve this problem correctly, we can use dynamic programming as it't current topic. We define $f(i)$ as the maximum value of revenue we can get by week $i$. Since the previous decision affects the current decision but not the future decision, the transition of function will becomes $ f(i) = max(f(i - 1) + cal(l)_i, f(i - 2) + cal(h)_i) $ which is to determine whether to take low-stress job in week $i$ or high-stress job in week $i$ and does nothing for week $i - 1$. After iterating $i$ from $1$ to $n$, the final answer will be $f(n)$.
]