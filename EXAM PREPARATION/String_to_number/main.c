#include <stdio.h>

int scrivi_num(char *s);

int main()
{
	char s[] = "-137";

	printf("\nIn stringa %s", s);
	printf("\nIn numero %d", scrivi_num(s));


	getchar();
}