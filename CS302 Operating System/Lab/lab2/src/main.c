#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>

// Non-intrusive linked list
typedef struct data {
	int val;
} data_t;

typedef struct int_list {
	data_t *data;
	struct int_list *next;
} int_list_t;

void init_int_list(int_list_t *head)
{
	head->next = NULL;
}
/**
 * add_to_int_list - add a new node to the front of the list
 *
 * TODO: First allocate a new block for the new node. Then make the
 * new node the first one in the list, directly pointed by head->next.
 *
 * @head:	The list to add to
 * @data:	The pointer to the data to be added
 *
 * @return:	0 on success; non-zero otherwise.
 *
 */
int add_to_int_list(int_list_t *head, data_t *data)
{
	int_list_t *new_node = malloc(sizeof(int_list_t));
	if (new_node == NULL) {
		return -1;
	}
	new_node->data = data;
	new_node->next = head->next;
	head->next = new_node;
	return 0;
}

/**
 * remove_from_int_list - remove a node to the front of the list
 *
 * TODO: Remove the first node from the list, which is the node
 * directly pointed by head->next. The block of memory for the node
 * should be freed.
 *
 * @head:	The list to be acted on .
 *
 * @return:	The pointer to the first data of the list; NULL if empty.
 *
 */
data_t *remove_from_int_list(int_list_t *head)
{
	if (head->next == NULL) {
		return NULL;
	}
	int_list_t *node = head->next;
	head->next = node->next;
	data_t *data = node->data;
	free(node);
	return data;
}

// Intrusive linked list
//
// From the Linux kernel
/**
 * container_of - cast a member of a structure out to the containing structure
 * @ptr:	the pointer to the member.
 * @type:	the type of the container struct this is embedded in.
 * @member:	the name of the member within the struct.
 *
 */
#define container_of(ptr, type, member)                            \
	({                                                         \
		const typeof(((type *)0)->member) *__mptr = (ptr); \
		(type *)((char *)__mptr - offsetof(type, member)); \
	})

typedef struct list_head {
	struct list_head *next;
} list_head_t;

void init_list(list_head_t *head)
{
	head->next = head;
}

/**
 * add_to_list_ - add a new node to the front of the list
 *
 * TODO: Make the new data the first one in the list, directly pointed
 * by head->next.
 *
 * @head:	The list to add to
 * @new_data:	The pointer to the data to be added
 *
 * @return:	0 on success; non-zero otherwise.
 *
 */
int add_to_list_(list_head_t *head, list_head_t *new_data)
{
	if (new_data == NULL || head == NULL) {
		return -1;
	}
	new_data->next = head->next;
	head->next = new_data;
	return 0;
}
#define add_to_list(head, new_data, member) \
	add_to_list_(head, &((new_data)->member))

/**
 * remove_from_int_list - remove a node to the front of the list
 *
 * TODO: Remove the first node from the list, which is the node
 * directly pointed by head->next.
 *
 * The special case of having only the sentinel node does not require
 * extra logic since we have a circular list.
 *
 * @head:	The list to be acted on.
 *
 * @return: The pointer to the first data of the list. Note that this
 * is a circular list and the caller is not expecting a NULL.
 *
 */
list_head_t *remove_from_list(list_head_t *head)
{
	if (head == head->next) {
		return NULL;
	}
	list_head_t *node = head->next;
	head->next = node->next;
	node->next = NULL;
	return node;
}

#define remove_from_typed_list(list_head, type, member) \
	container_of(remove_from_list(list_head), type, member)

typedef struct str_data_list {
	char *val;
	// list head
	list_head_t head;
} str_list_t;

typedef struct unsigned_list {
	unsigned long first;
	unsigned long _ignore;
	// list head
	list_head_t head;
} unsigned_list_t;

typedef struct context {
	int_list_t int_numbers;
	list_head_t *unsigned_numbers;
	list_head_t *strings;
} context_t;

typedef void (*list_action_fn)(context_t *);

void add_int_action(context_t *ctxt)
{
	data_t *data = malloc(sizeof(data_t));
	if (data == NULL) {
		exit(4);
	}
	if (scanf("%d", &data->val) != 1) {
		exit(2);
	}
	if (add_to_int_list(&ctxt->int_numbers, data) != 0) {
		exit(1);
	}
}

void rm_int_action(context_t *ctxt)
{
	data_t *data = remove_from_int_list(&ctxt->int_numbers);
	if (data == NULL) {
		exit(3);
	}
	printf("%d\n", data->val);
	free(data);
}

#define STR_LEN 15
#define STRINGIZE(V) XSTRINGIZE(V)
#define XSTRINGIZE(V) #V

void add_str_action(context_t *ctxt)
{
	char buffer[STR_LEN + 1];
	if (scanf("%" STRINGIZE(STR_LEN) "s", &buffer[0]) != 1) {
		exit(2);
	}
	str_list_t *data = malloc(sizeof(str_list_t));
	if (data == NULL) {
		exit(4);
	}
	data->val = malloc(sizeof(char) * (STR_LEN + 1));
	for (int i = 0; i < STR_LEN; i++) {
		data->val[i] = buffer[i];
	}
	if (add_to_list(ctxt->strings, data, head) != 0) {
		exit(1);
	}
}
void rm_str_action(context_t *ctxt)
{
	struct str_data_list *data = remove_from_typed_list(
		ctxt->strings, typeof(*data), head);
	printf("%s\n", data->val);
	free(data->val);
	free(data);
}
void add_unsigned_action(context_t *ctxt)
{
	unsigned_list_t *data = malloc(sizeof(unsigned_list_t));
	if (data == NULL) {
		exit(4);
	}
	if (scanf("%lu", &data->first) != 1) {
		exit(2);
	}
	if (add_to_list(ctxt->unsigned_numbers, data, head) != 0) {
		exit(1);
	}
}
void rm_unsigned_action(context_t *ctxt)
{
	struct unsigned_list *data = remove_from_typed_list(
		ctxt->unsigned_numbers, typeof(*data), head);
	if (data == NULL) {
		exit(3);
	}
	printf("%lu\n", data->first);
	free(data);
}

#define NUMBER_OF_LIST 3

int main()
{
	unsigned command = 0;
	unsigned which_list = 0;

	str_list_t str_list;
	unsigned_list_t unsigned_list;

	init_list(&str_list.head);
	init_list(&unsigned_list.head);

	context_t ctxt;
	init_int_list(&ctxt.int_numbers);
	ctxt.unsigned_numbers = &unsigned_list.head;
	ctxt.strings = &str_list.head;

	const list_action_fn actions[NUMBER_OF_LIST][2] = {
		{ add_int_action, rm_int_action },
		{ add_str_action, rm_str_action },
		{ add_unsigned_action, rm_unsigned_action }
	};
	while (1) {
		int res = scanf("%u%u", &command, &which_list);
		if (res != 2 || which_list >= NUMBER_OF_LIST ||
		    (command != 0 && command != 1)) {
			break;
		}
		(actions[which_list][command])(&ctxt);
	}
	return 0;
}
