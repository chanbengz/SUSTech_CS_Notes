# Computer Organization (CS202)

## About

- **Instructor:** `Yuhui BAI (白雨卉)`
- **TA:** `Qing WANG (王晴)`
- **Semester:** `2024 Spring`
- **Textbook:** `Computer Organization and Design: The Hardware/Software Interface`

## Content

- [Assignment](./Assignment): homework
  - [Programming](./Assignment/Programming): lab assignment written in Verilog
  - [Theory](./Assignment/Theory): theory assignment written in Typst. ~~Well, LaTeX is deprecated~~
- [Lab](./Lab): lab practice
- [Slides](./Slides): slides for lectures
- [Project](./Project): project, build a CPU from scratch
- [Text](./Text): textbook and RISC-V reference

| Lecture | Topic | Note |
| ------- | ----- | ---- |
| [lec1](./Slides/CompOrg_24S_Lec1_Introduction.pdf) | Syllabus and Overview | Intro to the principles of computer processor |
| [lec2](./Slides/CompOrg_24S_Lec2_RISC-V_Intro.pdf) | ISA, RISC-V and Intro to Assembly | RISC-V is an ISA (Instruction Set Architecture)<br>Programming in RISC-V Assembly Code |
| [lec3](./Slides/CompOrg_24S_Lec3_RISC-V_Procedure.pdf) | Control Flow and Stack | Direct and Conditional Branch<br>Calling Convention in RISC-V |
| [lec4](./Slides/CompOrg_24S_Lec4_RISC-V_Format.pdf) | Binary Format | Structure of RISC-V Machine Code |
| [lec5](./Slides/CompOrg_24S_Lec5_Performance.pdf) | Performance Measurement | Calculation of Processor's Performance: CPI and SPEC |
| [lec6](./Slides/CompOrg_24S_Lec6_Arithmetic.pdf) | Execution of Integers | Add, Substraction, Multiplication and Division |
| [lec7](./Slides/CompOrg_24S_Lec7_FP_Arithmetic.pdf) | Float Point Number (Decimal) Arithmetic | Standard for Float and Double<br>Add/Sub, Mul/Div of FP<br>Matrix Operation, SIMD |
| [lec8](./Slides/CompOrg_24S_Lec8_Processor.pdf) | Single-Cycle Processor Design | Elements in CPU<br>Data Path<br>Clocking Methodology |
| [lec9](./Slides/CompOrg_24S_Lec9_Pipeline.pdf) | Pipelined CPU Design | Stage Register<br>Hazards and Solution |
| [lec10](./Slides/CompOrg_24S_Lec10_ILP.pdf) | Instruction-Level Parallelism | Statical Multi-issue Design<br>Loop Unrolling<br>Hazards |
| [lec11](./Slides/CompOrg_24S_Lec11_Memory.pdf) | Intro to Cache | Functions and Strategies of Direc-Mapped Cache |
| [lec12](./Slides/CompOrg_24S_Lec12_Memory2.pdf) | Cache Cont'd | N-way Set Associative Cache<br>Full Associative Cache<br>Efficiency Measurement<br>Multi-Level Cache |
| [lec13](./Slides/CompOrg_24S_Lec13_Memory3.pdf) | Virtual Memory | Page Table<br>Address Translation<br>Replacement & TLB |
| [lec14](./Slides/CompOrg_24S_Lec14_ParallelProcess.pdf) | Multi-Core Concepts | Calculation of Multi-Core Speedup<br>Multithreading<br>Intro to GPU |

Summary: Processor, Memory, Parallel. Design and Data Path, every detail matters.

## Project

The project topic remains the (possibly) forever, to build a CPU from scratch. Though the codes are available online, it's strongly recommended to write your own without referring to any existing code. General steps are as follows:
 1. Understanding the design of single-cycle CPU from the textbook but I won't suggest referring it due to the flaws in that design.
 2. Based on your understanding, draw the figure of your CPU from scratch, which means to redesign the datapath within your mind without referring the textbook, on paper or using any software like [draw.io](https://draw.io).
 3. Pay attention to the scalability of your design, i.e., how to extend the ISA esaily in your design. And you will know why textbook is wrong.
 4. Try implemeting the full version of RV32I, or it'll be hard to extend the ISA in the future since it requires to modify the design heavily.
 5. On the basis of well-functioning, try to optimize the design, like pipelining, hazard handling, cache, branch prediction, etc.

 Have fun with your CPU design!

