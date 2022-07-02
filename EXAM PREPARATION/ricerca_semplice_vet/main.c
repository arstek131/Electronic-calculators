#include <stdio.h>

int ricerca(int *vet, int el, int dim);

int main()
{
	int vet[] = { 5,4,22,7,9,1 };
	int el = 99;
	int dim = 6;

	int ris = ricerca(vet, el, dim);

	if (ris)
		printf("\nL'emento %d e stato trovato in posizione %d", el, ris);
	else
		printf("\nL'emento %d non e' stato trovato nel vettore!", el);


	getchar();
}