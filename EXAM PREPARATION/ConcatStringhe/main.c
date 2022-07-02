//Date due stringhe, concatera la seconda con la prima

#include <stdio.h>

 void concatena(char *first, char *second);

int main()
{
	char first[255] = "Ciao mi chiamo Yuri";
	char second[255] = " Sgrignoli";

	concatena(first, second);

	printf("La stringa concatenata e' %s", first);

	getchar();
}