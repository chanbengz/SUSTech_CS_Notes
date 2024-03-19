.include "macro_print_str.asm"
.data
	dvalue1: .word 0x7ffffff1
	dvalue2: .word 1
.text
	lw t1, dvalue1
	lw t2, dvalue2
	sub t0, t1, t2       # t0 = t1 - t2
	slti t3, t2, 0       # t3 = (t2 < 0)
	slt t4, t0, t1       # t4 = (t0 < t1), that is, (t1 - t2 < t1)
	mv a0, t0            # print the sum
	li a7, 1
	ecall
	beq t3, t4, overflow # overflow if (t2 >= 0) && (t1 - t2 >= t1) or if (t2 < 0) && (t1 - t2 < t1)
	print_string("\nNo overflow occured.")
	jal exit
overflow:
	print_string("\nOne overflow occured.")
exit:
	end
	
	# 1 3 exception 4 right