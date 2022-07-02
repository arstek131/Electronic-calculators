#include <stdio.h>

void SignedToString(char *dst, int i);

int main()
{
	int i = -220;
	char dst[255];

	printf("\nIn numero: %d", i);
	SignedToString(dst, i);
	printf("\nIn stringa: %s", dst);


	getchar();
}