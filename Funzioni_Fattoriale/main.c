#include <stdio.h>

__declspec(naked) unsigned int fattoriale(unsigned int a)
{
	__asm
	{
		push ebp
		mov ebp, esp
		push ebx
		push esi
		push edi

		mov ebx, dword ptr[ebp + 8]
		mov ecx, 2
		cmp ebx, 0
		jne ciclo
		je zero

		ciclo :
		cmp ecx, ebx
			je fine_ciclo
			mul ecx
			inc ecx
			jmp ciclo

			zero :
		mov eax, 1
			jmp fine_ciclo


			fine_ciclo :
		pop edi
			pop esi
			pop ebx
			mov esp, ebp
			pop ebp
			ret


	}
}

int main()
{
	unsigned int a = 5;

	printf("Il fattoriale di 5 e' %u", fattoriale(a));
}