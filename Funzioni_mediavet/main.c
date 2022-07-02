#include <stdio.h>

__declspec(naked)int media(int *a, int lunghezza)
{
	__asm
	{
		push ebp
		mov ebp, esp
		push ebx
		push esi
		push edi

		mov ebx, dword ptr[ebp + 8]
		mov esi, 0
		mov eax,0


		ciclo:
		cmp esi, dword ptr[ebp + 12]
		je fine_ciclo
		add eax, dword ptr[ebx + esi * 4]
		inc esi
		jmp ciclo


		fine_ciclo:
		mov ebx, esi
		mov edx, 0
		div ebx
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
	int vet[5] = { 1,2,3,5,5 };
	int lunghezza = 5;

	printf("La media e' %d", media(vet,lunghezza));
	return 0;
}