#include <stdio.h>

int reverse(char *s);

int main()
{
	char s[] = "federica scende ok";

	printf("%s", s);
	reverse(s);
	printf("\n%s", s);

	getchar();
}