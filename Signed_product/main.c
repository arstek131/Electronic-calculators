#include <stdio.h>

//calcolare il prodotto tra due numeri signed

int main()
{
	int a = -5;
	int b = 2;
	int c = 0;

	__asm
	{
		mov eax, a
		imul eax, b
		mov c, eax

		
	}

	printf("%d", c);

	return 0;
}