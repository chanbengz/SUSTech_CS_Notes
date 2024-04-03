.data 
.LC0:
        .word   0
        .word   1071644672
.LC1:
        .word   -1598689907
        .word   -1095710985
.LC2:
        .word   -1598689907
        .word   1051772663
.text
main:
        addi    sp,sp,-80
        sw      ra,76(sp)
        fsd     fs0,56(sp)
        fsd     fs1,48(sp)
        fsd     fs2,40(sp)
        fsd     fs3,32(sp)
        fsd     fs4,24(sp)
        call    read_double
        fsd     fa0,8(sp)
        fld     fs4,8(sp)
        call    read_double
        fsd     fa0,8(sp)
        fld     fs3,8(sp)
        call    read_double
        fsd     fa0,8(sp)
        fld     fs2,8(sp)
        call    read_double
        fsd     fa0,8(sp)
        fld     fs1,8(sp)
        call    read_double
        fsd     fa0,8(sp)
        fld     fs0,8(sp)
        call    read_double
        fsd     fa0,8(sp)
        lw      a3,8(sp)
        lw      a4,12(sp)
        lui     a5,%hi(.LC0)
        fld     fa1,%lo(.LC0)(a5)
        lui     a5,%hi(.LC1)
        fld     fa2,%lo(.LC1)(a5)
        lui     a5,%hi(.LC2)
        fld     ft0,%lo(.LC2)(a5)
        fcvt.d.w        fa0,x0
        j       .L9
.L5:
        fmul.d  fa5,fs0,fs4
        fmul.d  fa5,fa5,fs0
        fmul.d  fa5,fa5,fs0
        fmul.d  fa3,fs0,fs3
        fmul.d  fa3,fa3,fs0
        fadd.d  fa5,fa5,fa3
        fmul.d  fa3,fs0,fs2
        fadd.d  fa5,fa5,fa3
        fadd.d  fa5,fa5,fs1
        fmul.d  fa5,fa5,fa4
        flt.d   a5,fa5,fa0
        beq     a5,zero,.L14
.L8:
        lw      a3,8(sp)
        lw      a4,12(sp)
        fld     fa5,8(sp)
        fadd.d  fa5,fs0,fa5
        fmul.d  fa5,fa5,fa1
        fsd     fa5,8(sp)
        fmul.d  fa4,fs4,fa5
        fmul.d  fa4,fa4,fa5
        fmul.d  fa4,fa4,fa5
        fmul.d  fa5,fs3,fa5
        fld     fa3,8(sp)
        fmul.d  fa5,fa5,fa3
        fadd.d  fa4,fa4,fa5
        fmul.d  fa5,fs2,fa3
        fadd.d  fa4,fa4,fa5
        fadd.d  fa4,fa4,fs1
        fgt.d   a5,fa4,fa2
        beq     a5,zero,.L5
        flt.d   a5,fa4,ft0
        beq     a5,zero,.L5
        li      a7,3
        fmv.d   fa0,fa3
        ecall
        li      a7,10
        ecall
.L14:
        fld     fs0,8(sp)
.L9:
        sw      a3,8(sp)
        sw      a4,12(sp)
        j       .L8

read_double:
        li      a7,7
        ecall
        ret