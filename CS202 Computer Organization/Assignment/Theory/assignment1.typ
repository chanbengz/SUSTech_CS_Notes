#import "template.typ": *

#show: project.with(
  title: "Computer Organization Homework 1",
  authors: (
    (
      name: "陈贲(12212231)",
    ),
  ),
)

#problem[
  For the following C statement, write the corresponding RISC-V assembly code. Assume that the C variables f, g, and h, have already been placed in registers x5, x6, and x7 respectively. Use a minimal number of RISC-V assembly instruction.
#align(center, 
```cpp
f = g + (h - 5);
```)
]

#solution[
  We shall first minus 5 from h, then add g to the result, and finally store the result in f
  ```riscv
  addi x7, x7, -5 # get (h - 5)
  add  x5, x6, x7 # f = g + (h - 5)
  ```
]

#problem[
  Translate the following C code to RISC-V. Assume that the variables f, g, h, i, and j are assigned to registers x5, x6, x7, x28, and x29, respectively. Assume that the base address of the arrays A and B are in registers x10 and x11, respectively. Assume that the elements of the arrays A and B are 4-byte words:
#align(center, 
```cpp
B[8] = A[i] + A[j];
```
)
]

#solution[
  We shall first load A[i] and A[j] into registers, then add them together, and finally store the result in B[8]
  ```riscv
  slli x28, x28, 2   # i = i * 4
  slli x29, x29, 2   # j = j * 4
  add  x28, x28, x10 # get the address of A[i]
  add  x29, x29, x10 # get the address of A[j]
  lw   x6, 0(x28)    # g = A[i]
  lw   x7, 0(x29)    # h = A[j]
  add  x5, x6, x7    # f = g + h
  sw   x5, 32(x11)   # store the result in B[8]
  ```
]

#problem[
  The table below shows 32 bit values of an array stored in memory
  #align(center,
  table(
    columns: 2,
    align: center,
    [Address], [Data],
    $24$, $2$,
    $28$, $4$,
    $32$, $3$,
    $36$, $6$,
    $40$, $1$,
  ))
  + For the memory locations in the table above, write C code to sort the data from lowest to highest, placing the lowest value in the smallest memory location shown in the figure. Assume that the data shown represents the C variable called Array, which is an array of type int, and that the first number in the array shown is the first element in the array. Assume that this particular machine is a byte addressable machine and a word consists of four bytes.
  + For the memory locations in the table above, write RISC-V code to sort the data from lowest to highest, placing the lowest value in the smallest memory location. Use a minimum number of RISC-V instructions. Assume the base address of Array is stored in register x22.
]

#solution[
  Using the bubble sort, we can write the following C code:
  ```c
int A[5] = {2, 4, 3, 6, 1};

int main() {
    for(int i = 0; i < 4; i++) {
        for(int j = 0; j < 4 - i; j++) {
            if (A[j] > A[j + 1]) {
                int tmp = A[j];
                A[j] = A[j + 1];
                A[j + 1] = tmp;
            }
        }
    }
    return 0;
}
```
Derive the following RISC-V code:
```riscv
main:
    li    a4, 4                # i = 4
outer_loop:
    li    a3, 0                # j = 0
inner_loop:
    slli  x23, x3, 2           # A[j]
    addi  x23, x22, x23        # reset A
    lw    a2, 0(x22)           # load A[j]
    lw    a1, 4(x22)           # load A[j + 1]
    addi  a3, a3, 1            # j++
    ble   a2, a1, next         # if A[j] <= A[j + 1], skip swaping
    sw    a1, 0(x22)           # swap
    sw    a2, 4(x22)
next:
    addi  x22, x22, 4          # A++
    blt   a3, a4, inner_loop   # if j < n - i, continue
    addi  a4, a4, -1           # i--
    bne   a4, zero, outer_loop # if i != 0, continue
```
]

#problem[
  Provide the instruction type and assembly language instruction for the following binary value:
  $ 0000 space 0000 space 0001 space 0000 space 1000 space 0000 space 1011 space 0011_("two") $
]

#solution[
  The opcode of the instruction is 0110011, which is a R-type instruction.
  #align(center,
  table(
    columns: 6,
    align: center,
    [funct7], [rs2], [rs1], [funct3], [rd], [opcode],
    $0000000$, $00001$, $00001$, $000$, $00001$, $0110011$
  ))
#par(first-line-indent: 0cm,
"according to the opcode, funct3 and funct7, we can derive the assembly language instruction as:"
)
  ```riscv
add x1, x1, x1
  ```
]

#problem[
  Provide the instruction type, assembly language instruction, and binary representation of instruction described by the following RISC-V fields: opcode=0x3, funct3=0x2, rs1=27, rd=3, imm=0x4.
]

#solution[
  The fields are as follows:
  #align(center,
  table(
    columns: 5,
    align: center,
    [imm], [rs1], [funct3], [rd], [opcode],
    $000000000100$, $11011$, $010$, $00011$, $0000011$
  ))
  The opcode is 0000011, which is a I-type instruction. And the funct3 is 010, indicating the `lw` instruction. Thus, the binary version is
$ 0000 space 0000 space 0100 space 1101 space 1010 space 0001 space 1000 space 0011_("two") $
and the assembly language is
```riscv
lw x3, 4(x27)
```
]
