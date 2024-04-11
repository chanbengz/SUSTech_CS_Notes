#import "template.typ": *

#show: project.with(
  title: "Algorithm Assignment 4",
  authors: (
    (
      name: "陈贲(12212231)",
    ),
  ),
)

#problem[
  #set enum(numbering: "(a)")
  For each of the following two statements, decide whether it is true or false. If it is true, give a short explanation. If it is false, give a counterexample.
  + Suppose we are given an instance of the Minimum Spanning Tree Problem on a graph $G$, with edge costs that are all positive and distinct. Let $T$ be a minimum spanning tree for this instance. Now suppose we replace each edge cost $c_e$ by its square, $c^2_e$ , thereby creating a new instance of the problem with the same graph but different costs. $T$ must still be a minimum spanning tree for this new instance.
  + Suppose we are given an instance of the Shortest $s-t$ Path Problem on a directed graph $G$. We assume that all edge costs are positive and distinct. Let $P$ be a minimum-cost s-t path for this instance. Now suppose we replace each edge cost ce by its square, $c^2_e$ , thereby creating a new instance of the problem with the same graph but different costs. $P$ must still be a minimum-cost $s-t$ path for this new instance.
]

#solution[
  #set enum(numbering: "(a)")
  + True. Since the edge costs are all positive and distinct, the square of the edge costs are also positive and distinct. With the new graph, the Kruskal's algorithm will firstly sort them and it is still the same order as the original graph, since the square function is monotonically increasing and won't change the relative order of the edge costs. So the minimum spanning tree is still the same.
  + False. Counterexample, if we have $|(a,b)| + |(b,c)| > |(a,c)|$ and $|(a,b)|^2 + |(b,c)|^2 < |(a,c)|^2$ on graph $G$, then the new instance will have a different shortest path. For example, take $(a,b)$ and $(b,c)$ with cost 3, and $(a,c)$ with cost 5. The original shortest path is $(a,c)$ with cost 5, but the new shortest path is $(a,b) - (b,c)$ with cost 18.
]

#problem[
  Suppose you are given a connected graph $G$, with edge costs that are all distinct. Prove that G has a unique minimum spanning tree.
]

#solution[
  Proof: Suppose there are two distinct minimum spanning tree $T$ and $T^prime$ on graph $G$. Since they have the same number of edges, but edges are not the same. Suppose there's an edge $e = (u, v)$ in $T$ but not in $T^prime$, then in $T^prime$ there must be a simple path from $u$ to $v$. If we add $e$ to $T^prime$, we will get a cycle in $T^prime$ which means $T^prime$ is not a tree by definition, and therefore, there's an edge $f$ in the cycle but not in $T$. Since the edges are distinct, $f$ must be bigger than $e$. Thus, we can get a smaller spanning tree by replacing $f$ with $e$ in $T^prime$, which contradicts the assumption that $T^prime$ is a minimum spanning tree. Similarly, if there's an edge $e = (u, v)$ in $T^prime$ but not in $T$, we can get a contradiction by replacing $e$ with a smaller edge in $T$. Therefore, the edge $e$ does not exist, and there's only one minimum spanning tree in graph $G$.
]

#problem[
  Consider the Minimum Spanning Tree Problem on an undirected graph $G = (V , E)$, with a cost $c_e gt.eq 0$ on each edge, where the costs may not all be different. If the costs are not all distinct, there can in general be many distinct minimum-cost solutions. Suppose we are given a spanning tree $T subset.eq E$ with the guarantee that for every $e in T$, $e$ belongs to some minimum-cost spanning tree in $G$. Can we conclude that $T$ itself must be a minimum-cost spanning tree in $G$? Give a proof or a counterexample with explanation.
]

#solution[
  False. Counterexample: suppose we have a graph with $V = {a, b, c, d}$ and the costs are $(a,b) = (b,c) = (c,d) = (d,a) = 2$ and $(a,c) = 1$, then we have spanning trees with $(a,c)$ and one from $(a,b), (b,c)$ and the other from $(a,d), (c,d)$. Every edge belongs to some minimum-cost spanning tree, but the spanning tree with three of $(a,b), (b,c), (c,d), (d,a)$ is not a minimum-cost spanning tree.
]
