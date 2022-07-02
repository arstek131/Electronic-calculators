//Sono dati due vettori, il primo contenete numeri naturali
//nel secondo vettore mettere 1 o 0 se il numero è primo o meno

#include <stdio.h>

void checkPrime(int *firstArr, int *secondArr);

int main()
{
	int firstArr[] = { 2,3,5,11,44,21,31,18 };
	int secondArr[] = { 0, 0, 0, 0, 0, 0, 0, 0 };

	checkPrime(firstArr, secondArr);

	for (int i = 0; i < 8; i++)
	{
		printf("\t%d", secondArr[i]);
	}

	getchar();
}