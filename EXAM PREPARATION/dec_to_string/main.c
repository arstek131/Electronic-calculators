#include <stdio.h>

void UnsignedToString(char *dst, unsigned u);

int main()
{
	unsigned u = 1344;
	char dst[5];

	UnsignedToString(dst, u);
	
	printf("In intero: %d\nIn stringa: %s\n", u, dst);

	getchar();
}