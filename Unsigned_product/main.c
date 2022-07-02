#include <stdio.h>

int main()
{
	unsigned a = 5;
	unsigned b = 5;
	unsigned c = 0;

	__asm
	{
		mov eax, a
		mov ebx, b
		mul ebx
		mov c, eax

	}

	printf("Il prodotto senza segno e': %u", c);

	return 0;
}