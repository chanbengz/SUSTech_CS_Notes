#include "linked_list.h"

node *linked_list_init(){
    node *head = (node*)malloc(sizeof(node));
    head->count = 0;
    head->next = NULL;
    return head;
}

void linked_list_free(node *head){
    node *cur = head;
    node *last;
    while(cur != NULL){
        last = cur;
        cur = cur->next;
        free(last);
    }
}

char linked_list_string[0x10000];

char *linked_list_tostring(node *head){
    node *cur = head->next;
    char *position;
    int length = 0;
    while(cur != NULL){
        position = linked_list_string + length;
        length += sprintf(position, "%d", cur->value);
        cur = cur->next;
        if(cur != NULL){
            position = linked_list_string + length;
            length += sprintf(position, "->");
        }
    }
    position = linked_list_string + length;
    length += sprintf(position, "%c", '\0');
    return linked_list_string;
}

int linked_list_size(node *head){
    return head->count;
}

void linked_list_append(node *head, int val){
    node *cur = head;
    node *new_node;
    while(cur->next != NULL){
        cur = cur->next;
    }
    new_node = (node*)malloc(sizeof(node));
    new_node->value = val;
    new_node->next = NULL;
    cur->next = new_node;
    head->count++;
}

/* your implementation goes here */

void linked_list_insert(node *head, int val, int index){
    if(index < 0 || head->count <= index) return;
    node *cur = head;
    node *new_node;
    for(int i = 0; i < index; i++) {
        cur = cur->next;
    }
    new_node = (node*) malloc(sizeof(node));
    new_node->value = val;
    new_node->next = cur->next;
    cur->next = new_node;
    head->count++;
}

void linked_list_delete(node *head, int index){
    if(index < 0 || head->count <= index) return;
    node *cur = head;
    for(int i = 0; i < index; i++) {
        cur = cur->next;
    }
    node *temp = cur->next;
    cur->next = temp->next;
    head->count--;
    free(temp);
}

void linked_list_remove(node *head, int val){
    node *cur = head;
    while(cur->next){
        if(cur->next->value == val){
            node *temp = cur->next;
            cur->next = temp->next;
            free(temp);
            head->count--;
            return;
        } else {
            cur = cur->next;
        }
    }
}

void linked_list_remove_all(node *head, int val){
    node *cur = head;
    while(cur->next){
        if(cur->next->value == val){
            node *temp = cur->next;
            cur->next = temp->next;
            free(temp);
            head->count--;
        } else {
            cur = cur->next;
        }
    }
}

int linked_list_get(node *head, int index){
    if(index < 0 || head->count <= index) return -0x80000000;
    node *cur = head;
    for (int i = 0; i <= index; i++) {
        cur = cur->next;
    }
    return cur->value;
}

int linked_list_search(node *head, int val){
    node *cur = head;
    for(int i = 0; cur->next; i++, cur = cur->next){
        if(cur->next->value == val){
            return i;
        }
    }
    return -1;
}

node *linked_list_search_all(node *head, int val){
    node *new_head = linked_list_init();
    node *cur = head;
    for(int i = 0; cur->next; i++){
        if(cur->next->value == val){
            linked_list_append(new_head, i);
        }
        cur = cur->next;
    }
    return new_head;
}
