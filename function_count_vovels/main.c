//Dato un array di char creare una funzione che ritorni il numero di vocali
#include <stdio.h>

__declspec(naked) int countvovels(char *s)
{
	__asm {

		push ebp
		mov ebp, esp
		push ebx
		push esi
		push edi

		mov ebx, [ebp+8]
		mov eax, 0 //dove metto num vocali
		mov esi, 0 //contatore per accedere al valore array

		
		ciclo:
		cmp [ebx+esi], 0 //se sono arrivato a fine stringa
		je fine_ciclo //salta a fine ciclo

		cmp [ebx + esi], 0x61 //if (al=='a')
		je in_cremento 
		cmp [ebx + esi], 0x65 //if (al=='e')
		je in_cremento
		cmp [ebx + esi], 0x69 //if (al=='i')
		je in_cremento
		cmp [ebx + esi], 0x6F //if (al=='o')
		je in_cremento
		cmp [ebx + esi], 0x75 //if (al=='u')
		je in_cremento

		inc esi
		jmp ciclo

		in_cremento:
		inc esi
		add eax,1 
		jmp ciclo

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
	char v[255] = "la mamma di tua mamma e un pokemon";
	char *ps;
	int vocali = 0;
	ps = &v[0];
	printf("Il numero di vocali e' %d", countvovels(v));

	return 0;
}