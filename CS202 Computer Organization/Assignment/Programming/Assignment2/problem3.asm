.data 
        half: .double 0.5
        nega: .double -1.0e-6
        pos: .double 1.0e-6
.text
main:
        addi sp,sp,-16
        call read_double
        fsd fa0,8(sp)
        fld fs4,8(sp)
        call read_double
        fsd fa0,8(sp)
        fld fs3,8(sp)
        call read_double
        fsd fa0,8(sp)
        fld fs2,8(sp)
        call read_double
        fsd fa0,8(sp)
        fld fs1,8(sp)
        call read_double
        fsd fa0,8(sp)
        fld fs0,8(sp)
        call read_double
        fsd fa0,8(sp)
        lw a3,8(sp)
        lw a4,12(sp)
        la a5, half
        fld fa1, (a5)
        la a5, nega
        fld fa2, (a5)
        la a5, pos
        fld ft0, (a5)
        fcvt.d.w fa0,x0
        j loop_entry
fx:
        fmul.d fa5,fs0,fs4
        fmul.d fa5,fa5,fs0
        fmul.d fa5,fa5,fs0
        fmul.d fa3,fs0,fs3
        fmul.d fa3,fa3,fs0
        fadd.d fa5,fa5,fa3
        fmul.d fa3,fs0,fs2
        fadd.d fa5,fa5,fa3
        fadd.d fa5,fa5,fs1
        fmul.d fa5,fa5,fa4
        flt.d a5,fa5,fa0
        beq a5,zero,store
loop:
        lw a3,8(sp)
        lw a4,12(sp)
        fld fa5,8(sp)
        fadd.d fa5,fs0,fa5
        fmul.d fa5,fa5,fa1
        fsd fa5,8(sp)
        fmul.d fa4,fs4,fa5
        fmul.d fa4,fa4,fa5
        fmul.d fa4,fa4,fa5
        fmul.d fa5,fs3,fa5
        fld fa3,8(sp)
        fmul.d fa5,fa5,fa3
        fadd.d fa4,fa4,fa5
        fmul.d fa5,fs2,fa3
        fadd.d fa4,fa4,fa5
        fadd.d fa4,fa4,fs1
        fgt.d a5,fa4,fa2
        beq a5,zero,fx
        flt.d a5,fa4,ft0
        beq a5,zero,fx
        li a7,3
        fmv.d fa0,fa3
        ecall
        li a7,10
        ecall
store:
        fld fs0,8(sp)
loop_entry:
        sw a3,8(sp)
        sw a4,12(sp)
        j loop

read_double:
        li a7,7
        ecall
        ret