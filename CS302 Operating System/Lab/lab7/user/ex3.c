#include <ulib.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define TOTAL 5
/* to get enough accuracy, MAX_TIME (the running time of each process) should >1000 mseconds. */
#define MAX_TIME 10000
unsigned int acc[TOTAL];
int status[TOTAL];
int pids[TOTAL];

static void spin_delay(void)
{
	int i;
	volatile int j;
	for (i = 0; i != 200; ++i) {
		j = !j;
	}
}

int main(void)
{
	int i, time;
	memset(pids, 0, sizeof(pids));
	int goods[TOTAL] = { 3, 1, 4, 5, 2 };
	for (i = 0; i < TOTAL; i++) {
		acc[i] = 0;
		if ((pids[i] = fork()) == 0) {
			acc[i] = 0;
			while (1) {
				spin_delay();
				++acc[i];

				if (acc[i] == 200000) {
					set_good(goods[i]);
				}
				if (acc[i] > 4000000) {
					cprintf("child pid %d, acc %d\n",
						getpid(), acc[i]);
					exit(acc[i]);
				}
			}
		}
		if (pids[i] < 0) {
			goto failed;
		}
	}
	cprintf("main: fork ok,now need to wait pids.\n");

	for (i = 0; i < TOTAL; i++) {
		status[i] = 0;
		waitpid(pids[i], &status[i]);
	}
	cprintf("main: wait pids over\n");
	return 0;

failed:
	for (i = 0; i < TOTAL; i++) {
		if (pids[i] > 0) {
			kill(pids[i]);
		}
	}
	panic("FAIL: T.T\n");
}
