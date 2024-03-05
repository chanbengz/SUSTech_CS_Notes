#import "template.typ": *

#show: project.with(
  title: "Algorithm Assignment 1",
  authors: (
    (
      name: "陈贲(12212231)",
    ),
  ),
)

#problem[
  In every instance of the Stable Matching Problem, there is a stable matching containing a pair $(m, w)$ such that $m$ is ranked first on the preference list of $w$ and $w$ is ranked first on the preference list of $m$. If it's true, explain shortly, otherwise, give a counterexample.
]

#solution[
  False. Counterexample: considering their preference lists
  #align(
    center,
    grid(
      columns: 2,
      column-gutter: 1cm,
      rows: (20pt, auto),
      text("Men's preference"),
      text("Women's preference"),
      table(
        columns: 4,
        align: center,
        [], $w_1$, $w_2$, $w_3$,
        $A$, $a$, $b$, $c$,
        $B$, $b$, $c$, $a$,
        $C$, $c$, $a$, $b$
      ),
      table(
        columns: 4,
        align: center,
        [], $m_1$, $m_2$, $m_3$,
        $a$, $B$, $C$, $A$,
        $b$, $C$, $A$, $B$,
        $c$, $A$, $B$, $C$
      )
    )
  )
  for every man $m$, if he chooses the women ranked first, then his partner will not match the one that ranked first and vice versa.
]

#problem[
  Consider an instance of the Stable Matching Problem in which there exists a man $m$ and a woman $w$ such that $m$ is ranked first on the preference list of $w$ and $w$ is ranked first on the preference list of $m$. Then in every stable matching $S$ for this instance, the pair $(m, w)$ belongs to $S$. If it's true, explain shortly, otherwise, give a counterexample.
]

#solution[
  True. If $(m,w)$ is not in $S$, then the matching has unstable factor since $m$ and $w$ prefer each other to their partners in $S$. Therefore, $(m,w)$ must be in $S$ if $S$ is stable matching.
]

#problem[
  Suppose two television networks $A$ and $B$ are competing for slots to air their shows which have rating. The networks will propose their schedule $S$ and $T$, where when the rating of one side are over than the other's, it will win the slot. We say that $(S,T)$ is stable if there's not another schedule $(S^prime, T)$ or $(S, T^prime)$ such that it will help one side with more slots. Is there always a stable matching? Solve the question by one of the two options:
  + Give an algorithm to find a stable matching
  + Give a counterexample to show that there's no stable matching in this case.
]

#solution[
  The problem is solved by (2). Counterexample: suppose network $A$ has programs with rating $(a_1, a_2) = (20, 40)$ and network $B$ with $(b_1, b_2) = (10, 30)$. Then they can make two schedules each
  $ S = (a_1, a_2) \
    S^prime = (a_2, a_1) \
    T = (b_1, b_2) \
    T^prime = (b_2, b_1)
  $
  When they reveal their schedules, one of them can switch its schedule if it is in disadvantage. For example, if $A$ reveals $S$ and $B$ reveals $T$, then $B$ can switch to $T^prime$ to win the first slot. Therefore, there's no stable matching in this case.
]

#problem[
  Suppose in the stable matching problem, the preference of a woman $w$ can be faked so as to make her partner $m$ better off. Can the woman get a better partner $m^(prime prime)$ by lying about her preferences where she exchanges her current partner $m$ and a worse $m^(prime)$ in the G-S algorithm. Solve the question by one of the two options:
  + Prove that switching the order of a preference list cannot improve the partner in the G-S algorithm
  + Give a example to show that a woman can get a better partner by lying about her preferences
]

#solution[
  The problem is solved by (2). Suppose we have the preference lists
    #align(
    center,
    grid(
      columns: 2,
      column-gutter: 1cm,
      rows: (20pt, auto),
      text("Men's preference"),
      text("Women's preference"),
      table(
        columns: 4,
        align: center,
        [], $w_1$, $w_2$, $w_3$,
        $A$, $c$, $a$, $b$,
        $B$, $a$, $c$, $b$,
        $C$, $c$, $a$, $b$
      ),
      table(
        columns: 4,
        align: center,
        [], $m_1$, $m_2$, $m_3$,
        $a$, $A$, $B$, $C$,
        $b$, $A$, $B$, $C$,
        $c$, $B$, $A$, $C$,
        $c^prime$, $B$, $C$, $A$
      )
    )
  )
  where $c^prime$ is the faked list of $c$. With the true list, the algorithm will return a stable matching
  $ S = {(A,c), (B,a), (C,b)} $
  since when $C$ is proposing, he was rejected by $a$ and $c$. But with the faked list, the algorithm will return a better matching for $c$
  $ S^prime = {(A,a), (B,c), (C,b)} $
  where $c$ is better off with $B$ than $A$ since when $C$ is proposing, he was accepted by $c$ and left $A$ alone, and then $A$ will seek for $a$, the second best choice of $A$ while $A$ is the best for $a$. And $a$ abandoned $B$ to choose $A$, so $B$ will choose the second choice $c$. Thus, a woman can get a better partner by lying about her preferences.
]
