#include<stdio.h>
#include<stdlib.h>

typedef struct node {
    union {
        int count;
        int value;
    };
    struct node *next;
} node;

/* initialize a linked list, head node is special */
node *linked_list_init();

/* destroy a linked list, free spaces */
void linked_list_free(node *head);

/* display elements in the linked list */
char *linked_list_tostring(node *head);

/* get the length of the linked list */
int linked_list_size(node *head);

/* insert val at the last of the linked list */
void linked_list_append(node *head, int val);

/*
 * You should implement functions according to the follow function
 * declarations. One thing to note that, the parameter *index*
 * refers to the position of value node, i.e., index 0 corresponds
 * to the next node of the header node.
 *
 * In case of out-of-bound index, your code should do nothing in all
 * functions. As for remove, if the value doesn't exist, do nothing.
 *
 * For get, if index out of bound, return INT_MIN (you will need to include "limit.h" header file).
 * For search, if value not exists. return -1.
 * For search_all, if value not exists, return empty list.
 */

/* insert val at position index */
void linked_list_insert(node *head, int val, int index);

/* delete node at position index */
void linked_list_delete(node *head, int index);

/* remove the first occurence node of val */
void linked_list_remove(node *head, int val);

/* remove all occurences of val */
void linked_list_remove_all(node *head, int val);

/* get value at position index */
int linked_list_get(node *head, int index);

/* search the first index of val */
int linked_list_search(node *head, int val);

/* search all indexes of val */
node *linked_list_search_all(node *head, int val);

