.data
	r1: .double 15.0
	r2: .double 20.0
	r3: .double 5.0
.text
main:
	li a7,7
	ecall
	la a1,r1
	la a2,r2
	fmv.d fa3, fa0
	fld fa1, (a1)
	fld fa2, (a2)
	fgt.d t1, fa3, fa1
	bnez t1, rule2
	fcvt.s.d fa0, fa3
	li a7,2
	ecall
	j exit
rule2:
	fgt.d t1, fa3, fa2
	bnez t1, rule3
	fsub.d fa4, fa3, fa1
	fadd.d fa0, fa3, fa4
	li a7,2
	fcvt.s.d fa0, fa0
	ecall
	j exit
rule3:
	fsub.d fa4, fa3, fa2
	fadd.d fa3, fa3, fa4
	fadd.d fa3, fa3, fa4
	la a1, r3
	fld fa4, (a1)
	fadd.d fa0, fa3, fa4
	fcvt.s.d fa0, fa0
	li a7,2
	ecall
exit:
	li a7,10
	ecall