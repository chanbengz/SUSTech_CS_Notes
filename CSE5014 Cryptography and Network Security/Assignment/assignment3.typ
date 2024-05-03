#import "template.typ": *

#show: project.with(
  title: "Cryptography Homework 3",
  authors: (
    (
      name: "陈贲(12212231)",
    ),
  ),
)

#problem[
  Let $Pi = (G e n, E n c, D e c)$ be the CTR mode encryption scheme and $attach(limits(Pi), t: tilde.op) = (G e n, E n c, D e c)$ be the encryption scheme obtained from $Pi$ by using a truly random function $f$ instead of a pseudorandom function $F_k$. Show that there is a negligible function $n e g l$, such that for any PPT adversary $A$, it holds that
  $ abs(Pr[P r i v K^(C P A)_(A,Pi) (n) = 1] - Pr[P r i v K^(C P A)_(A, attach(limits(Pi), t: tilde.op)) (n) = 1]) lt.eq n e g l(n) $
]

#solution[
  Proof by reduction. Suppose that for some PPT adversary $A$, it holds that
  $ abs(Pr[P r i v K^(C P A)_(A,Pi) (n) = 1] - Pr[P r i v K^(C P A)_(A, attach(limits(Pi), t: tilde.op)) (n) = 1]) gt p(n) $
  where $p(n)$ is a non-negligible function. The we can construct a efficient distinguisher $D$ that can distinguish between $F_k$ and a truly random function $f$ with non-negligible advantage. The distinguisher $D$ works as follows:
  + Run the adversary $A(1^n)$. Firstly, choose a uniformly random number $c t r in {0,1}^n$ as the initial value. Then query its oracle $cal(O)$ with $j = 1,dots, cal(l)$ and get the outputs $y_j = cal(O) (c t r + j)$. The adversary receives the ciphertext blocks $angle.l c t r, y_1 xor m_1, dots, y_cal(l) xor m_cal(l) angle.r$.
  + The adversary sends two message $m_0, m_1$ by the form of blocks. And $D$ generate a random bit $b$ and sends challenge ciphertext blocks $angle.l c t r^prime, y^prime_1 xor m^prime_1, dots, y^prime_cal(l) xor m^prime_cal(l) angle.r$ to $A$, $A$ will do step (1) until outputs a bit $b^prime$.
  + $D$ evaluates to 1 if and only if $b = b^prime$, and 0 otherwise.
  #par(first-line-indent: 0cm, "Thus, we have a PPT distinguisher such that")
  $ abs(Pr[D^(F_k) (1^n)] - Pr[D^f (1^n)]) > p(n) $
  which contradicts that $F_k$ is a PRF.
]

#problem[
  #set enum(numbering: "(a)")
  Let $F_k$ be a PRF and $G$ be a PRG with expansion factor $n arrow.r.bar n + 1$. For each of the following encryption schemes, decide whether the scheme has indisguishable encryptions in the presence of an eavesdropper and whether it is CPA-secure. Explain your answers.
  + To encrypt $m in {0,1}^n$, output the ciphertext $m xor F_k (0^n)$
  + One-time Pad.
  + To encrypt $m in {0,1}^(n+1)$, choose uniform $r in {0,1}^n$ and output the ciphertext $angle.l r, G(r) xor m angle.r$
  + To encrypt $m in {0,1}^(2n)$, parse $m$ as $m_1bar.double m_2$ with $abs(m_1) = abs(m_2) = n$, then choose uniform $r in {0,1}^n$ and output the ciphertext $angle.l r, m_1 xor F_k(r), m_2 xor F_k(r + 1) angle.r$.
]

#solution[
  #set enum(numbering: "(a)")
  + The scheme has indisguishable encryptions. Since $F_k (0^n)$ is pseudorandom, the scheme is equivalent to the one-time pad for that we have $k attach(arrow.l, br: R) {0,1} ^ n equiv F_k (0^n)$, and the encryption is $c = m xor k$. The one-time pad is perfectly secure, so the scheme is indisguishable. The scheme is not CPA-secure since if the adversary queries with message $m_0 = 0^n$ and $m_1 = {0,1}^n$, $A$ can obtain the key with $k = c_i xor m_i $, i.e., the encryption is determinstic.
  + The scheme has indisguishable encryptions, since one-time pad is perfectly secure. The scheme is not CPA-secure since the encryption is deterministic.
  + The scheme has not indisguishable encryptions. Since the eavesdropper can do the attack by simply getting the ciphertext block $angle.l r,G(r) xor m angle.r$, and coomputing $G(r)$ and obtaining $m$ by $m = G(r) xor c$. The attack is completed in polynomial time. The scheme is not CPA-secure for the same reason.
  + The scheme has indisguishable encryptions since it's CPA-secure. The scheme is a variant CTR mode with 2 blocks, where $r$ is the initial value and encrypt the $i$-th message block with $m_i xor F_k (r - 1 + i)$ instead of $m_i xor F_k (r + i)$. Since CTR mode is CPA-secure, the variant does not change the security. The scheme is CPA-secure.
]

#problem[
  Let $F_k$ be a PRF. Show that each of the following MACs is insecure, even if used to authenticate fixex-length messages.
  + To authenticate message $m = m_1 dots m_cal(l)$ where $m_i in {0,1}^n$, compute $ t := F_k (m_1) xor dots xor F_k (m_cal(l)) $
  + To authenticate message $m = m_1 dots m_cal(l)$ where $m_i in {0,1}^(n/2)$, compute $ t := F_k ([1]_2bar.double m_1) xor dots xor F_k ([cal(l)]_2bar.double m_cal(l)) $
  + To authenticate message $m = m_1 dots m_cal(l)$ where $m_i in {0,1}^(n/2)$, compute $ t := angle.l r, F_k (r) xor F_k ([1]_2bar.double m_1) xor dots xor F_k ([cal(l)]_2bar.double m_cal(l))angle.r $
]

#solution[
  Suppose the adversary for each MAC is $A$ (not the same).
  + W.l.o.g, suppose we have a message $m = m_1 m_2$, $A$ can query the MAC with $m$ to get tag $t = M A C(m_1 m_2) = F_k (m_1) xor F_k (m_2)$. Then $A$ queries MAC to verify $angle.l t, m^prime angle.r$ with $m^prime = m_2 m_1$. It will always succeed since $M A C(m_2 m_1) = F_k (m_2) xor F_k (m_1) = F_k (m_1) xor F_k (m_2) = t$.
  + W.l.o.g, suppose we have three messages $m_1 = 0^n$, $m_2 = 0^(n/2)1^(n/2)$ and $m_3 = 1^n$ and then $A$ queries for their corresponding tag $t_1, t_2, t_3$. Since $ t_1 = F_k ([1]_2 bar.double 0^(n/2)) xor F_k ([2]_2 bar.double 0^(n/2)) \ t_2 = F_k ([1]_2 bar.double 0^(n/2)) xor F_k ([2]_2 bar.double 1^(n/2)) \ t_3 = F_k ([1]_2 bar.double 1^(n/2)) xor F_k ([2]_2 bar.double 1^(n/2)) $ we can construct a new message $m_4 = 1^(n/2)0^(n/2)$ such that it can pass the verification with tag $t_4 = t_1 xor t_2 xor t_3$ since $ t_4 &=  t_1 xor t_2 xor t_3 = F_k ([1]_2 bar.double 0^(n/2)) xor F_k ([2]_2 bar.double 0^(n/2)) \ &xor F_k ([1]_2 bar.double 0^(n/2)) xor F_k ([2]_2 bar.double 1^(n/2)) xor F_k ([1]_2 bar.double 1^(n/2)) xor F_k ([2]_2 bar.double 1^(n/2)) \ &= F_k ([1]_2 bar.double 1^(n/2)) xor F_k ([2]_2 bar.double 0^(n/2)) = "MAC"(1^(n/2) 0^(n/2)) = "MAC"(m_4) $
  + Without any quries, we can construct a message $m = {0,1}^(n/2)$ and its tag $t = angle.l [1]_2 bar.double m, 0^(n/2) angle.r$, it will always pass the verification since $ F_k (r) xor F_k ([1]_2 bar.double m) = F_k ([1]_2 bar.double m) xor F_k ([1]_2 bar.double m) = 0^(n/2) $
]

#problem[
  Let $F_k$ be a PRF. Show that the following MAC for messages of length $2n$ is insecure. $G e n$ outputs a uniform $k in {0,1}^n$. To authenticate a message $m_1 bar.double m_2$ with $abs(m_1) = abs(m_2) = n$, compute the tag $t = F_k (m_1) bar.double F_k (F_k (m_2))$
]

#solution[
  Suppose we have two messages $m_1 = {0,1}^n, m_2 = {0,1}^n$, $A$ will queries the MAC with messages $m = m_1 bar.double m_1$ and $m = m_2 bar.double m_2$ to get the tag $t = t_1 bar.double t_1^prime$ and $t = t_2 bar.double t_2^prime$, since $t_1 = F_k (m_1)$ and $t_2^prime = F_k (F_k (m_2))$, we split the tags and combine the pieces into $t^prime = t_1 bar.double t_2^prime = F_k (m_1) bar.double F_k (F_k (m_2))$, and thus, we can construct the message $m^prime = m_1 bar.double m_2$. Similarly, we can generate a message $m^prime = m_2 bar.double m_1$ and its tag $t^prime = t_2 bar.double t_1^prime$.
]

#problem[
  Prove the following modifications of basic CBC-MAC do not yield a secure MAC.
  + MAC outputs all blocks $t_1, dots, t_cal(l)$, rather than just $t_cal(l)$. (Verification only checks whether $t_cal(l)$ is correct.)
  + A random initial block is used each time a message is authenticated. That is, choose uniform $t_0 in {0,1}^n$, run basic CBC-MAC over "message" $t_0, m_1, dots, m_cal(l)$ and output the tag $angle.l t_0, t_cal(l) angle.r$. Verification is done in the natural way.
]

#solution[
  + Suppose we have four message block $m_1, m_2, m_3, m_4$, the adversary $A$ firstly queries with message $m = m_1 bar.double m_2$ to get the tag $t = t_1 bar.double t_2$, then queries with message $m = m_3 bar.double m_4$ to get tag $t = t_3 bar.double t_4$. Then we can construct a new message $m^prime = m_1 bar.double (m_3 xor t_0)$. Since $t_1 = F_k (m_1)$ and $t_3 = F_k (m_3)$, we have $ "MAC"(m^prime) = F_k (m_1) bar.double F_k (F_k (m_1) xor m_3 xor t_1) = F_k (m_1) bar.double F_k (m_3) = t_1 bar.double t_3 $So $A$ can pass the verification with the new message and tag.
  + Similar to (1), the adversary queries with message $m = m_1 bar.double m_2$ to get the tag $t = angle.l r_1, t_1 angle.r$, then queries with message $m = m_3 bar.double m_4$ to get tag $t = angle.l r_2, t_2 angle.r$. Then we can construct a new message $m^prime = m_1 bar.double m_2 bar.double t_1 xor r_2 bar.double m_3 bar.double m_4$ with its valid tag $t^prime = angle.l r_1, t_2 angle.r$. Since we have $ t_1 = F_k (F_k (F_k (r_1) xor m_1) xor m_2) $ and similar for $t_2$, then the joint of between $m_2$ and $m_3$ will become $ F_k (t_1 xor t_1 xor r_2) = F_k (r_2) $ So, $A$ can pass the verification with the new message and tag.
]

#problem[
  Suppose that the Shenzhen Traffic Police Department comes up with a new license plate with a special serial number format. This serial number format consits of only 3 letters: first two being a digit and last one being an English uppercase letter. Each serial number is randomly generated when issued.
  + Suppose that Alice and Bob apply for this new license plate. What is the probability that both of them receive the same plate number?
  + Suppose that the Shenzhen Traffic Police Department wants to ensure that the probability that at least two license plates have the same number is less than 1%. What is the maximum number of this type of license plates that they can issue?
  + Suppose that the Shenzhen Traffic Police Department wants to issue exactly 50 licenses plates. How many more DIGITs should be added at the end of this serial number format to ensure that the probability that at least two license plates have the same number is less than 1%?
]

#solution[
  + Alice and Bob can get at most $10^2 times 26 = 2600$ kinds of license plates, and each of them has equivalent chances to be issued, so the probability that both of them receive the same plate number is $ Pr["Alice" = "Bob"] = 2600 times (1 / 2600) times (1 / 2600) = 1 / 2600 $
  + From Birthday Attack, the probability of no collision is $ k(k - 1) = 2n ln(1 / (1 - p)) $ Solve the equation with $n = 2600$ and $p lt.eq 0.01$ to get $k lt.eq 7$. So the maximum number of this type of license plates that they can issue is 7.
  + Similar to (2), the equation becomes $ n = (k (1 - k)) / (2 ln (1-p)) $ Solve the equation with $k = 50$ and $p lt.eq 0.01$ to get $n gt.eq 121887$. So the extra number will be $log(121887 slash 2600) = 2$ digits.
]

#problem[
  Let $(G e n, H)$ be a collision resistent hash function and define the hash function $attach(limits(H), t: tilde.op) = (G e n, attach(limits(H), t: tilde.op))$ such that 
  $ attach(limits(H), t: tilde.op, tr: s) (x) colon.eq H^s (H^s (x)) $
  Prove or disprove that $attach(limits(H), t: tilde.op)$ is collision resistent hash function, where $s$ is the key obtained from $G e n$.
]

#solution[
  #set enum(numbering: "1.")
  Proof: By reduction, suppose that $attach(limits(H), t: tilde.op)$ is not collision resistent, then there's a PPT adversary $attach(limits(A), t: tilde.op)$ such that $ Pr["Collision"_(attach(limits(A), t: tilde.op), attach(limits(H), t: tilde.op)) (n) = 1] gt.eq p(n) $ with a non-negligible function $p(n)$ and we can construct a PPT adversary $A$ that can break the collision resistent of $H$. The adversary $A$ works as follows:
  + On input seed $s$, $A$ runs $attach(limits(A), t: tilde.op)$ to get one collision pair $(x, x^prime)$, and then check whether the pair is valid by $H^s (H^s (x)) = H^s (H^s (x^prime))$ and $x eq.not x^prime$. If it's not valid, i.e. $x = x^prime$, $A$ outputs the pair $(x, x^prime)$ and stops.
  + If the pair is valid, $A$ checks whether $H^s (x) eq H^s (x^prime)$. If it's true, $A$ outputs the pair $(x, x^prime)$. Otherwise, $A$ outputs the pair $(H^s (x), H^s (x^prime))$. In both cases, $A$ finds a collision pair for $H$.
  Therefore, the adversary $A$ can succeed with probability that $ Pr["Collision"_(A, H) (n) = 1] gt p(n) $ And $A$ is PPT since $attach(limits(A), t: tilde.op)$ is PPT. So we have a contradiction to that $H$ is collision resistent.
]

#problem[
  Define $D E S Y_(k, k^prime) (x) = D E S_k (x xor k^prime)$. The key length of $D E S Y$ is 120 bits, which is the sum of the lengths of $k$ and $k^prime$. Show a key-recovery attack on $D E S Y$ taking time and space approximately $2^64$.
]

#solution[
  #set enum(numbering: "1.")
  We can apply the meet-in-the-middle attack to recover the key $k$ with length $56$ and $k^prime$ with length $64$ in at most $2^64$ time and space. Let $x,y$ denotes the known plaintext and ciphertext. The attack works as follows:
  + For every $k in {0,1}^56$, compute $z = D E S_k^(-1) (y)$.
  + Then compute $k^prime = x xor z$ and verify the key pair $(k, k^prime)$ with another plaintext and ciphertext pair, i.e., verify if $D E S Y_(k, k^prime) (x^prime) = y^prime$.
  + If the verification is correct, output the key pair $(k, k^prime)$.
  Since $y = D E S_k (x xor k^prime)$, we have $k^prime = x xor z$ if $k$ is the correct key for DES. It is obvious that the algorithm takes $2^56$ time and constant space.
]

#problem[
  Let $F e i s t e l_(f_1, f_2) (dot)$ denote a two-round Feistel network using functions $f_1$ and $f_2$ (in that order). Show that if $F e i s t e l_(f_1, f_2) (L_0, R_0) = (L_2, R_2)$, then $F e i s t e l_(f_2, f_1) (R_2, L_2) = (R_0, L_0)$.
]

#solution[
  From the definition of Feistel network, we have $F e i s t e l_(f_1, f_2) (L_0, R_0)$ equals
  $
    L_1 &= R_0 \
    R_1 &= L_0 xor f_1 (R_0) \
    L_2 &= R_1 = L_0 xor f_1 (R_0) \
    R_2 &= L_1 xor f_2 (R_1) = R_0 xor f_2 (L_2)
  $
  so we have $L_0 &= L_2 xor f_1 (R_0)$ and $R_0 &= R_2 xor f_2 (L_2)$ .To compute $F e i s t e l_(f_2, f_1) (R_2, L_2)$, we have firstly $L^prime_0 = R_2, R^prime_0 = L_2$ and the following
  $
    L^prime_1 &= L_2 \
    R^prime_1 &= R_2 xor f_2 (L_2) \
    L^prime_2 &= R^prime_1 = R_2 xor f_2 (L_2) = R_0 \
    R^prime_2 &= L^prime_1 xor f_1 (R^prime_1) = L_2 xor f_1 (R_0)
  $
  Thus, $L^prime_2 = R_0$ and $R^prime_2 = L_0$, which means $F e i s t e l_(f_2, f_1) (R_2, L_2) = (R_0, L_0)$.
]
