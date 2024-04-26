#import "template.typ": *

#show: project.with(
  title: "OS Assignment 4",
  authors: (
    (
      name: "陈贲(12212231)",
    ),
  ),
)

#problem[
  Read Chapter 15 of "Three Easy Pieces" and explain how do the CPU hardware and the operating system cooperate in the prcedure of address translation.
]

#solution[
  #set enum(numbering: "1.")
  The hardware and operating system cooperate in these aspects:
  + *Protection:* Before executing the program, OS will allocate virtual memory to the program and set the base/bounds registers in the MMU (Memory Management Unit) of the CPU. The OS will ensure that the base/bounds registers are set correctly and the program cannot access memory outside the allocated memory.
  + *Access:* When executing the program, the process may access memory by the virtual address. If the virtual address is legal, the MMU will translate the virtual address to the physical address by the base/bounds registers, i.e., physical address = virtual address + base.
  + *Handling exception:* If the virtual address is illegal, the MMU will raise an exception to the OS, after which the OS will handle the exception by killing the process and run the termination step.
  + *Context Switch:* During the context switch, the OS will save the base/bounds registers of the current process and restore the base/bounds registers when returning from trap.
  + *Termination:* When the process terminates, the OS will deallocate the memory and reset the base/bounds registers by maintaining a list of free memory.
]

#problem[
  Read Chapter 16 and 18 of "Three Easy Pieces" and compare segmentation and paging.
]

#solution[
  #show table.cell.where(y: 0): strong
  The comparison between segmentation and paging is as follows:
  #align(center, table(
    columns: 3,
    inset: (x: 1em),
    fill: (x, y) => if(y == 0) {luma(230)} else {white},
    align: horizon,
    table.header("Aspect", "Segmentation", "Paging"),
    [Size of Chunk], [Requested by program, \ flexible], [Determined by hardware, \ fixed],
    [Management of Free Space], [Rearranging segments, \ Free linked-list algorithm], [Free Lists, \ simpler than segmentation],
    [Context Switch Overhead], [Large, since OS needs to set the base/bound register], [Low, mostly access through page table entries in memory],
    [Fragmentation], [External], [Internal],
    [Status Bits], [No], [Yes, dirty, present, etc.],
    [Protection Bits], [Support RWX/Sharing], [Support RWX/Privilege etc.],
    [Address Translation], [Base/Bound Register], [Mapped by Page Table],
    [Visibility], [Visible to program], [Invisible to program],
  ))
]

#problem[
  Consider a system with the following specification:
  - 46-bit virtual address space
  - Page size of 8KB
  - Page table entry of 4 bytes
  - Every page table is required to fit into a single page
  How many levels of page tables would be required to map the entire virtual address space? Please document the format of a virtual address under this translation scheme. Briefly explain your rationale.
]

#solution[
  From the second and fourth item of the specification, we can calculate the offset as
  $ 8"KBytes" = 2^13 "Bytes" arrow.r.double b_"offset" = 13 $
  and each page table has
  $ (8 "KB") / (4 "Bytes") = 2^11 "entries" arrow.r.double b_"index" = 11 $
  by observation, we should have three levels of page tables since the address space
  $ 46 = 3 times b_"index" + b_"offset" $
  so the format of the virtual address is
  #align(center, table(
    columns: 4,
    inset: (x: 1em),
    [_11 bit L1 page_], [_11 bit L2 page_], [_11 bit L3 page_], [_13 bit offset_]
  ))
]

#problem[
  Consider a system with the following specification:
  - Both virtual and physical address spaces are 32-bit.
  - Page table entry size is 4 bytes.
  Answer the questions:
  
  (1) Suppose it uses 1-level page table, the format of the translation scheme is
  #align(center, table(
    columns: 2,
    inset: (x: 2em),
    [_20 bit page_], [_12 bit offset_]
  ))
  What is the page size? What is the maximum page table size?
  
  (2) Suppose it uses 2-level page table, the format of the translation scheme is
  #align(center, table(
    columns: 3,
    inset: (x: 2em),
    [_10 bit page_], [_10 bit page_], [_12 bit offset_]
  ))
  - Please write down the first level page number and its offset in decimal of virtual address *0xC302C302*
  - Please write down the second level page number and its offset in decimal of virtual address *0xEC6666AB*
]

#solution[
  + The page size is $2^12 "Bytes" = 4"KB"$ and the maximum page table size is $2^20 * 4"Bytes" = 4"MB"$.
  + The first level page number is $1100001100_2 = 780_10$, and offset is $"0x"302 = 770_10$ \
    The second level page number is $1001100110_2 = 614_10$, and offset is $"0x"6"AB" = 1707_10$
]

#problem[
  Please realize merging free blocks in `default_free_pages()`.
]

#solution[ The code is as follows:
  #align(center, image(
    "img/a4p5_code.png"
  ))
  #par(first-line-indent: 0cm, "and the running result is")
  #align(center, image(
    "img/a4p5_result.png"
  ))
]

#problem[
  Realize `bestfit` algorithm in `best_fit_pmm.c`
]

#solution[
  The core code for best fit is as follows:
  #align(center, image(
    "img/a4p6_code.png"
  ))
  #par(first-line-indent: 0cm, "and the running result is")
  #align(center, image(
    "img/a4p6_result.png"
  ))
]