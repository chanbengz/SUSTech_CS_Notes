#import "template.typ": *

#show: project.with(
  title: "Cryptography Homework 2",
  authors: (
    (
      name: "陈贲(12212231)",
    ),
  ),
)

#problem[
  In the following, $g(n)$ and $h(n)$ are both negligible functions, and $p$ is a polynomially-bounded function. For each function below, decide if the function is guaranteed to be negligible or not. If so, prove it. If not, provide an example of negligible $g$ and $h$ and polynomially bounded $p$ such that the function below is not negligible.
]

#solution[
  #set enum(numbering: "(a)")
  + Negligible. Proof: W.l.o.g., assume $g(n) lt.eq h(n)$. Then $f_a (n) = h(n)$, which is negligible.
  + Not negligible. Example: Since $g(n)$, by definition, $g(n) < 1slash p(n)$ and $f_b (n) = 1 slash p(n)$. Suppose $p(n) = n slash 2 lt n$, which is polynomially bounded. Then $f_b (n) = 1 slash p(n) = 2 slash n$, which is not negligible.
  + Negligible. Proof: W.l.o.g., assume $g(n) lt.eq h(n)$. Then $f_c (n) = g(n)$, which is negligible.
  + Negligible. Proof: By definition, $g(n) lt 1 slash p(n)$, then $f_d (n) = g(n)$ which is negligible.
  + Negligible. Proof: Since $g(n)$ and $h(n)$ are negligible, forall polynomial $p(n)$, there exists integers $N_1$ and $N_2$ such that $forall n > N_1, g(n) < 1 slash p(n)$ and $forall n > N_2, h(n) < 1 slash p(n)$. Let $N = max(N_1, N_2)$. Then $forall n > N, f_e (n) = g(n) + h(n) < 2slash p(n)$, which is negligible.
  + Negligible. Proof: Same as (e), $forall n > N, f_f (n) = g(n) h(n) < (1 slash p(n))^2 < p^prime (n)$, which is negligible.
  + Negligible. Proof: Since $g(n)$ is negligible, $forall p(n)$, there exists integer $N$ such that $forall n > N, g(n) < 1 slash p(n)$. Then it still holds that $g(n) < 1 slash p^2 (n)$ for some integer $N^prime$ since $p^2 (n)$ is polynomial. Thus, $forall n > N^prime, g(n)^(1 slash 2) lt p(n)$, which is negligible.
  + Not negligible. Example: Suppose $g(n) = 1 slash n^(log n)$ which is a negligible function, then $f_h (n) = 1 slash n$ which is not negligible.
]

#problem[
  Prove that property of computational indistinguishability: if $X_n approx Y_n$ and $f$ is a polynomial-time computable function, then $f(X_n) approx f(Y_n)$.
]

#solution[
  Since for every polynomial-time algorithm A and large number $n$, we have $X_n approx Y_n$, by definition, there exists a negligible function $epsilon$ such that
  $ abs(Pr[A(X_n) = 1] - Pr[A(Y_n) = 1]) lt epsilon(n) $
  Suppose we have a new algorithm $A^prime$ that will compute $f(X_n)$ and feed it into algorithm $A$. Then since $f$ and $A$ is polynomial-time computable, $A^prime$ becomes polynomial-time algorithm, which means
  $ abs(Pr[A^prime (X_n) = 1] - Pr[A^prime (Y_n) = 1]) lt epsilon^prime (n) $
  and it is equivalent to
  $ abs(Pr[A(f(X_n)) = 1] - Pr[A(f(Y_n)) = 1]) lt epsilon^prime (n) $
  Thus, $f(X_n) approx f(Y_n)$.
]

#problem[
  #set enum(numbering: "1.")
  Prove that if $(G e n, E n c, D e c)$ is a computationally secure encryption with $cal(l)(n)$-long messages, then for every polynomial-time algorithm Eve and large enough $n$, the probability that Eve wins in the following game is smaller than 0.34:
  + Eve gets as inputs $1^n$, and gives Alice three strings $x_0, x_1, x_2 in {0,1}^(cal(l)(n))$
  + Alice chooses a random key $k attach(arrow.l, br: R) {0,1}^n$ and $i attach(arrow.l, br: R) {0,1,2}$ and computes $y = E n c_k (x_i)$
  + Eve gets $y$ and outputs $j in {0,1,2}$
  + Eve wins if $j = i$
]

#solution[
  Since the scheme is compuattionally secure, by definition, it holds that
  $ abs(Pr[A(E_(U_n)(x_i)) = j] - Pr[A(E_(U_n)(x_j)) = k]) lt.eq epsilon(n) $
  where $i, j, k in {0,1,2}$. Specifically, we have for $k eq.not j$,
  $ Pr[A(E_(U_n)(x_k)) = j] gt.eq Pr[A(E_(U_n)(x_j)) = j] - epsilon $
  then we have
  $
    3 &= sum_(i,j in {0,1,2}) Pr[A(E_(U_n)(x_i)) = j] \
    &gt.eq 3 sum_(i = 0)^2 Pr[A(E_(U_n)(x_i)) = i] - 3 epsilon(n) \
  $
  which gives that for large number $n$,
  $ 1/3 sum_(i = 0)^2 Pr[A(E_(U_n)(x_i)) = i] lt.eq 1/3 + 1/3 epsilon(n) < 0.34 $
]

#problem[
  A sequence ${X_n}_(n in NN)$ of distributions is pseudorandom if it's computationally indistinguishable from the sequence ${U_n}$ where $U_n$ is the uniform distribution over ${0,1}^n$. Are the following sequences pseudorandom? Prove or refute it.
]

#solution[
  (1) No. Proof: We can construct a algorithm $A$ that can distinguish the two sequences. For a sequence ${x_i}$, check that $x_n = x_1 xor x_2 xor dots xor x_(n-1)$, and the boolean expression gives the output of $A$. So, we have
  $ abs(Pr[A(X_n) = 1] - Pr[A(U_n) = 1]) = abs(1 - 1 / 2) = 1 / 2 $
  which means we can distinguish it from the uniform distribution and it's not pseudorandom. \ \
  (2) Yes. Proof: For small $n$, $Z_n$ has the same distribution as $U_n$, and for large $n$, $Z_n$ has the probability of $1 - 2^(-n slash 10)$ to be the same as $U_n$. Thus, for every algorithm $A$, it can be distinguished only when the plaintext appears and we have
  $ abs(Pr[A(Z_n) = 1] - Pr[A(U_n) = 1]) = abs(1 / 2 (1-2^(-n slash 10)) + 2^(-n slash 10) - 1 / 2 ) lt 2^(-n slash 10) $
  since $2^(-n slash 10)$ is negligible, the sequences are pseudorandom.
]

#problem[
  Let $G$ be a pseudorandom generator where $abs(G(s)) > 2abs(s)$. Take $s = s_1 dots s_n$, and for simplicity, $n$ is even.
  + Define $G^prime (s) colon.eq G(s 0^(abs(s)))$. Is $G^prime$ nessessarily a pseudorandom generator?
  + Define $G^prime (s) colon.eq G(s_1 dots s_(n slash 2))$, where $s = s_1 dots s_n$. Is $G^prime$ nessessarily a pseudorandom generator?
]

#solution[
  (1) No. Proof: By contradiction, if $G^prime$ is a PRG, then $G(0^abs(s))$ will also be a PRG. However, we can construct a distinguisher $D$ such that with random input $i$, it evaluates to 1 if $r = G(0^n)$ where $abs(i) = cal(l) (n)$. The distinguisher succeed with probability $1 - 2^(-abs(r))$ which is not negligible and contrary to the assumption. Thus, $G^prime$ is not PRG. \ \
  (2) Yes. Proof: Suppose for a probabilistic polynomial-time distinguisher $D$, we define
  $ epsilon^prime (n) colon.eq abs(attach(Pr, br: r arrow.l {0,1}^(cal(l)(n)))[D(r) = 1] - attach(Pr, br:s arrow.l {0,1}^n)[D(G^prime (s)) = 1]) $
  From the definition of $G^prime$, for a seed $s^prime$ with the first half of $s$ and zeros for the rest $n slash 2$, then
  $ attach(Pr, br: s arrow.l {0,1}^(n slash 2))[D(G^prime (s)) = 1] = attach(Pr, br:s arrow.l {0,1}^(n slash 2))[D(G(s^prime)) = 1] $
  since $G$ is a PRG, specifically, we have
  $ abs(attach(Pr, br: r arrow.l {0,1}^(cal(l)(n)))[D(r) = 1] - attach(Pr, br:s arrow.l {0,1}^(n slash 2))[D(G (s_1 dots s_(n slash 2) dot 0^(n slash 2))) = 1]) lt.eq epsilon(n slash 2) $
  substituting the above equation, we have
  $ epsilon(n slash 2) = epsilon^prime (n) arrow.r.double epsilon^prime "is negligible function" $
  Thus, by the definition of PRG, $G^prime$ is a PRG.
]

#problem[
  Define the keyed, length-preserving function $F_k$ by $F_k (x) = F(k, x) = k xor x$. It's known that for any input $x$, the value of $F_k (x)$ is uniformly distributed if $k$ is uniformly chosen. Prove of disprove that $F_k$ is a PRF or not.
]

#solution[
  No. Proof: By definition, we can construct a distinguisher $D$ and a random oracle $cal(O)$: for two distinct values $x_1, x_2$ generated by $F_k$, the oracle obtains two values $y_1 = cal(O) (x_1)$ and $y_2 = cal(O) (x_2)$. The $D$ will evaluate to 1 if it finds $F_k = k xor x$, i.e., $y_1 xor y_2 = x_1 xor x_2$. If $cal(O) = F_k$, $D$ evaluates to 1, otherwise, $cal(O) = f$ where $f$ is a uniformly random function, $D$ evaluates to 1 when $f(x_1) xor f(x_2) = x_1 xor x_2$, which is equivalent to $f(x_1) = x_1 xor x_2 xor f(x_2)$ with probability $2^(-n)$, by definition, $abs(1 - 2^(-n))$ is not negligible, thus $F_k$ is not a PRF.
]

#problem[
  Prove that if $F_k$ is a length-preserving PRF, then
  $ G(S) = F_s (angle.l 1 angle.r) bar.v F_s (angle.l 2 angle.r) bar.v dots bar.v F_s (angle.l cal(l) angle.r) $ is a PRG with expansion factor $cal(l) dot n$, where $angle.l i angle.r$ denotes the $n$-bit binary expression of the integer $i$.
]

#solution[
  Proof: Suppose $G$ is not a PRG, then there exists a distinguisher $D$ that can distinguish $G$ from uniformly random string with non-negligible probability and an oracle. So, we can construct an adversary $D^prime$ that can distinguish $F_k$ with the follwoing strategy: takes 1s as input, and queries the oracle $cal(l)$ times to compute $y = cal(O)(angle.l 1 angle.r) bar.v cal(O)(angle.l 2 angle.r) bar.v dots.c bar.v cal(O)(angle.l cal(l) angle.r)$. Then $D^prime$ evaluates to 1 if $D(y) = 1$, otherwise 0. By definition, since $D$ is a PPT distinguisher, we have
  $
    abs(attach(Pr, br:s arrow.l {0,1}^n)[D^(prime F_s (dot.c)) (1^n) = 1] - attach(Pr, br: s arrow.l {0,1}^n)[D^(prime f(dot.c)) (1^n) = 1])
  $
  $
    &= abs(attach(Pr, br:s arrow.l {0,1}^n)[D(F_s(angle.l 1 angle.r) bar.v dots.c bar.v F_s (angle.l cal(l) angle.r)) = 1] - attach(Pr, br:f arrow.l "Func"_n)[D(F_s (angle.l 1 angle.r) bar.v dots.c bar.v F_s(angle.l cal(l) angle.r)) = 1]) \
    &= abs(attach(Pr, br:s arrow.l {0,1}^n)[D(G(s)) = 1] - attach(Pr, br:r_i arrow.l {0,1}^n)[D(r_1 bar.v dots.c bar.v r_cal(l)) = 1]) \
    &= abs(attach(Pr, br:s arrow.l {0,1}^n)[D(G(s)) = 1] - attach(Pr, br:r arrow.l {0,1}^(cal(l) dot.c n))[D(r) = 1]) gt.eq epsilon(n)
  $
  the adversary $D^prime$ is a efficient distinguisher, and thus $F_k$ is not a PRF. Therefore, by reduction, if $F_k$ is a PRF, then $G$ is a PRG.
]

#problem[
  Consider a variant of CBC-mode encryption where the sender simply increments the IV by 1 each time a message is encrypted (rather than choosing IV at random). Show that the resulting scheme is not CPA-secure.
]

#solution[
  By the definition of CPA security, suppose we have two fixed messages $m_0 = 0^n, m_1 arrow.l {0,1}^n$. We can construct a adversary $D$ with non-negligible probability to win: query the encryption oracle to get $cal(O)(0^(n-1) 1) = angle.l I V, c angle.r$. If the $I V$ is even, then $I V + 1 = I V xor 0^(n-1) 1$, and therefore, $c = F_k (I V xor 0^(n-1) 1) = F_k (I V + 1)$. Suppose the challenge ciphertext is $c^prime$, if $c = c^prime$, $D$ outputs 0 since $F_k (I V + 1) = F_k ((I V + 1) xor 0^n)$. If the $I V$ is odd, the adversary outputs a random bit and has $1 slash 2$ chance to win. The adversary $D$ has non-negligible probability to win, and thus the scheme is not CPA-secure.
]

#problem[
  Consider a variant of CBC-mode encryption called chained CBC mode, where the last block of the previous ciphertext is used as the IV for the next message. It reduced the bandwidth, since the IV need not be sent. An initial message $m_1, m_2, m_3$ is encrypted using a random IV and subsequent messages $m_4, m_5$ is encrypted using $c_3$ as the IV. However, the chained CBC mode is not as secure as CBC mode. Show a chosen-plaintext attack scheme.
]

#solution[
  Suppose the adversary $A$ knows the messages $m_1 in {m_0^1, m_1^1}$, after getting the first responces $angle.l I V, c_1, c_2, c_3 angle.r$, the adversary requests the encryption oracle to encrypt $m_4 = I V xor m_0^1 xor c_3$ and $m_5 arrow.l {0,1}^n$. The adversary can determine that if $c_4 = c_1$, then $m_1 = m_0^1$ since
  $ c_4 = F_k (m_4 xor c_3) = F_k (I V xor m_0^1 xor (c_3 xor c_3)) = F_k (I V xor m_0^1) $
  so the adversary can win with non-negligible probability.
]
