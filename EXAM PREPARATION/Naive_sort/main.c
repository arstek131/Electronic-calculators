#include <stdio.h>

void naiveSort(int *vet, int dim);

int main()
{

	int vect[6] = { 5,4,2,11,39,6 };
	int dim = 6;

	printf("\nVettore NON ordianto: ");
	for (int i = 0; i < dim; i++)
	{
		printf("\t%d", vect[i]);
	}

	naiveSort(vect, dim);

	printf("\nVettore ordianto: ");

	for (int i = 0; i < dim; i++)
	{
		printf("\t%d", vect[i]);
	}

	/*for (i = 0; i < n - 1; i++)
	{
		for (j = i + 1; j < n; j++)
		{
			if (a[i] > a[j])
			{
				temp = a[i];
				a[i] = a[j];
				a[j] = temp;
			}
		}
	}*/


	getchar();
}