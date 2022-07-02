#include <stdio.h>

int fattoriali(int *src, int *dst, int lunghezza);

int main()
{
	int src[3] = { 1,5,0 };
	int dst[3];
	int ret;
	ret = fattoriali(src, dst, 3);

	for (int i = 0; i < 3; i++)
	{
		printf("\t%d", dst[i]);
	}

	printf("\n\n\n%d", ret);

}