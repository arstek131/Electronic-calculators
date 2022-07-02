#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
Dato un array di char, indicare in output il numero di vocali presenti
*/

int main()
{
	char v[255] = "la mamma di tua mamma e un pokemon";
	char *ps;
	int vocali = 0;
	ps = &v[0];
	printf("%d\n", strlen(v));

	__asm
	{
		mov ebx, ps
		mov ecx, 0 //dove metto num vocali
		mov esi, 0 //contatore per accedere al valore array

		mov al, byte ptr[ebx] //metti in al il primo char dell'array
		condizione:
		cmp al, 0 //se sono arrivato a fine stringa
		je fine_ciclo //salta a fine ciclo

		cmp al, 0x61 //if (al=='a')
		je in_cremento 
		cmp al, 0x65 //if (al=='e')
		je in_cremento
		cmp al, 0x69 //if (al=='i')
		je in_cremento
		cmp al, 0x6F //if (al=='o')
		je in_cremento
		cmp al, 0x75 //if (al=='u')
		je in_cremento
		
		inc esi
		mov al, byte ptr[ebx + esi]
		jmp condizione
		
		in_cremento:
		inc ecx
		inc esi
		mov al, byte ptr[ebx + esi]

		jmp condizione

		fine_ciclo:

		mov vocali, ecx
	}

	printf("Il numero di vocali e' %d", vocali);
	
}