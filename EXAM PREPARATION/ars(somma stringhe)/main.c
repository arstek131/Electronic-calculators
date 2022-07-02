
#include <stdio.h>
int sommalungstringhe(char *s1, char *s2);


int main()
{
	char s1[255] = "simone e' il migliore";
	char s2[255] = "chissa' a fare cosa";


	printf("%d", sommalungstringhe(s1, s2));
	getchar();
}