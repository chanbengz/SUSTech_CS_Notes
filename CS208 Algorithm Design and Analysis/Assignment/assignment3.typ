#import "template.typ": *
#import "@preview/algorithmic:0.1.0"
#import algorithmic: *

#show: project.with(
  title: "Algorithm Assignment 3",
  authors: (
    (
      name: "陈贲(12212231)",
    ),
  ),
)

#problem[
  Consider the directed acyclic graph $G$ in Figure 3.10. How many topological orderings does it have?
  #align(center, image("img/3-10.png", width: 40%))
]

#solution[
  There are 6 topological orderings for the graph $G$ in Figure 3.10, which are:
  $
  a prec b prec d prec c prec e prec f \
  a prec b prec d prec e prec c prec f \
  a prec b prec c prec d prec e prec f \
  a prec d prec b prec c prec e prec f \
  a prec d prec b prec e prec c prec f \
  a prec d prec e prec b prec c prec f
  $
]

#problem[
  The algorithm described in Section 3.6 for computing a topological ordering of a DAG repeatedly finds a node with no incoming edges and deletes it. This will eventually produce a topological ordering, provided that the input graph really is a DAG.

  But suppose that we're given an arbitrary graph that may or may not be a DAG. Extend the topological ordering algorithm so that, given an input directed graph $G$, it outputs one of two things: (a) a topological ordering, thus establishing that $G$ is a DAG; or (b) a cycle in $G$, thus establishing that $G$ is not a DAG. The running time of your algorithm should be $O(m + n)$ for a directed graph with $n$ nodes and $m$ edges
]

#solution[
  The pseudocode of the algorithm is shown below:
#algorithm({
  Function("Find_DAG", args: ($G = (V,E)$,), {
    Assign[$Q$][empty queue]
    Assign[$S$][empty stack]
    Assign[$A$][empty set]
    Assign[$B$][empty set]
    State[]
    For(cond: [vertice $v$ in $V$], {
      If(cond:[$v$ has no incoming edges], {
        State[Q.enqueue($v$)]
      })
      State[*end if*]
    })
    State[*end for*]
    While(cond:[$Q$ is not empty], {
      Assign[$u$][$Q$.dequeue()]
      Assign[$A$][$A$ + ${u}$]
      For(cond: [edge $(u,v)$ in $E$], {
        Assign[$E$][$E$ / $(u,v)$]
        If(cond:[$v$ has no incoming edges], {
          State[Q.enqueue($v$)]
        })
        State[*end if*]
      })
      State[*end for*]
    })
    State[*end while*]
    If(cond: $abs(A) == abs(V)$, {
      Return[$A$]
    })
    Else({
      State[Restore G = (V, E)]
      State[$S$.push(some vertex in $V$)]
      While(cond:[$S$ is not empty], {
        Assign[$u$][$S$.top()]
        For(cond: [edge $(u,v)$ in $E$], {
          If(cond:[$v$ is in $S$], {
            While(cond:[$v$ is in $S$], {
              Assign[$w$][$S$.pop()]
              Assign[$B$][$B$ + ${w}$]
            })
            Return[$B$]
          })
          Else({
            State[$S$.push($v$)]
          })
          State[*end if*]
        })
        State[*end for*]
      })
      State[*end while*]
    })
    State[*end if*]
  })
})

If the algorithm returns a set of vertices with the same size as the input graph, then the graph is a DAG. Otherwise, the graph contains a cycle and the algorithm returns nodes in one of the cycles.
]