#import "template.typ": *

#show: project.with(
  title: "OS Assignment 2",
  authors: (
    (
      name: "陈贲(12212231)",
    ),
  ),
)

#problem[
  Read Chapter 2 of "Operating System Concepts" and answer the following questions:
  + What are the “three easy pieces” of operating systems? Explain each of them with your own words.
  + How do these “three easy pieces” map to the chapters in the “dinosaur book”?
]

#solution[
  The three easy pieces of operating systems are:
  + *Virtualization:* OS manages physical hardware resources and transfers it into an interface for user programs, which is done by providing system calls to the user programs.
  + *Concurrency:* OS ensures to execute multiple processes correctly at the same time.
  + *Persistence:* OS manages the disk and stores data persistently into it through the file system.
  These three easy pieces map to the chapters from bottom to top by abstraction level in the di
nosaur book:
  + *Virtualization of CPU:* Chapter 3-5 Processes
  + *Concurrency:* Chapter 6-8 Threads and Synchronization
  + *Virtualization of Memory:* Chapter 9-10 Memory Management
  + *Persistence:* Chapter 11-15 File System
]

#problem[
  Read Chapter 6 of "Operating System Concepts" and explain what happens during context switch in detail?
]

#solution[
  During context switch, the kernel saves the general purpose registers, program counter, and kernel stack pointer of the current process onto the kernel stack and restores the registers above of the next process by executing assembly code. By doing that, the kernel can switch the control of the CPU from the current process to the next process. So, finally, the switch code will execute the return instruction, and since the context of the next process is already loaded, the next process will continue to execute. The context switch is completed.
]

#problem[
  Read slides “L03 Processes” and answer the following questions:
  + Explain what happens when the kernel handles the `fork()` system call.
  + Explain what happens when the kernel handles the `exit()` system call.
]

#solution[
  When a program invokes `fork()`, the OS will firstly save the context of the current process and switch to the kernel code to handle the system call. During the handling, the kernel clones the PCB of the parent process as the new PCB of the child process and assigns a new PID to the child process. Then, it will update the children list of the parent process and the parent PID of the child process. Next, the kernel will duplicate the address space of the parent process, which will either be the independent space for child process or the copyonwrite space for the parent and child process. Since the PCB of the child process is ready, it will be added to the ready queue and waited for the scheduler to execute. Finally, the kernel will set the return value of the `fork()` system call to the PID of the child process for the parent process and to 0 for the child process and the whole process is done and the control will be returned to the user program.

  When a program invokes `exit()`, the OS will do context switch to the kernel to handle this system call. During the syscall, the kernel will release the resources of the current process, including the codes, the allocated memory and the file descriptors. So the process terminated and return the status code. But the PCB of the process will not be released immediately, instead, it will be kept in the zombie state and waited for the parent process to read the exit status of the child process. The syscall will also send the SIGCHLD signal to the parent process to notify it that the child process has terminated. If the parent process invokes `wait()` or `waitpid()` to wait for the signal, the kernel will release the PCB of the child process once receiving it. However, if not, the PCB of the child process will be kept in the zombie state and the PCB of child process is not released.
]

#problem[
  What are the three methods of transferring the control of the CPU from a user process to OS kernel? Compare them in detail.
]

#show table.cell.where(y: 0): strong
#solution[
  The three methods and their comparison are:
  #align(center, table(
    columns: 4,
    table.header("Method", "Cause", "Kernel Function", "Example"),
    [*System Call*], [Active Invoke]    , [Library/Interface], [`fork()` and `printf()`],
    [*Exception*]  , [Illegal Behaviour], [Exception Handler], [Page fault, Divide by zero],
    [*Interrupt*]  , [External Event]   , [Interrupt Handler], [I/O operation, Timer interrupt]
  ))
]

#problem[
  Describe the life cycle of a process.
]

#solution[
  The life cycle of a process starts with the creation of it. The creation of it is usually caused by the three situations: kernel initiation, user request, or call of `fork()/exec*()`
  $ arrow.b.double $
  The creation of a process is done by the kernel. Firstly, the kernel will create a new PCB for it and allocate the PID and memory address space for it. Then, the kernel will initialize the PCB by setting the parent PID or so. And finally the process is created and added to the ready queue to wait for the scheduler to execute.
  $ arrow.b.double $
  The process will be executed by the CPU when it is scheduled by the scheduler, the requested resources is allocated or the waited event is triggered. The process will be executed until it is terminated or blocked. The block situation is caused by the opposite of the above three situations.
  $ arrow.b.double $
  When the process is done, it will be terminated. The termiantion is caused by normal exit, exception or killed by kernel. The kernel will release the allocated resources like memory and file descriptors and set the PCB to zombie state. The PCB will be released when the parent process reads the exit status of the child process. Once the PCB is released, the life cycle of the process ends.
]
