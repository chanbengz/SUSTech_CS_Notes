#include <clock.h>
#include <console.h>
#include <defs.h>
#include <intr.h>
#include <kdebug.h>
#include <kmonitor.h>
#include <pmm.h>
#include <riscv.h>
#include <stdio.h>
#include <string.h>
#include <trap.h>
#include <sbi.h>

extern char edata[], end[];
extern char kern_entry[];

int kern_init()
{
	memset(edata, 0, end - edata);

	const char *message = "os is loading ...\n";
	cputs(message);

	sbi_shutdown();

	while (1) {
	}
	return 1;
}
