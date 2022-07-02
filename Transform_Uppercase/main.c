#include <stdio.h>

int main()
{
	char str[255] = "cacca";
	char *c;
	c = &str[0];

	__asm
	{
		mov ebx, c
		mov al, byte ptr[ebx]
		sub al, 32
		mov byte ptr[ebx], al

		mov ebx, c
		mov al, byte ptr [ebx+2]
		sub al, 32
		mov byte ptr[ebx+2], al
	}

	printf("%s", str);

	return 0;
}