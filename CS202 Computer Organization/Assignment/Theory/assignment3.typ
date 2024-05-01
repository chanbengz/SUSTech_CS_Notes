#import "template.typ": *

#show: project.with(
  title: "Computer Organization Homework 3",
  authors: (
    (
      name: "陈贲(12212231)",
    ),
  ),
)

#problem[
  #show table.cell.where(y:0) : strong
  #set enum(numbering: "a)")
   We examine how pipelining affects the clock cycle time of the processor. Problems in this exercise assume that individual stages of the datapath have the following latencies.
   #align(center, table(
    columns: 5,
    inset: (x: 1.5em),
    [IF], [ID], [EX], [MEM], [WB],
    [250ps], [350ps], [150ps], [300ps], [200ps]
   ))
   #par(first-line-indent: 0cm, "Also, assume that instructions executed by the processor are broken down as follows:")
   #align(center, table(
    columns: 4,
    inset: (x: 1.5em),
    [ALU/Logic], [Jump/Branch], [Load], [Store],
    [45%], [20%], [20%], [15%]
   ))
  + What is the clock cycle time in a pipelined and non-pipelined processor?
  + What is the total latency of an lw instruction in a pipelined and non-pipelined processor?
  + If we can split one stage of the pipelined datapath into two new stages, each with half the latency of the original stage, which stage would you split and what is the new clock cycle time of the processor?
  + Assuming there are no stalls or hazards, what is the utilization of the data memory?
  + Assuming there are no stalls or hazards, what is the utilization of the write-register port of the “Registers” unit?
  + Instead of a single-cycle organization, we can use a multi-cycle organization, where each instruction takes multiple cycles but one instruction finishes before another is fetched. In this organization, an instruction only goes through stages it actually needs (e.g., Jump/Branch only takes 3 cycles because it does not need the Mem/WB stage). Compare clock cycle times and execution times with single-cycle, multi-cycle, and pipelined organization.
]

#solution[
  #show table.cell.where(y:0) : strong
  #set enum(numbering: "a)")
  + The clock cycle time for a pipeline is determined by the critical path, which is the ID stage with a latency of 350ps. The clock cycle time for a non-pipelined processor is the sum of all stage latencies, which is 1250 ps.
  + The latency of non-pipelined is the whole path, which is 1250 ps. And that of the pipelined is the sum of clock times, which is $5 times 350" ps" = 1750" ps"$
  + Split the critical stage, i.e., stage ID, into two stages. The new clock cycle time will become 300ps, determined by stage MEM.
  + Only load and store use data memory, which is 35% of the time.
  + Only ALU/logic and load instructions write to the register, which takes 65% of the time.
  + The clock cycle time for the multi-cycle organization is the same as pipeline. And the execution time is the weighted average
  $ T = 20"%" times 3 times 350 + 15"%" times 4 times 350 + 60"%" times 5 times 350 = 1470" ps" $
  #align(center, table(
    columns: 4,
    inset: (x: 1.5em),
    [Time], [Single-cycle], [Multi-cycle], [Pipelined],
    [Cycle time], [1250 ps], [350 ps], [350 ps],
    [Execution time], [1250 ps], [1470 ps], [1750 ps]
  ))
]

#problem[
  #set enum(numbering: "a)")
  Consider a version of the pipeline that does not handle data hazards (i.e., the programmer is responsible for addressing data hazards by inserting `NOP` instructions where necessary). Suppose that (after optimization) a typical $n$-instruction program requires an additional $4*n$ `NOP` instructions to correctly handle data hazard.
  + Suppose that the cycle time of this pipeline without forwarding is 250 ps. Suppose also that adding forwarding hardware will reduce the number of `NOP`s from $4*n$ to $0.05*n$, but increase the cycle time to 300 ps. What is the speedup of this new pipeline compared to the one without forwarding.
  + Different programs will require different amounts of `NOP`s. How many `NOP`s (as a percentage of code instructions) can remain in the typical program before that program runs slower on the pipeline with forwarding.
]

#solution[
  #set enum(numbering: "a)")
  + Pipeline without forwarding takes $5times n times 250" ps"$ and while the pipeline with forwarding takes $1.05 times n times 300" ps"$ the speedup is $(5 times n times 250" ps") slash (1.05 times n times 300" ps") = 3.97$.
  + Suppose we have $y$ `NOP`s instructions in pipeline with forwarding, then $5times n times 250" ps" = (1 + y) times n times 300" ps"$ which gives $y = 3.17$
]

#problem[
  #set enum(numbering: "a)")
  Consider the fragment of RISC-V assembly below:
  ```riscv
  sw x29, 12(x16)
  lw x29, 8(x16)
  sub x17, x15, x14
  beqz x17, label
  add x15, x11, x14
  sub x15, x30, x14
  ```
  Suppose we modify the pipeline so that it has only one memory (that handles both instructions and data). In this case, there will be a structural hazard every time a program needs to fetch an instruction during the same cycle in which another instruction accesses data.
  + Draw a pipeline diagram to show were the code above will stall.
  + In general, is it possible to reduce the number of stalls/NOPs resulting from this structural hazard by reordering code?
  + Must this structural hazard be handled in hardware? We have seen that data hazards can be eliminated by adding NOPs to the code. Can you do the same with this structural hazard? If so, explain how. If not, explain why not.
]

#solution[
  The pipeline diagram is as follows:
  #align(center, table(
    columns: 13,
    inset: (x: .4em),
    [`sw x29, 12(x16)`], [IF], [ID], [EX], [ME], [WB], [ ], [], [], [], [], [], [],
    [`lw x29, 8(x16)`], [], [IF], [ID], [EX], [ME], [WB], [], [], [], [], [], [],
    [`sub x17, x15, x14`], [], [], [IF], [ID], [EX], [ME], [WB], [], [], [], [], [],
    [`beqz x17, label`], [], [], [], [No], [No], [IF], [ID], [EX], [ME], [WB], [], [],
    [`add x15, x11, x14`], [], [], [], [], [], [], [IF], [ID], [EX], [ME], [WB], [],
    [`sub x15, x30, x14`], [], [], [], [], [], [], [], [IF], [ID], [EX], [ME], [WB]
  ))
  No, reordering does not help, since the `sw` and `lw` instructions are inevitable, two stalls are always needed. Reordering can barely fix the data hazard and therefore only substituting the two instructions will help.
  
  The structural hazard cannot be handled by adding `NOP`, since the `NOP` instructions won't be fetched when the memory is accessed. The only way to handle this hazard is to add hardware to the pipeline.
]

#problem[
  #set enum(numbering: "a)")
  In this exercise we compare the performance of 1-issue and 2-issue processors, taking into account program transformations that can be made to optimize for 2-issue execution. Problems in this exercise refer to the following loop (written in C)
  ```c
  for(i = 0; i != j; i += 2) b[i] = a[i] - a[i + 1];
  ```
  A compiler doing little or no optimization might produce the following RISC-V assembly code:
  ```riscv
        li x12, 0
        jal ENT
  TOP:  slli x5, x12, 3
        add x6, x10, x5
        lw x7, 0(x6)
        lw x29, 4(x6)
        sub x30, x7, x29
        add x31, x11, x5
        sw x30, 0(x31)
        addi x12, x12, 2
  ENT:  bne x12, x13, TOP
  ```
  The assembly code uses the following registers:
  #show table.cell.where(x:0) : strong
  #align(center, table(
    columns: 6,
    inset: (x: 1.5em),
    [Variable], [`i`], [`j`], [`a`], [`b`], [Temporary],
    [Register], [`x12`], [`x13`], [`x10`], [`x11`], [`x5-x7`, `x29-x31`]
  ))

  Assume the two-issue, statically scheduled processor for this exercise has the following properties:
  - One instruction must be a memory operation; the other must be an arithmetic/logic instruction or a branch.
  - The processor has all possible forwarding paths between stages (including paths to the ID stage for branch resolution).
  - The processor has perfect branch prediction.
  - Two instruction may not issue together in a packet if one depends on the other.
  - If a stall is necessary, both instructions in the issue packet must stall.
  Answer the questions:
  + Draw a pipeline diagram showing how RISC-V code given above executes on the two-issue processor. Assume that the loop exits after two iterations.
  + What is the speedup of going from a one-issue to a two issue processor? (Assume the loop runs thousands of iterations.)
  + Rearrange/rewrite the RISC-V code given above to achieve better performance on the one-issue processor.
  + Rearrange/rewrite the RISC-V code given above to achieve better performance on the two-issue processor.
  + What is the speedup of going from a one-issue processor to a two-issue processor when running the optimized code from the previous question.
]

#solution[
  #set enum(numbering: "a)")
  + The pipeline diagram is shown in the next page.
  + There's no speedup since each pair of instructions in the loop are conflict, and the two-issue processor will always stall the second issue line. The both processors take 10 cycles for each iteration, since the loop begins at cycle 6 and ends at cycle 26.
  + To optimize the program, we firstly add a instruction to fill in the stall after `lw x29, 4(26)`. The instructions will be the counter since it is not accessed by any instructions except for the branch instruction. The optimized code for the one-issue processor is as follows:
  ```riscv
        beqz x13, DONE
        li x12, 0
        jal ENT
  TOP:  slli x5, x12, 3
        add x6, x10, x5
        lw x7, 0(x6)
        lw x29, 4(x6)
        addi x12, x12, 2
        sub x30, x7, x29
        add x31, x11, x5
        sw x30, 0(x31)
  ENT:  bne x12, x13, TOP
  DONE:
  ```
  #text("d)  ")To optimize the program, we try to split the adjacent `lw/sw` instructions to reduce stall, by moving independent instructions into their gaps. Secondly, remove the `jal` instruction since we have a branch to avoid loop at the beginning, so the jump is unnecessary.
  ```riscv
        beqz x13, DONE
        li x12, 0
  TOP:  slli x5, x12, 3
        add x6, x10, x5
        lw x7, 0(x6)
        add x31, x11, x5
        lw x29, 4(x6)
        addi x12, x12, 2
        sub x30, x7, x29
        sw x30, 0(x31)
        bne x12, x13, TOP
  DONE:
  ```
  #text("e)  ")The cycle per iteration for one-issue is $10 - 1 = 9" cycles"$ after filling in the stall. And for two-issue, it's $15 slash 2 = 7.5" cycles"$ since the two iteratios start from cycle 6 and end at cycle 21. So the speedup is $9 slash 7.5 = 1.2$
]

#rotate(-90deg, reflow: true, align(center, table(
  columns: 21,
  stroke: (_, y) => (
    x: 1pt,
    top: if (calc.odd(y) and y <= 15) or y <= 1 or y == 16 or (calc.even(y) and y >= 16) { 1pt } else { 0pt },
    bottom: 1pt,
  ),
  fill: (x, y) => if y == 0 or y == 15 {luma(180)},
  [], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19], [20],
  [`li x12, 0`], [IF], [ID], [EX], [ME], [WB], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [],
  [`jal ENT`], [IF], [ID], [], [EX], [ME], [WB], [], [], [], [], [], [], [], [], [], [], [], [], [], [],
  [`bne x12, x13, TOP`], [], [IF], [], [ID], [EX], [ME], [WB], [], [], [], [], [], [], [], [], [], [], [], [], [],
  [`slli x5, x12, 3`], [], [IF], [], [ID], [], [EX], [ME], [WB], [], [], [], [], [], [], [], [], [], [], [], [],
  [`add x6, x10, x5`], [], [], [], [IF], [], [ID], [EX], [ME], [WB], [], [], [], [], [], [], [], [], [], [], [],
  [`lw x7, 0(x6)`], [], [], [], [IF], [], [ID], [], [EX], [ME], [WB], [], [], [], [], [], [], [], [], [], [],
  [`lw x29, 4(x6)`], [], [], [], [], [], [IF], [], [ID], [EX], [ME], [WB], [], [], [], [], [], [], [], [], [],
  [`sub x30, x7, x29`], [], [], [], [], [], [IF], [], [ID], [], [], [EX], [ME], [WB], [], [], [], [], [], [], [],
  [`add x31, x11, x5`], [], [], [], [], [], [], [], [IF], [], [], [ID], [EX], [ME], [WB], [], [], [], [], [], [],
  [`sw x30, 0(x31)`], [], [], [], [], [], [], [], [IF], [], [], [ID], [], [EX], [ME], [WB], [], [], [], [], [],
  [`addi x12, x12, 2`], [], [], [], [], [], [], [], [], [], [], [IF], [], [ID], [EX], [ME], [WB], [], [], [], [],
  [`bne x12, x13, TOP`], [], [], [], [], [], [], [], [], [], [], [IF], [], [ID], [], [EX], [ME], [WB], [], [], [],
  [`slli x5, x12, 3`], [], [], [], [], [], [], [], [], [], [], [], [], [IF], [], [ID], [EX], [ME], [WB], [], [],
  [`add x6, x10, x5`], [], [], [], [], [], [], [], [], [], [], [], [], [IF], [], [ID], [], [EX], [ME], [WB], [],
  [], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [24], [25], [26], [27], [28],
  [`lw x7, 0(x6)`], [], [], [], [], [], [], [IF], [], [ID], [EX], [ME], [WB], [], [], [], [], [], [], [], [], 
  [`lw x29, 4(x6)`], [], [], [], [], [], [], [IF], [], [ID], [], [EX], [ME], [WB], [], [], [], [], [], [], [],
  [`sub x30, x7, x29`], [], [], [], [], [], [], [], [], [IF], [], [ID], [], [EX], [ME], [WB], [], [], [], [], [],
  [`add x31, x11, x5`], [], [], [], [], [], [], [], [], [IF], [], [ID], [], [], [EX], [ME], [WB], [], [], [], [],
  [`sw x30, 0(x31)`], [], [], [], [], [], [], [], [], [], [], [IF], [], [], [ID], [EX], [ME], [WB], [], [], [],
  [`addi x12, x12, 2`], [], [], [], [], [], [], [], [], [], [], [IF], [], [], [ID], [], [EX], [ME], [WB], [], [],
  [`bne x12, x13, TOP`], [], [], [], [], [], [], [], [], [], [], [], [], [], [IF], [], [ID], [EX], [ME], [WB], [],
  [`slli x5, x12, 3`], [], [],  [], [], [], [], [], [], [], [], [], [], [], [IF], [], [ID], [], [EX], [ME], [WB],
)))
