#import "template.typ": *

#show: project.with(
  title: "Cryptography Homework 1",
  authors: (
    (
      name: "陈贲(12212231)",
    ),
  ),
)

#problem[
    The following is an encryption of English text using a shift cipher. Find the key and decrypt the ciphertext.

“O QFMDHCGMGHSA GVCIZR PS GSQIFS SJSB WT SJSFMHVWBU OPCIH HVS GMGHSA SLQSDH HVS YSM WG DIPZWQ YBCKZSRUS”
]

#solution[
  The shift cipher has a key space of barely 26. We can try all possible keys to decrypt the ciphertext. And by the observation that, the word with single letter could either be A or I, we can test these two possible result through the first letter to obtain the key. Using the tools provided by #link("http://www.xarg.org/tools/caesar-cipher/") we can decrypt the ciphertext, and the key is 12.

  "A CRYPTOSYSTEM SHOULD BE SECURE EVEN IF EVERYTHING ABOUT THE SYSTEM EXCEPT THE KEY IS PUBLIC KNOWLEDGE"
]

#problem[
  Prove that Deﬁnition 1.6 and Deﬁnition 1.7 on slides of Lecture 02 are equivalent.
]

#solution[
  Suppose that the plaintext space is $cal(M) = {x, x^prime}$. For arbitrary key $k attach(arrow.l, br: R) {0,1}^n$, let the cipher text $c = E n c_k (x), c^prime = E n c_k (x^prime)$. 
  Prove: Definition 1.6 $arrow.r$ Definition 1.7
  #par(first-line-indent: 0cm, "Suppose")
  $ exists x,x^prime in cal(M), space.quarter E n c_(U_n) (x) equiv.not E n c_(U_n) (x^prime) $
  which means there also exists a string $y_0$ such that
  $ Pr[Y_x = y_0] > Pr[Y_(x^prime) = y_0] $
  Then we can construct an attacker Eve such that
  $ E v e(y) = cases(x"," &"if" y = y_0, x_b attach(arrow.l, br: R) {x, x^prime}"," space.quad &"if" y eq.not y_0) $
  Thus, Eve has chances larger than $1 slash 2$ to obtain the correct plaintext. And this gives that
  $ not "Definition 1.7" arrow.r not "Definition 1.6" equiv "Definition 1.6" arrow.r "Definition 1.7" $
  Prove: Definition 1.7 $arrow.r$ Definition 1.6. Suppose we have
  $ E n c_(U_n) (x) equiv E n c_(U_n) (x^prime) $
  then Eve cannot distinguish them after seeing the ciphertext, and can only guess the plaintext with probability at most $1 slash 2$.
]

#problem[
  Let $n$ be a positive integer. The affine cipher modulo $n$ is deﬁned as follows. A key $(a, b)$ consists of an element $a in ZZ_n^*$ and an element $b in ZZ_n$. For a message $m ∈ ZZ_n$, the ciphertext is $C = E n c_((a,b))(m) = (a m + b) mod n$. If we randomly choose a key $(a, b)$ for each message $m$ to be encrypted, is this affine cipher perfectly secure? Explain your answer.
]

#solution[
  Perfectly secure. Since for every $m in ZZ_n$ and $c in ZZ_n$, we have
  $ Pr[E n c_((a,b)) (m) = c] = (|{a in ZZ_n^*, b in ZZ_n: (a times m + b) mod n = c}|) / (|ZZ_n^*| times |ZZ_n|) = 1 / n $
  over a random choice of $(a,b)$, so the distrubition is equivalent. For detailed explanation, the numerator is always $n - 1$, since for any $a in ZZ_n^*$ and $m in ZZ_n$
  we can consider $(a times m) mod n$ as a base element and $b$ as the offset of the group
  $ {b in ZZ_n: (a times m + b) mod n} $
  which is a permutation of $ZZ_n$, and where the cipher $c$ appears always. Thus, $c$ appears $|ZZ_n^*|$ times in the numerator. Therefore, affine cipher is perfectly secure.
]

#problem[
  Prove that ans encryption scheme $(G e n,E n c,D e c)$ with message space $cal(M)$ is perfectly secure if and only if
  $ Pr[E n c_K (m) = c] = Pr[E n c_K (m^prime) = c] $
  holds for every two $m, m^prime in cal(M)$ and every $c in cal(C)$
]

#solution[
  “If" part: Suppose we have a message $m in cal(M)$ and a ciphertext $c$ for which $Pr[C = c] > 0$. If $Pr[M = m] = 0$, then trivally
  $Pr[M=m | C= c] = Pr[M = m] = 0$.
  So, considering the case $Pr[M = m] > 0$, we have firstly
  $ Pr[C = c|M = m] = Pr[E n c_K (M) = c | M = m] = Pr[E n c_K (m) = c] $
  which denotes as $delta_c$. From the assumption we have for every $m^prime in cal(M)$
  $ Pr[E n c_K (m^prime) = c] = Pr[C = c| M = m^prime] = delta_c $
  Using Bayes' theorem, we have
  $ Pr[M=m|C=c] &= (Pr[C=c|M=m] dot Pr[M=m]) / (Pr[C=c]) \
    &= (Pr[C=c|M=m] dot Pr[M=m]) / (sum_(m^prime in cal(M)) Pr[C=c|M=m^prime] dot Pr[M=m^prime]) \
    &= (delta_c dot Pr[M=m]) / (sum_(m^prime in cal(M)) delta_c dot Pr[M=m^prime]) \
    &= (Pr[M=m]) / (sum_(m^prime in cal(M)) Pr[M=m^prime]) = Pr[M = m]
  $
  Thus, we have $Pr[M = m| C=c] = Pr[M=m]$, which means the encryption scheme is perfectly secure. For the "only if" part, suppose that we have two messages $m, m^prime$ and a ciphertext $c$ with nonzero probability. Then by Definition 1.6, we have
  $ Pr[M=m|C=c] = Pr[M=m^prime|C=c] = 1/2 $
  This is equivalent to
  $ Pr[M=m|C=c] &= (Pr[C=c|M=m] dot Pr[M=m]) / (Pr[C=c]) \ &= (Pr[C=c|M=m]) / (2dot Pr[C=c]) $
  which gives
  $ Pr[C=c|M=m] = Pr[E n c_k (m) = c] = Pr[C=c] $
  Similarly, we have $Pr[C=c|M=m^prime] = Pr[E n c_k (m^prime) = c] = Pr[C=c]$ which gives that the two sides are equivalent. Thus, the "only if" part is proved.
]

#problem[
  For an encryption scheme $(G e n,E n c,D e c)$, consider the following game:
  - Eve chooses $m_1, m_2, m_3 in {0,1}^l$.
  - Alice selects $k attach(arrow.l, br: R) {0,1}, i attach(arrow.l, br: R) {1,2,3}$ and gives Eve $c = E_k(m_i)$
  - Eve sends a number $j in {1,2,3}$
  Eve wins if $i = j$. Prove that $(G e n,E n c,D e c)$ is perfectly secure if and only if Eve can guess $i$ with probability at most $1/3$.
]

#solution[
  "If" part: Prove by contropositive. Suppose the scheme is not perfectly secure, which means that there exists a strategy for Eve to guess $m_i$ from $cal(M)$ with probability larger than $1 slash abs(cal(M))$. Then, w.l.o.g., we assume $x_1 = 0^l$ and $x_2 attach(arrow.l, br: R) cal(M)$. Then, for random key $k$, we have
  $ Pr[E v e(E n c_k (x_2)) = x_2] gt 1/abs(cal(M)) $
  But for every $k$, the decrypted message $E v e(E n c_k (x_1))$ is independent of $x_1$, so we have
  $ Pr[E v e(E n c_k (x_1)) = x_2] lt.eq 1/cal(M) lt Pr[E v e(E n c_k (x_2)) = x_2] $
  So for Eve's strategy, we have
  $
    E v e^prime (c) = cases(
      x_2"," &"if" E v e(c) = x_2,
      x_i attach(arrow.l, br: R) {m_1, m_2, m_3}"," &"otherwise"
    )
  $
  which gives that Eve can guess $i$ with probability larger than $1slash 3$.\
  "Only if" part: Suppose that the scheme is perfectly secure. Then by definition, we have
  $ Pr[M = m|C = c] = Pr[M = m] $
  which means Eve gains no information about the plaintext and can only guess $i$ with probability at most $1slash 3$.
]

#problem[
  Prove that the statistical distance $Delta(X,Y)$ is a metric.
]

#solution[
  Firstly, by the definition of statistical distance, we have
  $ Delta(X,X) &= max_(T subset.eq {0,1}^n) abs(Pr[X in T] - Pr[X in T]) = 0 $
  Then, for the symmetry, we have
  $
    Delta(X,Y) &= max_(T subset.eq {0,1}^n) abs(Pr[X in T] - Pr[Y in T]) \
    &= max_(T subset.eq {0,1}^n) abs(Pr[Y in T] - Pr[X in T]) \
    &= Delta(Y,X)
  $
  For the transitivity, by Lemma 2.3 from , we have
  $ Delta(X,Y) = 1/2 sum_(omega in S u p p(X) union S u p p(Y)) abs(Pr[X = omega] - Pr[Y = omega]) $
  and therefore,
  $
    Delta(X,Y) + Delta(Y,Z) &= 1/2 sum_(omega in S u p p(X) union S u p p(Y)) abs(Pr[X = omega] - Pr[Y = omega]) \
    &+ 1/2 sum_(omega in S u p p(Y) union S u p p(Z)) abs(Pr[Y = omega] - Pr[Z = omega]) \
    &gt.eq 1/2 sum_(omega in S u p p(X) union S u p p(Y) union S u p p(Z)) abs(Pr[X = omega] - Pr[Z = omega]) \
    &= 1/2 sum_(omega in S u p p(X) union S u p p(Z)) abs(Pr[X = omega] - Pr[Z = omega]) \
    &= Delta(X,Z)
  $
  Thus, the statistical distance is a metric.
]

#problem[
  Let ${X_n}, {Y_n}$ be sequences of distributions with $X_n$ and $Y_n$ ranging over ${0,1}^(p(n))$ for some polynomial $p(n)$ in $n$. ${X_n}$ and ${Y_n}$ are computationally indistinguishable $(X_n approx Y_n)$ if for every polynomial-time algorithm $A$ there is a negligible function $epsilon$ such that
  $ |Pr[A(X_n) = 1] - Pr[A(Y_n) = 1]| lt.eq epsilon(n) $
  Prove that the computationally indistinguishable relation is an equivalence relation.
]

#solution[
  Equivalence relation contains symmetry, reflexivity and transitivity.
  For symmetry, trivally, we have
  $ abs(Pr[A(X_n) = 1] - Pr[A(Y_n) = 1]) = abs(Pr[A(Y_n) = 1] - Pr[A(X_n) = 1]) $
  For reflexivity, by definition, we have
  $ abs(Pr[A(X_n) = 1] - Pr[A(X_n) = 1]) = 0 lt.eq epsilon(n) $
  For transitivity, we have firstly
  $ &abs(Pr[A(X_n) = 1] - Pr[A(Z_n) = 1]) \
  &= abs(Pr[A(X_n) = 1] - Pr[A(Y_n) = 1] + Pr[A(Y_n) = 1]- Pr[A(Z_n) = 1]) \
  &lt.eq abs(Pr[A(X_n) = 1] - Pr[A(Y_n) = 1]) + abs(Pr[A(Y_n) = 1]- Pr[A(Z_n) = 1])lt.eq 2 epsilon(n)
  $
  Since $epsilon(n)$ is negligible, we have
  $ abs(Pr[A(X_n) = 1] - Pr[A(Z_n) = 1]) lt.eq epsilon(n) $
  which is $X_n approx Z_n$ by definition if $X_n approx Y_n$ and $Y_n approx Z_n$. Thus, the computationally indistinguishable relation is an equivalence relation.
]
