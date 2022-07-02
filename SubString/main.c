#include <stdio.h>

int main()
{
	//Do per scontato che la prima stringa (myWord) sia sempre più lunga della seconda (wordToF)
	char myWord[] = "ciao mi chiamo ars";
	char wordToF[] = "chiamo";

	char *first,*second;
	first = &myWord[0];
	second = &wordToF[0];

	__asm 
	{
		mov ecx, second
		mov edi, 0 //contatore per accedere al valore dell'array wordToF

		mov ebx, first
		mov esi, 0 //contatore per accedere al valore dell'array myWord

		mov al, byte ptr[ebx]//metti in al il primo char dell'array myWord
		condizione:
		cmp al, 0 //se sono arrivato a fine stringa
		je fine_ciclo //salta a fine ciclo

		//Comincio a ciclare la stringa più interna
		condizione_2:
		
		mov ah, byte ptr[ecx+edi]
		cmp ah, 0
		je fine_ciclo2
		cmp al,ah
		//inc edi
		je condizione_2


		fine_ciclo2:
		mov edi, 0 //resetto tutte le volte l'indice di scorrimento dell'array wordToF
		//altrimenti incrementa esi che è il contatore
		inc esi
		mov al, byte ptr[ebx + esi] //in al metti ebx+esi
		jmp condizione//torna alla condizione


		fine_ciclo:

	}


	return 0;
}