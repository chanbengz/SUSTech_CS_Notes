#include <stdlib.h>

void feel_like_some_memory()
{
	char *block = calloc(16, sizeof(char));
	block[0] = 'a';
	block[1] = 'b';
	block[2] = 'c';
	// deliberately forget to free the memory
}

int main()
{
	feel_like_some_memory();
	// memory leaks do no break things until out of memory
	return 0;
}
