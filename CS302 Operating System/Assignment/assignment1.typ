#import "template.typ": *

#show: project.with(
  title: "Algorithm Assignment 1",
  authors: (
    (
      name: "陈贲(12212231)",
    ),
  ),
)

#problem[
  Explain the options of `make qemu` in Makefile, which is
  ```sh
  qemu-system-riscv64 \
    -machine virt \
    -nographic \
    -bios default \
    -device loader,file=bin/ucore.bin,addr=0x80200000
  ```
]

#solution[
  - `-machine virt`: use RISC-V VirtIO board as virtual machine
  - `-nographic`: disable graphical output and redirect serial I/Os to console
  - `-bios default`: use the default firmware
  - `-device loader,file=bin/ucore.bin,addr=0x80200000`: use the Generic Loader driver device, and pass the loader options to it, telling the loader to load `ucore.bin` to the address 0x80200000 in the memory.
]
