//Esercizio dove una funzione prende 3 parametri, 2 vettori e un divisore
//E nelle stesse posizioni del secondo vettore mette 1 se l'elemento iesimo è divisibile
//altrimenti metto 0

#include <stdio.h>

void divFun(int *first, int *second, int div);

int main()
{
	int firstAr[] = { 2,4,5,9 };
	int secondAr[] = { 99, 99, 99, 99 };
	int div = 2;

	divFun(firstAr, secondAr, div);

	for (int i = 0; i < 4; i++)
	{
		printf("%d\n", secondAr[i]);
	}


	getchar();
}