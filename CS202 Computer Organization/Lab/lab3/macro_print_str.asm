.macro print_string(%str)
.data
    pstr: .asciz %str
.text
    la a0, pstr
    li a7, 4
    ecall
.end_macro

.macro end
    li a7, 10
    ecall
.end_macro