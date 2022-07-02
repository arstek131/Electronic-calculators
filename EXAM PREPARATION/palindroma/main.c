//Esercizio che controlla se una stringa è palindroma
//la funzione ritorna 1 se lo è, altrimenti ritorna 0

#include <stdio.h>

int palindroma(char *prl);

int main()
{
	char prl[] = "itopinonavevanonipoti";
	printf("La funzione ha restituito %d", palindroma(prl));
}