#include <defs.h>
#include <riscv.h>
#include <stdio.h>
#include <string.h>
#include <swap.h>
#include <swap_clock.h>
#include <list.h>
#include <pmm.h>


list_entry_t pra_list_head, *curr_ptr;

static int
_clock_init_mm(struct mm_struct *mm)
{   // the list is empty
    mm->sm_priv = NULL;
    return 0;
}

static int
_clock_map_swappable(struct mm_struct *mm, uintptr_t addr, struct Page *page, int swap_in)
{
    list_entry_t *head = (list_entry_t*) mm->sm_priv;
    list_entry_t *entry = &(page->pra_page_link);
    assert(entry != NULL);

    // insert before the current pointer
    if (head == NULL) {   // head can be null if the list is empty
        list_init(entry); // create a new list if empty
        mm->sm_priv = entry;
    } else {
        list_add_before(head, entry);
    }

    return 0;
}


static int
_clock_swap_out_victim(struct mm_struct *mm, struct Page ** ptr_page, int in_tick)
{
    list_entry_t *head=(list_entry_t*) mm->sm_priv;
    assert(head != NULL && in_tick==0);
    list_entry_t *curr_ptr = NULL, *p = head;

    // search NOT accessed and NOT dirty
    do {
        pte_t* ptep = get_pte(mm->pgdir, (le2page(p, pra_page_link))->pra_vaddr, 0);
        bool accessed = *ptep & PTE_A; // from assignment doc
        bool dirty = *ptep & PTE_D;    // similar to accessed

        if (!accessed && !dirty) {
            curr_ptr = p;
            break;
        }

        p = list_next(p);
    } while (p != head);

    // search the NOT accessed and dirty, then reset accessed bit of its front page(s)
    if (curr_ptr == NULL) do {
        pte_t* ptep = get_pte(mm->pgdir, (le2page(p, pra_page_link))->pra_vaddr, 0);
        bool accessed = *ptep & PTE_A;
        bool dirty = *ptep & PTE_D;

        if (!accessed && dirty) {
            curr_ptr = p;
            break;
        }

        {   // clear accessed bit
            struct Page *page = le2page((p), pra_page_link);
            pte_t *ptep = get_pte((mm->pgdir), page->pra_vaddr, 0);
            *ptep = *ptep & ~PTE_A;
            tlb_invalidate((mm->pgdir), page->pra_vaddr); // clear TLB, learn from swap.c
        }

        p = list_next(p);
    } while (p != head);
    
    // search NOT accessed and NOT dirty again
    if (curr_ptr == NULL) do {
        pte_t* ptep = get_pte(mm->pgdir, (le2page(p, pra_page_link))->pra_vaddr, 0);
        bool accessed = *ptep & PTE_A;
        bool dirty = *ptep & PTE_D;

        if (!accessed && !dirty) {
            curr_ptr = p;
            break;
        }

        p = list_next(p);
    } while (p != head);
    
    // search NOT accessed and dirty again
    if (curr_ptr == NULL) do {
        pte_t* ptep = get_pte(mm->pgdir, (le2page(p, pra_page_link))->pra_vaddr, 0);
        bool accessed = *ptep & PTE_A;
        bool dirty = *ptep & PTE_D;

        if (!accessed && dirty) {
            curr_ptr = p;
            break;
        }

        p = list_next(p);
    } while (p != head);
    
    // remove pointed element
    head = curr_ptr;
    if (list_empty(head)) {
        mm->sm_priv = NULL;
    } else {
        mm->sm_priv = list_next(head);
        list_del(head);
    }

    // update the pointer
    *ptr_page = le2page(head, pra_page_link);

    return 0;
}


static int
_clock_check_swap(void) {

    cprintf("---------Clock check begin----------\n");
    cprintf("write Virt Page c in clock_check_swap\n");
    *(unsigned char *)0x3000 = 0x0c;
    assert(pgfault_num==4);
    cprintf("write Virt Page a in clock_check_swap\n");
    *(unsigned char *)0x1000 = 0x0a;
    assert(pgfault_num==4);
    cprintf("write Virt Page d in clock_check_swap\n");
    *(unsigned char *)0x4000 = 0x0d;
    assert(pgfault_num==4);
    cprintf("write Virt Page b in clock_check_swap\n");
    *(unsigned char *)0x2000 = 0x0b;  
    assert(pgfault_num==4);
    cprintf("write Virt Page e in clock_check_swap\n");
    *(unsigned char *)0x5000 = 0x0e;
    assert(pgfault_num==5);
    cprintf("write Virt Page b in clock_check_swap\n");
    *(unsigned char *)0x2000 = 0x0b;
    assert(pgfault_num==5);
    cprintf("write Virt Page a in clock_check_swap\n");
    *(unsigned char *)0x1000 = 0x0a;
    assert(pgfault_num==6);
    cprintf("write Virt Page b in clock_check_swap\n");
    *(unsigned char *)0x2000 = 0x0b;
    assert(pgfault_num==6);
    cprintf("write Virt Page c in clock_check_swap\n");
    *(unsigned char *)0x3000 = 0x0c;
    assert(pgfault_num==7);
    cprintf("write Virt Page d in clock_check_swap\n");
    *(unsigned char *)0x4000 = 0x0d;
    assert(pgfault_num==8);
    cprintf("write Virt Page e in clock_check_swap\n");
    *(unsigned char *)0x5000 = 0x0e;
    assert(pgfault_num==9);
    cprintf("write Virt Page a in clock_check_swap\n");
    assert(*(unsigned char *)0x1000 == 0x0a);
    *(unsigned char *)0x1000 = 0x0a;
    assert(pgfault_num==9);
    cprintf("Clock check succeed!\n");

    return 0;
}


static int
_clock_init(void)
{
    return 0;
}

static int
_clock_set_unswappable(struct mm_struct *mm, uintptr_t addr)
{
    return 0;
}

static int
_clock_tick_event(struct mm_struct *mm)
{ return 0; }


struct swap_manager swap_manager_clock =
{
     .name            = "clock swap manager",
     .init            = &_clock_init,
     .init_mm         = &_clock_init_mm,
     .tick_event      = &_clock_tick_event,
     .map_swappable   = &_clock_map_swappable,
     .set_unswappable = &_clock_set_unswappable,
     .swap_out_victim = &_clock_swap_out_victim,
     .check_swap      = &_clock_check_swap,
};
