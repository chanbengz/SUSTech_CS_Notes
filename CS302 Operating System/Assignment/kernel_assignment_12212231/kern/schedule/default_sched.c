#include <defs.h>
#include <list.h>
#include <proc.h>
#include <assert.h>
#include <default_sched.h>

static void good_init(struct run_queue *rq)
{
	list_init(&(rq->run_list));
	rq->proc_num = 0;
	rq->labschedule_run_pool = NULL;
}

static void good_enqueue(struct run_queue *rq, struct proc_struct *proc)
{
	list_add_before(&(rq->run_list), &(proc->run_link));
	if (proc->time_slice == 0 || proc->time_slice > rq->max_time_slice) {
		proc->time_slice = rq->max_time_slice;
	}
	proc->rq = rq;
	rq->proc_num++;
}

static void good_dequeue(struct run_queue *rq, struct proc_struct *proc)
{
	assert(!list_empty(&(proc->run_link)) && proc->rq == rq);
	list_del_init(&(proc->run_link));
	rq->proc_num--;
}

static struct proc_struct *good_pick_next(struct run_queue *rq)
{
	list_entry_t *le = list_next(&(rq->run_list));
	if (le == &(rq->run_list)) {
		return NULL;
	}
	struct proc_struct *p = le2proc(le, run_link);
	le = list_next(le);
	while (le != &(rq->run_list)) {
		struct proc_struct *q = le2proc(le, run_link);
		if (p->labschedule_good < q->labschedule_good) {
			p = q;
		}
		le = list_next(le);
	}
	return p;
}

static void good_proc_tick(struct run_queue *rq, struct proc_struct *proc)
{
	if (proc->time_slice > 0) {
		proc->time_slice--;
	}
	if (proc->time_slice == 0) {
		proc->need_resched = 1;
	}
}

struct sched_class default_sched_class = {
	.name = "good_scheduler",
	.init = good_init,
	.enqueue = good_enqueue,
	.dequeue = good_dequeue,
	.pick_next = good_pick_next,
	.proc_tick = good_proc_tick,
};
