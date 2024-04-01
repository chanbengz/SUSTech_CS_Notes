.include "macro_print_str.asm"
.data
	a: .float 409.2675
	b: .word 0xc1a6fae1
	c: .float -409.2675
	d: .dword 0xc0611bf1a9fbe76d
	
.text
main:
	la a1, a
	lw a0, (a1)
	li a7, 34
	ecall
	print_string("\n")
	la a1, b
	flw fa0, 0(a1)
	li a7, 2
	ecall
	print_string("\n")
	la a1, c
	lw a0, (a1)
	li a7, 34
	ecall
	print_string("\n")
	la a1, d
	fld fa0, (a1)
	li a7, 3
	ecall
	print_string("\n")
	end
