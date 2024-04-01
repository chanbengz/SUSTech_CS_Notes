.include "macro_print_str.asm"
.data
	fd1: .float 1.0
	dd1: .double -2.0
.text
	la t0, fd1
	flw ft0, (t0)
	la t0, dd1
	fld ft1, (t0)
	fmv.s fa0, ft0
	li a7, 2
	ecall
	fcvt.d.s ft0, ft0
	fle.d t1, ft0, ft1
	li t2, 1
	beq t1, t2, printLe
	j printGt
printLe:
	print_string(" LessOrEqual ")
	j printSecondData
printGt:
	print_string(" LargerThan ")
printSecondData:
	fmv.d fa0, ft1
	li a7, 3
	ecall
	end
