#include <stdio.h>
#include <string.h>

int salvaparolaspiazzamento(char *s, char *d, unsigned char *parola1);

int main()
{
	char s[255] = "sopra la panca la capra campa";
	char d[255];
	unsigned char parola1[] = "capra";

	salvaparolaspiazzamento(s, d, parola1);
	printf("%s\n", s);
	printf("%s", d);

	printf("\n%d", strlen(s)); 
	printf("\n%d", strlen(parola1));
	printf("\n%d", strlen(d));

	getchar();
}