#import "template.typ": *

#show: project.with(
  title: "Algorithm Assignment 2",
  authors: (
    (
      name: "陈贲(12212231)",
    ),
  ),
)

#problem[
  Suppose you have algorithms with the five running times listed below. (Assume these are the exact running times.) How much slower do each of these algorithms get when you (a) double the input size, or (b) increase the input size by one?
  + $n^2$
  + $n^3$
  + $100n^2$
  + $n log n$
  + $2^n$
]

#solution[
  The time complexity is given below
  #align(
    center,
    table(
      columns: 6,
      align: center,
      [Input Size], $n^2$, $n^3$, $100n^2$, $n log n$, $2^n$,
      $n$, $n^2$, $n^3$, $100n^2$, $n log n$, $2^n$,
      $2n$, $4n^2$, $8n^3$, $400n^2$, $2n log 2n$, $4^n$,
      $n+1$, $(n+1)^2$, $(n+1)^3$, $100(n+1)^2$, $(n+1) log (n+1)$, $2^(n+1)$,
    )
  )
  From the table, we can see that (a) is slower by a factor of 4, 8, 4, 2, $2^n$, and (b) is slower by a additive of $2n+1$, $3n^2 + 3n + 1$, $200 n +100$, $log(n+1)$ and a factor of 2, respectively.
]

#problem[
  Assume you have functions $f$ and $g$ such that $f(n)$ is $O(g(n))$. For each of the following statements, decide whether you think it is true or false and give a proof or counterexample.
  + $log_2 f(n)$ is $O(log_2 g(n))$
  + $2^f(n)$ is $O(2^g(n))$
  + $f(n)^2$ is $O(g(n)^2)$
]

#solution[
  + False. Counterexample: if we have $f(n) = 2$ and $g(n) = 1$, where $f(n)$ is $O(g(n))$ for $c = 1/2$, but $log_2 f(n) = 1$ and $log_2 g(n) = 0$, which is not $O(log_2 g(n))$.
  + False. Counterexample: if we have $f(n) = n$ and $g(n) = 2n$, where $f(n)$ is $O(g(n))$ for $c = 1/2$, but $2^f(n) = 2^n$ and $2^g(n) = 2^(2n) = 4^n$, so $f(n)$ is not $O(2^g(n))$ since there's no constant $c$.
  + True. Proof: if $f(n)$ is $O(g(n))$, then there exists a constant $c$ such that $f(n) lt.eq c dot g(n)$. Then $f(n)^2 lt.eq c^2 g(n)^2$, which means $c^prime = c^2$, so $f(n)^2$ is $O(g(n)^2)$.
]
