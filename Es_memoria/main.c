#include <stdio.h>

int main()
{

int a = 0;
int b[5] = { 1,2,3,4,5 };
int *c;

c = &b[0];

__asm
{
	mov ebx,c //in ebx c'� l'indirizzo di memoria del vettore (b)
	mov ecx, dword ptr [ebx+12] //metti in ecx ci� che c'� in ebx+12byte (ovvero l'elemento 4 siccome sono int)
	add ecx, dword ptr [ebx]//aggiungi in ecx ci� che c'� in ebx

	mov a, ecx //ecx ci sar� la somma


}


printf(" La somma del primo e quarto elemento del vettore e' %d", a);
return 0;
}