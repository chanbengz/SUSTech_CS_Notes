#include <stdio.h>

int main()
{
	int a[16] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
	// The following statements have the same meanings
	int *p1 = a + 4;
	int *p2 = &a[4]; // it is suggested to use this one
	void *praw = a;
	// p3 is different from p1
	// however, sometimes people mistakenly thinks p1 is the same as p3
	// that is why we recommend the statement to compute p2
	int *p3 = praw + 4;

	printf("%14d %14d %14d\n", *p1, *p2, *p3);
	printf("%14p %14p %14p\n", p1, p2, p3);
}
