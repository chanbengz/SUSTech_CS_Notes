#import "template.typ": *

#show: project.with(
  title: "Cryptography Homework 4",
  authors: (
    (
      name: "陈贲(12212231)",
    ),
  ),
)

#problem[
  Let $G e n, H$ be a collision-resistant hash function with inputs of arbitary size. We define a MAC for arbitary-length message by
  $ M a c_(s, k) (m) = H^s (k bar.double m) $
  Show that this is not a seure MAX if $H$ is constructed by the Merkle-Damgard transform from an arbitary collision-resistant hash function $h$.
]

#solution[
  We can construct an efficient adversary $A$ that can break the MAC. Suppose $A$ has the hash function $h$ and access to the MAC, then $A$ can break the MAC by the following steps:
  + Query the MAC with an arbitary message $m = {0,1}^n$ and obtain the tag $t = M a c_k (m) = H(k bar.double m) = h(k bar.double m)$
  + Construct a new message $m^prime = m bar.double t$, and forge the tag $t^prime = h(t bar.double t)$
  + Since $H$ is constructed by the Merkle-Damgard transform from $h$, we have $ M a c_k (m^prime) &= H(k bar.double m^prime) = H(k bar.double m bar.double t) \ &= h(h(k bar.double m) bar.double t) = h(t bar.double t) = t^prime $
  Thus, the attack always succeeds, and the MAC is not secure.
]

#problem[
  #set enum(numbering: "1.")
  + We say that a number $y in ZZ_n^*$ is a quadratic residue (QR) if $y = x^2$ for some $x in ZZ_n^*$. Prove that the set of QRs is a subgroup of $ZZ_n^*$.
  + Let $p > 1$ be a prime. It can be shown that $(ZZ_p^*, times_p)$ is a cyclic group, that is, there exists a generator $g in ZZ_p^*$ such that $ZZ_p^* = {g^1, g^2, dots, g^(p-1)}$. For $y in ZZ_p^*$, let $log_g (y)$ denote the smallest nonnegative integer $i$ where $g^i = y$. Show that $y$ is a QR in $ZZ_p^*$ if and only if $log_g (y)$ is even.
]

#solution[
  #set enum(numbering: "1.")
  + 
]

#problem[
  Formally define the CDH assumption. Prove that hardness of the CDH problem relative to $cal(G)$ implies hardness of the discrete logarithm problem relative to $cal(G)$, and that the hardness of the DDH problem relative to $cal(G)$ implies hardness of the CDH problem relative to $cal(G)$.
]

#solution[

]

#problem[
  The discrete logarithm problem is easy in $(ZZ_N, +_N)$ for any integer $N$ and for any generator. Explain this.
]

#solution[

]

#problem[
  #set enum(numbering: "1.")
  Consider the cyclic group $ZZ_17^* = {1,2,dots,16}$ and the mapping $f$ defined by $f(x) = x^2 mod 17$ for all $x$ in the group.
  + What is the size of the image set of $f$, i.e., the set $S = {f(x) colon x in ZZ_17^*}$?
  + How many generators are there in $ZZ_17^*$?
  + Pick a generator $g$. What is the probability that, for a randomly chosen $a,b in {0,1,dots,15}$, the value of $g^(a b)$ is in $S$?
]

#solution[

]

#problem[
  When $p$ and $q$ are distinct odd primes and $N = p q$, the elements in $ZZ_N^*$ have either 0 or 4 square roots. A
]

#solution[

]

#problem[

]

#solution[

]

#problem[

]

#solution[

]

#problem[

]

#solution[

]

#problem[

]

#solution[

]
