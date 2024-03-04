.include "macro_print_str.asm"
.data
	min: .word 0x7fffffff
	max: .word 0x80000000
.text
main:
	lw t0, min
	lw t1, max
	li t3, 4
	li t4, 0
	print_string("Please input 5 integers:\n")
loop:
	li a7, 5
	ecall
	bge a0, t1, set_max
	j set_min
set_max:
	mv t1, a0
	j set_min
set_min:
	bge a0, t0, judge_times
	mv t0, a0
	j judge_times
judge_times:
	addi t4, t4, 1
	bge t3, t4, loop

	print_string("\nMin : ")
	mv a0, t0
	li a7, 1
	ecall
	print_string("\nMax : ")
	mv a0, t1
	li a7, 1
	ecall
	end
