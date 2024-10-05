#import "template.typ": *

#show: project.with(
  title: "Compiler Assignment 2",
  authors: (
    (
      name: "陈贲(12212231)",
    ),
  ),
)

You have seen the following two regular expressions in the previous assignment. Now you are required to complete two exercises related to the languages represented by the two regular expressions. The alphabet contains three symbols: `a`, `b`, `c`.
+ $a(b a)^* c$
+ $b a^+ | a b^*$

#problem[
Convert the above two regular expressions to NFAs using the Thompson’s Construction Algorithm (Algorithm 3.23 in the dragon book). Please put down the detailed steps and #underline(stroke: 0.5pt)[*DO NOT*] optimize the NFAs.
]

#solution[ Regular expression: $a(b a)^* c$. Basic rules for `a`, `b` and `c`.
#figure(
  image("img/exercise1-1.svg")
)
Concatenate `b` and `a` and then Kleene closure.
#figure(
  image("img/exercise1-2.svg", width: 80%)
)
And finally the NFA for the regular expression.
#figure(
  image("img/exercise1-3.svg", width: 100%)
)
Similarly, the NFA for the regular expression $b a^+ | a b^*$ has the same basic rules. The positive closure of $a^+$ is equivalent to $a a^*$, i.e., concatenate $a$ and $a^*$. So the NFA for the both side of union is
#figure(
  image("img/exercise1-4.svg", width: 85%)
)
And finally union the two NFAs will get the NFA for the regular expression.
#figure(
  image("img/exercise1-5.svg", width: 70%)
)
]

#problem[
Convert the NFAs constructed in Exercise 1 to DFAs using the Subset Construction Algorithm (Algorithm 3.20 in the dragon book). Please put down the detailed steps and #underline(stroke: 0.5pt)[*DO NOT*] optimize the DFAs.
]

#solution[
Firstly, calculate the $epsilon$-closure of the start state and iteratively update DFA states.
$
epsilon"-closure"(i) = {i} = A \
epsilon"-closure"("move"(A, a)) = {0, 1, 4} = B \
epsilon"-closure"("move"(B, a)) = {2} = C \
epsilon"-closure"("move"(B, c)) = {f} = D \
epsilon"-closure"("move"(C, b)) = {1, 3, 4} = E \
epsilon"-closure"("move"(E, a)) = {2} = C \ 
epsilon"-closure"("move"(E, c)) = {f} = D
$
Then the transition table will be
#table(
  columns: (auto, 1fr, 1fr, 1fr),
  align: center,
  [State S], [$epsilon$-closure(move(S, a))], [$epsilon$-closure(move(S, b))], [$epsilon$-closure(move(S, c))],
  [A], [B], [/], [/],
  [B], [C], [/], [D],
  [C], [/], [E], [/],
  [D], [/], [/], [/],
  [E], [C], [/], [D]
)
#par(first-line-indent: 0em, "So the DFA constructed from the above states and transition will be")
#figure(
  image("img/exercise2-1.svg", width: 60%)
)
Similarly, the DFA for the regular expression $b a^+ | a b^*$ will start from calculating the $epsilon$-closures
$
epsilon"-closure"(i) = {0, 3} = A \
epsilon"-closure"("move"(A, a)) = {4, f} = B \
epsilon"-closure"("move"(A, b)) = {1} = C \
epsilon"-closure"("move"(B, b)) = {4, f} = B \
epsilon"-closure"("move"(C, a)) = {2, f} = D \
epsilon"-closure"("move"(D, a)) = {2, f} = D
$
#par(first-line-indent: 0em, "Then the transition table will be")
#table(
  columns: (auto, 1fr, 1fr),
  align: center,
  [State S], [$epsilon$-closure(move(S, a))], [$epsilon$-closure(move(S, b))],
  [A], [B], [C],
  [B], [/], [B],
  [C], [D], [/],
  [D], [D], [/]
)
#par(first-line-indent: 0em, "So the DFA constructed from the above states and transition will be")
#figure(
  image("img/exercise2-2.svg", width: 45%)
)
]

#problem[
Please pick a DFA you have constructed for the above two languages and follow the State-Minimization Algorithm (Algorithm 3.39 in the dragon book) to minimize the number of states in the DFA. There might be chances that the built DFA is already minimum and in that case you should justify why it is already minimum. Note that the algorithm is not covered during lectures and you need to study it by yourself.
]

#solution[
We can minimize the second DFA constructed in Exercise 2. Firstly, by the algorithm 3.39, we partition the states into two groups: $F = {A, C}, P = {B, D}$ where one of them is the final state and the other is not. Then we can merge the states in $P$ to get a new state $E$ since they accept the same input `a`, after which it's sufficient to be minimized. So the minimized DFA will be
#figure(
  image("img/exercise3-1.svg", width: 55%)
)
]
