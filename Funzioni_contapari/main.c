#include <stdio.h>

//Dati due vettori di interi (a 32 bit), la funzione contapari deve contare quanti numeri pari ci sono
//nel vettore b andare a mettere nella posizione corrispondete un 1 se c'è un pari



__declspec(naked) int contapari(int *a, int *b, int lunghezza)
{
	__asm {

		push ebp
		mov ebp, esp
		push ebx
		push esi
		push edi

		mov ebx, dword ptr[ebp+8]
		//mov ecx, dword ptr[ebp+12]
		mov esi, 0
		mov edi, 0

		ciclo:
		mov ecx, 2
		cmp esi, dword ptr[ebp+16]
		je fine_ciclo

		mov eax, dword ptr[ebx+esi*4]
			cdq
			push ebx
			mov ebx,2 
			idiv ebx
		pop ebx
		cmp edx, 0
		je pari
		inc esi
		jmp ciclo

		
		pari:
		inc edi
		push ebx
		mov ebx, dword ptr[ebp+12]
		mov dword ptr [ebx+esi*4], 1
		pop ebx
		inc esi
		jmp ciclo



		fine_ciclo:
		mov eax, edi
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
	int a[5] = { 1,2,3,4,5 };
	int b[5] = { 0,0,0,0,0 };
	int i = 0;

	printf("Il numero di elementi pari e' %d\n", contapari(a, b, 5));

	for (i = 0; i < 5; i++)
	{
		printf("%d\t", b[i]);
	}

	return 0;
}