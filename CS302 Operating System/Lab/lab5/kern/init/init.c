#include <clock.h>
#include <console.h>
#include <defs.h>
#include <ide.h>
#include <intr.h>
#include <kdebug.h>
#include <kmonitor.h>
#include <pmm.h>
#include <proc.h>
#include <stdio.h>
#include <string.h>
#include <swap.h>
#include <trap.h>
#include <vmm.h>

int kern_init(void) __attribute__((noreturn));

int kern_init(void)
{
	extern char edata[], end[];
	memset(edata, 0, end - edata);

	cons_init(); // init the console

	const char *message = " os is loading ...";
	cprintf("%s\n\n", message);

	pmm_init(); // init physical memory management
	idt_init(); // init interrupt descriptor table

	vmm_init(); // init virtual memory management
	proc_init(); // init process table

	ide_init(); // init ide devices
	swap_init(); // init swap

	intr_enable(); // enable irq interrupt

	cpu_idle(); // run idle process
}
