#ifndef __KERN_SYNC_MONITOR_CONDVAR_H__
#define __KERN_SYNC_MOINTOR_CONDVAR_H__

#include <sem.h>

typedef struct condvar{
//================your code=====================
} condvar_t;



void     cond_init (condvar_t *cvp);

void     cond_signal (condvar_t *cvp);

void     cond_wait (condvar_t *cvp, semaphore_t *mutex);
     
#endif /* !__KERN_SYNC_MONITOR_CONDVAR_H__ */
