#import "template.typ": *

#show: project.with(
  title: "OS Assignment 3",
  authors: (
    (
      name: "陈贲(12212231)",
    ),
  ),
)

#problem[
  Consider the following single-threaded processes, and their arrival times, estimated CPU costs and their priorities (a process with a higher priority number has priority over a process with lower priority number):
  #align(center, table(
    stroke: 0.8pt,
    columns: 4,
    [*Process*], [*Estimated CPU Cost*], [*Arrival*],[*Priority*],
    [A], [6], [1], [1],
    [B], [1], [2], [2],
    [C], [3], [5], [3],
    [D], [2], [4], [4],
  ))
  Given the above information, fill in the timing table.
]

#solution[
  #align(center, table(
    stroke: 0.8pt,
    columns: 6,
    inset: (x:10pt),
    [*Time*], [*HRRN*], [*FIFO/FCFS*], [*RR*], [*SJF*], [*Priority*],
    [1],  [A], [A], [A], [A], [A], 
    [2],  [A], [A], [A], [A], [B],
    [3],  [A], [A], [B], [A], [A],
    [4],  [A], [A], [A], [A], [D],
    [5],  [A], [A], [D], [A], [D],
    [6],  [A], [A], [A], [A], [C],
    [7],  [B], [B], [C], [B], [C],
    [8],  [D], [D], [D], [D], [C],
    [9],  [D], [D], [A], [D], [A],
    [10], [C], [C], [C], [C], [A],
    [11], [C], [C], [A], [C], [A],
    [12], [C], [C], [C], [C], [A],
    [Avg. Turn-Around], [6.5], [6.5], [6.5], [6.5], [4.75],
  ))
  The average turn-around time for each algorithm is
  - *HRRN*: $( 6 + 6 + 8 + 6 ) slash 4 = 6.5$
  - *FIFO/FCFS*: $( 6 + 6 + 8 + 6 ) slash 4 = 6.5$
  - *RR*: $( 11 + 2 + 8 + 5 ) slash 4 = 6.5$
  - *SJF*: $( 6 + 6 + 8 + 6 ) slash 4 = 6.5$
  - *Priority*: $( 12 + 1 + 4 + 2 ) slash 4 = 4.75$
]