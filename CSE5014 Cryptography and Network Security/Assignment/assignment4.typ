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
  + We say that a number $y in ZZ_n^*$ is a quadratic residue $(Q R)$ if $y = x^2$ for some $x in ZZ_n^*$. Prove that the set of QRs is a subgroup of $ZZ_n^*$.
  + Let $p > 1$ be a prime. It can be shown that $(ZZ_p^*, times_p)$ is a cyclic group, that is, there exists a generator $g in ZZ_p^*$ such that $ZZ_p^* = {g^1, g^2, dots, g^(p-1)}$. For $y in ZZ_p^*$, let $log_g (y)$ denote the smallest nonnegative integer $i$ where $g^i = y$. Show that $y$ is a QR in $ZZ_p^*$ if and only if $log_g (y)$ is even.
]

#solution[
  #set enum(numbering: "1.")
  + For closure, we have that if $a = x^2$ and $b = y^2$ for $x, y in ZZ^*_n$, $a dot b = x^2 dot y^2 = (x y)^2 in Q R$. For identity element, since $a dot 1^2 = (1 dot x)^2 = a in Q R$ and $1 = 1^2 in Q R$, 1 is the identity element. For commutativity, if $a, b, c in Q R$, then we have $(a dot b) dot c = a dot (b dot c)$, since $(x^2 dot y^2) dot z^2 = (x y z)^2 = x^2 dot (y^2 dot z^2)$ for $x, y, z in ZZ^*_n$. For inverses, since we have $x$ and its inverse $x^(-1)$ in $ZZ^*_n$, if $a = x^2$, then the inverse of $a$ is $(x^(-1))^2 = x^(-2) = (x^2)^(-1) = a^(-1) in Q R$.
  + For the only if part, Suppose that $y = x^2 in Q R$ and a generator $g in Z^*_p$, if we have $x = g^i$ for some $i in [0, p - 2]$, then $y = x^2 = g^(2i)$ which gives that $log(y) = 2i$, i.e., $log(y)$ is even. For the if part, if $log(y)$ is even, then we have $log(y) = 2i$ for some $i in [0, p - 2]$, which gives that $y = g^(2i) = (g^i)^2 = x^2$ and $y = x^2 in Q R$ definitely.
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
  Given a integer $g$ of the group $ZZ^+_N$ for any integer $N$, we have that $y = x g mod N$ for any $x, y in ZZ^+_N$. The discrete logarithm in that group is to find the $x$ of corresponding $y$. Since $g$ is generator, we have that $gcd(g, N) = 1$ definitely, so $g$ has a inverse $g^(-1)$ in $ZZ^+_N$. Thus, we can find $x$ by calculating $x = y g^(-1) mod N$. The inverse of $g$ can be found easily by the extended Euclidean algorithm in $O(log n)$ time. Thus, the discrete logarithm can be solved in polynomial time.
]

#problem[
  #set enum(numbering: "1.")
  Consider the cyclic group $ZZ_17^* = {1,2,dots,16}$ and the mapping $f$ defined by $f(x) = x^2 mod 17$ for all $x$ in the group.
  + What is the size of the image set of $f$, i.e., the set $S = {f(x) colon x in ZZ_17^*}$?
  + How many generators are there in $ZZ_17^*$?
  + Pick a generator $g$. What is the probability that, for a randomly chosen $a,b in {0,1,dots,15}$, the value of $g^(a b)$ is in $S$?
]

#solution[
#set enum(numbering: "1.")
  + $abs(S) = 8$. Since $i^2 equiv (17 - i)^2 mod 17$ for $i in [1,8]$, two elements in $ZZ_17$ map to one in $S$.
  + 8 generators. Since the elements whose order is $15$ are generators, there are $phi(phi(17)) = 8$.
  + $3 slash 4$. Since $g^(a b) in S$ if and only if $a b$ is even, we have that $a b$ is even if and only if $a$ or $b$ is even. Thus, the probability is $1 - 1 slash 4 = 3 slash 4$.
]

#problem[
  When $p$ and $q$ are distinct odd primes and $N = p q$, the elements in $ZZ_N^*$ have either 0 or 4 square roots. A quarter of the elements have 4 square roots; the rest have no square root. The four square roots of $x in ZZ^*_N$ look like $plus.minus a, plus.minus b$. Suppose that you are given an efficient deterministic algorithm $A$ that, on input $x$ that has square roots, finds some square root. If $x$ does not have a square root, it returns $bot$. Use $A$ to make an efficient probabilistic algorithm $A^prime$ that factors $N$.
]

#solution[
  #set enum(numbering: "1.")
  The algorithm $A^prime$ works as follows:
  + Choose randomly $x$ from $ZZ_N$, see if $x$ is in $ZZ^*_N$
  + If not, then we have immediately $gcd(x, N) eq.not 1$, thus to find the factor of $N$.
  + Then, computes $y = x^2 mod N$ and runs $A$ on input $y$.
  + $A$ returns $z$, then if $z = plus.minus x$ go back to the first steps
  + Otherwise, since we have $z^2 equiv x^2 mod N$, we can factor N by calculating $gcd(N, (z - x) mod N)$ which is a nontrivial factor of $N$.
  Since $A$ is efficient and $x$ is randomly chosen, the algorithm $A^prime$ is probabilistic algorithm that has a non-negligible probability of factoring $N$. The probability that $A^prime$ succeeds is $ Pr[A^prime (1^n) = 1] = 2 / 2^N + (2^N - 2) / (2 times 4 times 2^N) approx 1 / 8 $
  which is the probability that finds factors of $N$ and find $x$ using $A$.
]

#problem[
  Describe a man-in-the-middle attack on the Diffie-Hellman key exchange protocol where the adversary shares a key $k_A$ with Alice and a different key $k_B$ with Bob, and Alice and Bob cannot detect that anything is wrong.
]

#solution[

]

#problem[
#set enum(numbering: "(a)")
  Consider the following key-exchange protocal:
  + Alice chooses uniform $k, r in {0,1}^n$, and sends $s := k xor r$ to Bob
  + Bob chooses uniform $t in {0,1}^n$, and sends $u := s xor t$ to Alice.
  + Alice computes $w := u xor r$ and sends $w$ to Bob.
  + Alice ouputs $k$ and Bob output the same key. Analyze the security of the scheme.
]

#solution[

]

#problem[
  Show that the regular RSA signature scheme is arbitary forgeable if the attacker is allowed to ask the signing oracle. Note that the challeng message $m$ cannot be queried to the signing oracle.
]

#solution[
#set enum(numbering: "1.")
  Given the message $m$ and public key $(N, e)$, the attacker can forge the signature $sigma$ by doing the following steps:
  + Choose a random $s in ZZ^*_N$
  + Query the signing oracle with $m^prime = m dot s^e mod N$ and obtain the signature $sigma^prime$
  + The oracle returns $sigma^prime = (m dot s^e)^d mod N = m^d dot s^(e d) mod N = m^d dot s mod N$
  + Finally, obtain the signature $sigma = m^d mod N = sigma^prime dot s^(-1) mod N$
  Since $s^(-1)$ is the inverse of $s$ in $ZZ^*_N$, which can be easily computed, the attacker can efficiently forge the signature $sigma$.
]

#problem[
  Recall the El Gamal encryption scheme: the public key is $(p, g, h)$, where $g$ is a generator of $Z^*_p$ and $h = g^x$, and the private key is $x$; the encryption scheme is $E n c(m) = (g^y, h^y dot m)$. where $y attach(arrow.l, br: R) Z^*_p$; the decryption scheme is $D e c(c_1, c_2) = c_2 slash c_1^x$. The El Gamal signature scheme is: to sign a message $m$, choose the key $k attach(arrow.l, br: R)$ with $gcd(k, p - 1) = 1$, $ sigma = S i g n_(s k) (m) = (r, m) = (g^k, k^(-1) (m - r x) mod (p - 1)) $

  To verify the signature $sigma = (r, s)$, it is accepted if $h^r r^s = g^m$.
  + Show that the El Gamal encryption scheme is not secure against chosen-ciphertext attacks.
  + Is El Gamal signature scheme secure against chosen-message attack if the hash-and-sign paradigm is used?
  + Assume that the hash-and-sign paradigm is not used. Can we forge a signature for any given message $m$ by asking the signing oracle?
]

#solution[
  + We construct an efficient adversary $A$ that breaks it with CPA by doint the steps: $A$ receives the challenge ciphertext $c := (c_1 = g^y, c_2 = h^y dot m)$, then it chooses a random $r, m^prime in Z^*_p$ and queries the oracle with $c^prime = (c_1 dot g^r, c_2 dot m^prime dot h^r)$. Since $c^prime_1 = g^(y + r)$ and $c^prime_2 = m dot m^prime dot h^(y + r)$, the oracle returns the plaintext $m m^prime$, and thus, $A$ can get the message $m$ by simply multiplying a inverse of $m^prime$.
  + The hash-and-sign signature scheme is secure against chosen-message attack. The signature scheme will replace $m$ with $"hash"(m)$. Since to forge a signature, the adversary must find a message $m^prime$ such that $"hash"(m^prime) = m$, in order to forge the signature of $m$ by querying the oracle with message $m^prime.double = "hash"(m^prime)$. If the hash function is collision-resistant, the adversary has a negligible probability of success.
  + 
]
