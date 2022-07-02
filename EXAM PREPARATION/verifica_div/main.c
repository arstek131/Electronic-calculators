//Verificare se n è divisibile per m (dove m è un elemento di vettori di int )
//Se tutti gli elementi del vettore risultano essere divisibili, allora ritornare 1, altrimenti ritornare 0 

#include <stdio.h>

int myFun(int *vet, int div);

int main()
{
	int vet[] = { 2,4,6,8 };

	int div = 3;

	printf("La funzione ha ritornato %d", myFun(vet, div));

	return 0;
}