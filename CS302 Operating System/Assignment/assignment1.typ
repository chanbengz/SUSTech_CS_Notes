#import "template.typ": *

#show: project.with(
  title: "OS Assignment 1",
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

#problem[
  Please explain the function of each line in the following snippet from the `tools/kernel.ld` linker script ﬁle.
  ```sh
  SECTIONS
  {
    /* Load the kernel at this address: "." means the current address */
    . = BASE_ADDRESS;

    .text : {
        *(.text.kern_entry)
        *(.text .stub .text.* .gnu.linkonce.t.*)
    }

    PROVIDE(etext = .); /* Define the 'etext' symbol to this value */

    .rodata : {
        *(.rodata .rodata.* .gnu.linkonce.r.*)
    }

    /* Adjust the address for the data segment to the next page */
    . = ALIGN(0x1000);
  ```
]

#solution[
  - `. = BASE_ADDRESS;`: set the starting address of the output file to BASE_ADDRESS in memory
  - `.text : { ... }`: define the `.text` section, and map the sections in the following order: `.text` of kern_entry, and other sections of the input files that contain the names `.text`, `.stub`, `.text.*`, and `.gnu.linkonce.t.*` to it
  - `PROVIDE(etext = .);`: define the `etext` symbol to the current address, i.e., the end of the `.text` section and the beginning of the `.rodata` section
  - `.rodata : { ... }`: define the `.rodata` section, and map the sections of the input files that contain the names `.rodata`, `.rodata.*`, and `.gnu.linkonce.r.*` to it
  - `. = ALIGN(0x1000);`: adjust the address for the data segment to the next page, making the start address of the `.data` section be the multiple of 0x1000 power of 2
]

#problem[
  Please explain the parameters and the purpose of the statement `memset(edata, 0, end - edata);` within `kern/init/init.c`.
]

#solution[
  The parameters, `edata` is the start address of `.bss` section, and `end` is the end address of the section, whose values are assigned in `kernel.ld` by the PROVIDE keyword. The statement is used to initialize the `.bss` section to zero, by calling the `memset()`.
]

#problem[
  Please describe how the `cputs()` instruction prints characters through SBI.
]

#solution[
  The `cputs()` will eventually set a7 register to `SBI_CONSOLE_PUTCHAR` = 1 and a0 register to the character to be printed, and then invoke `ecall` to trigger the environment call. The ecall is defined and handled by SBI which is working in the machine mode as a firmware. And then SBI will print the character to the console.
]
