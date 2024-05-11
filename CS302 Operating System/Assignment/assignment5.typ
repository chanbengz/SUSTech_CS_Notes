#import "template.typ": *

#show: project.with(
  title: "OS Assignment 5",
  authors: (
    (
      name: "陈贲(12212231)",
    ),
  ),
)

#problem[
  In a demand-paging memory management system, suppose the page table contents for a certain process are as follows (for a single-level page table, with H denoting hexadecimal values):
  #show table.cell.where(y: 0): strong
  #align(center, table(
    columns: 3,
    inset: (x: 2em),
    table.header("Virtual Page No.", "Page Frame No.", "Valid Bit"),
    [0], [], [0],
    [1], [122H], [1],
    [2], [233H], [1]
  ))
  The page size is 4 KB, the access time for main memory is 100 ns, the access time for the TLB is 10 ns, and the average time to handle a page fault, including the time to update the TLB and page table, is $10^8$ ns. Assuming:
  + The TLB is initially empty
  + During address translation, the TLB is accessed ﬁrst. If there is a miss in the TLB, the page table is accessed subsequently (ignoring the time taken to update the TLB after accessing the page table)
  + A valid bit set to 0 indicates that the page is not present in memory, causing a page fault interrupt. After the page fault interrupt handling is completed, the execution returns to the instruction that triggered the page fault to execute.
  #par(first-line-indent: 0cm, "Given a virtual address access sequence of 1333H, 0555H, 2555H:")
  + What is the time required to sequentially access each of the three virtual addresses mentioned above? Give the calculation process. The answer should include the time cost of the final access to the physical address.
  + Suppose the operating system permits processes to use only two physical pages with frame numbers 122H and 233H, employing the Least Recently Used (LRU) replacement algorithm. Given the certain access sequence above, what is the physical address for the virtual address 0555H? Please explain the reasoning behind your answer.
]

#solution[
  + The first address 1333H is not in the TLB, so the TLB is accessed first, resulting in a TLB miss. The page table is then accessed. Since it's valid in page table, the main memory is accessed. The time taken for the first is $10 + 100 times 2 = 210" ns"$. The second address 0555H is not in the TLB, nor in the page table. So it will take $10 + 100 + 10^8 + 100 = 100000210" ns"$ to access TLB, handle page fault, and access main memory. The third address 2555H is not in TLB but in page table. So it will take $10 + 100 times 2 = 210" ns"$ to access main memory. The total time is $210 + 100000210 + 210 = 100000630" ns"$. The time to access the physical address is considered.
  + Since the virtual address 1333H is accessed before 0555H, the second virtual page is the least recently used page, which will be swapped out and the phyical page frame will be deallocated. The physical page with frame number 233H will be allocated to the No. 0 virtual page. So the physical address for the virtual address 0555H is 233555H.
]

#problem[
  Here is a computer with a riscv64 architecture, employing the sv39 multi-level paging mechanism. The formats for physical and virtual addresses are as follows.
  #align(center, image(
    "img/a5p2.png"
  ))
  Assuming there are only three free physical pages in memory, with physical page numbers being 0x00000086000, 0x00000086001, and 0x00000086002. When a process requests a physical page, the operating system adopts an allocation strategy of assigning physical page numbers from largest to smallest. At a certain point, the value in the `satp` register is 0x8000000000084000, with all PTEs in the root page table being zero. The current process attempts to access the valid virtual address 0x0000002123456789. Please simulate the computer's handling of the page fault interrupt, allocate the corresponding physical page, correctly fill in the corresponding page table entry, and find the corresponding physical address.
]

#solution[
  #set enum(numbering: "1.")
  #show table.cell.where(y: 0): strong
  The virtual address is
  #align(center, table(
    columns: 4,
    inset: (x: 1em),
    table.header("VPN[2]", "VPN[1]", "VPN[0]", "Offset"),
    [010000100], [100011010], [001010110], [011110001001]
  ))
  + The physical address of the root page table is $underline("0x00000084000000")$, and the value of the $underline("0x084")$-th page table entry is $underline("0x0000000021800800")$
  + The physical address of second-level page table is $underline("0x00000086002000")$, and the value of the $underline("0x11A")$-th page table entry is $underline("0x0000000021800400")$
  + The physical address of third-level page table is $underline("0x00000086001000")$, and the value of the $underline("0x056")$-th page table entry is $underline("0x0000000021800000")$ 
  + The physical address corresponding to the virtual address is $underline("0x00000086000789")$
]