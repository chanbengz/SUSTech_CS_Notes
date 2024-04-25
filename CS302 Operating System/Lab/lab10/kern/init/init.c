#include <defs.h>
#include <stdio.h>
#include <string.h>
#include <console.h>
#include <kdebug.h>
#include <trap.h>
#include <clock.h>
#include <intr.h>
#include <pmm.h>
#include <kmonitor.h>

int kern_init(void) __attribute__((noreturn));


int
kern_init(void) {
    extern char edata[], end[];
    memset(edata, 0, end - edata);

    const char *message = " os is loading ...";
    cprintf("%s\n\n", message);


    pmm_init();       // init physical memory management

    idt_init();       // init interrupt descriptor table

    intr_enable();              // enable irq interrupt

    /* do nothing */
    while (1);
}
