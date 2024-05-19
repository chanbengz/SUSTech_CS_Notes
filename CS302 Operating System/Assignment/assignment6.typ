#import "template.typ": *

#show: project.with(
  title: "OS Assignment 6",
  authors: (
    (
      name: "陈贲(12212231)",
    ),
  ),
)

#problem[
	Read Chapter 21 of "Three Easy Pieces" and explain what happens when the process accesses a memory page not present in the physical memory.
]

#solution[
#set enum(numbering: "1.")
	+ When the present bit is zero, which means that the page swapped out to the disk, the hardware will trigger a page fault. Then the kernel will handle the page fault.
	+ To handle the page fault, the kernel will find a free page in the physical memory and read the page from the disk to the physical memory. When the present bit is zero, the PFN field stores the address of the page on the disk, which is used to locate the page on the disk.
	+ After the IO operation of disk is done, the kernel will update the physical memory and create a new mapping from the virtual address to the physical address.
	+ Finally, the kernel will return the control to the process, and the process will re-execute the instruction that caused the page fault with the page available.
]

#problem[
	Realize Clock algorithm in `sway_clock.c`
]

#solution[
	The code implements the clock algorithm
	#align(center, image(
    "img/a6p2_code1.png"
  ))
	Note that beyond checking the accessed bit, the code also checks the dirty bit. At first it tries to find unvisted and unmodified one, which is not accessed before. If it didn't find the unvisited and unmodified one, try to find one the dirty bit is set, where the page needs to be written back to the disk.
	#align(center, image(
    "img/a6p2_code2.png"
  ))
	#align(center, image(
    "img/a6p2_code3.png"
  ))
  #par(first-line-indent: 0cm, "and the running result is")
  #align(center, image(
    "img/a6p2_result.png"
  ))
]