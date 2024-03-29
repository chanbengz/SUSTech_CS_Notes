# set confirm off
set architecture riscv:rv64
target remote 127.0.0.1:3117
symbol-file bin/kernel
# display/12i $pc-8
set riscv use-compressed-breakpoints yes
break *0x1000
