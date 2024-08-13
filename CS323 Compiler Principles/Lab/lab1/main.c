#include "linked_list.h"

int main(void){
    node *head = linked_list_init();
    char *string;
    printf("%d\n", linked_list_size(head));
    linked_list_append(head, 1);
    linked_list_append(head, 2);
    linked_list_append(head, 3);
    string = linked_list_tostring(head);
    puts(string);
    linked_list_insert(head, 5, 2);
    linked_list_insert(head, 6, 2);
    linked_list_insert(head, 999, 999);
    linked_list_delete(head, 2);
    linked_list_remove(head, 5);
    string = linked_list_tostring(head);
    puts(string);
    printf("%d\n", linked_list_size(head));
    linked_list_free(head);
    return 0;
}
