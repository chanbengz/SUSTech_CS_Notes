# Tasks

In this lab, you must implement 2 functions to get full marks.

You are allowed to modify only `kern/libs/stdio.c` and
`libs/sbi.c`. You are not allowed to modify other files. Modifications
of other files lead to penalties in your marks.

## The stuttering `double_cputs`

`cputs` sends the string it receives to stdout with a newline at the
end. It is just a homemade `puts`, which ships in nearly all Unix-like
system.

`double_cputs` is a `cputs` that stutters. `double_cputs("abc")`
should send to stdout `aabbcc\n`. Note that the output has exactly one
added newline at the end.

The implementation of `cputs` and the stub of `double_cputs` are in
`kern/libs/stdio.c`

## It is finished. Let's shut it down with `sbi_shutdown`

Implement `sbi_shutdown` so that the kernel will shut the machine down
when it exits. Look around in the `libs/sbi.c` for inspiration.

Note that we put a never-ending loop at the end of `main` immediately
after `sbi_shutdown`. Therefore, if `sbi_shutdown` fails to shut the
machine down, the kernel will loop forever.

If we do not have the loop at the end, when the `main` function exits,
the virtual RISC-V machine will reset (reboot) and spin up the kernel
again and again. You can have a try by removing the `sbi_shutdown` and
the loop.

# Submission

To submit the code, follow the instructions on the English manual of
Lab 2, A Quick Introduction to the C Programming Language.

Note that you need to use `git add` to stage `kern/libs/stdio.c` and
`libs/sbi.c` before you commit.

Useful make targets:

- `make` builds the kernel
- `make qemu` runs the kernel in QEMU
- `make qemu_gdb` runs the kernel in QEMU with GDB debugging enabled
- `make marking` run automated tests locally to evaluate the solution
- `make format` format all the files
- `make format_check` check the format of all the files
