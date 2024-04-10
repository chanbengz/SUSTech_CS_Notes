#include <stdio.h>
#include <proc.h>
#include <sem.h>
#include <assert.h>
#include <condvar.h>

#define N 5 

#define SLEEP_TIME 10

semaphore_t mutex; 
condvar_t p1; 
struct proc_struct *pdad,*pmom,*psister,*pyou;

int milk = 100;
void mom(int i)
{
    while (1)
    {
        //sleep(rand() % 2 + 1);

        down(&mutex);
        cprintf("Mom checks the fridge.\n");
        while (milk > 0)
        {
            cprintf("Mom waiting.\n");
            //pthread_cond_wait(&cond, &mutex);
            cond_wait(&p1,&mutex);
        }
        cprintf("Mom goes to buy milk...\n");
        cprintf("Mon comes back.\n");
        if (milk > 0)
            cprintf("What a waste of food! The fridge can not hold so much milk!\n");
        else{
            milk += 100;
            cprintf("Mom puts milk in fridge and leaves.\n");
        }
        up(&mutex);
        do_sleep(100);
    }
}
void sister(int i)
{
    while (1)
    {
        //sleep(rand() % 2 + 1);
        down(&mutex);
        cprintf("sis checks the fridge.\n");
        while (milk > 0)
        {
            cprintf("sis waiting.\n");
        //pthread_cond_wait(&cond, &mutex);;
        cond_wait(&p1, &mutex);
        }
            cprintf("sis goes to buy milk...\n");
            cprintf("sis comes back.\n");
        if (milk > 0)
            cprintf("What a waste of food! The fridge can not hold so much milk!\n");
        else{
            milk += 100;
            cprintf("sis puts milk in fridge and leaves.\n");
        }
        up(&mutex);
        do_sleep(100);
    }
}




void dad(int i)
{
    while (1)
    {
        //sleep(rand() % 2 + 1);
        down(&mutex);
        cprintf("Dad checks the fridge.\n");
        if (milk == 0)
        {
        //pthread_cond_signal(&cond);
        cond_signal(&p1);
            cprintf("Dad tell mom and sis to buy milk\n");
        }
        else
        {
            milk -= 20;
            cprintf("Dad eating 20 milk.\n");
        }
        up(&mutex);
        do_sleep(100);

    }
}


void you(int i){
    while (1)
    {
        //sleep(rand() % 2 + 1);
        down(&mutex);
        cprintf("you checks the fridge.\n");
        if (milk == 0)
        {
        //pthread_cond_signal(&cond);
            cond_signal(&p1);
            cprintf("you tell mom and sis to buy milk\n");
        }
        else
        {
            milk -= 20;
            cprintf("you eating 20 milk.\n");
        }
        up(&mutex);
        do_sleep(100);
        
    }
}


void check_milk(void){
    int pids[4];
    int milk = 100;
    sem_init(&(mutex),1);
    int i =0;
    cond_init(&p1);
    pids[0]=kernel_thread(dad, (void *)i, 0);
    pids[1]=kernel_thread(mom, (void *)i, 0);
    pids[2]=kernel_thread(sister, (void *)i, 0);
    pids[3]=kernel_thread(you, (void *)i, 0);
    pdad = find_proc(pids[0]);
    set_proc_name(pdad, "dad");
    pmom = find_proc(pids[1]);
    set_proc_name(pmom, "mom");
    psister = find_proc(pids[2]);
    set_proc_name(psister, "sister");
    pyou = find_proc(pids[3]);
    set_proc_name(pyou, "you");
}
