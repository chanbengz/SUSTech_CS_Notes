#include <string.h>
#include <stdio.h>

int main()
{
	char buffer1[16];
	char buffer2[16];
	buffer2[0] = 'a';
	printf("%d\n", buffer2[0]);
	// Valgrind missed this one
	strcpy(buffer1, "1234567890123456");
	printf("%d\n", buffer2[0]);
	return 0;
}
