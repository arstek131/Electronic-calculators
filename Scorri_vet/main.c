#include <stdio.h>

/*
scorrere gli elementi di v1, verificare se sono >3, se questa condizione verificata 
nell'indice corrispondente di v2, metterci un 1
*/

int main()
{
	unsigned int v1[5] = { 1,2,3,4,5 };
	unsigned int v2[5] = { 0,0,0,0,0 };

	int i=0;
	int *pv1;
	int *pv2;

	pv1 = &v1[0];
	pv2 = &v2[0];

	__asm {
		mov ebx, pv1 //metti in ebx l'indirizzo di pv1
		mov ecx, pv2 //metti in ecx l'indirizzo di pv2

		mov esi,0 //metti in esi il valore 0

		condizione: //creo l'etichetta condizione
		cmp esi, 5 //confronto esi con 5 
		je fine_ciclo //if(esi == 5)--> JumpEqual salta a fine ciclo

		mov eax, dword ptr[ebx+esi*4] //metti in eax ciò che c'è in ebx(ovvero primo array pv1)+
									  //esi (primo giro vale 0)*4 (dimensione int)
		cmp eax, 3
		jbe non_fare_niente //if (eax <= 3) salta a "non_fare_niente"
		mov edx, 1 //metti in edx il valore 1 
		mov dword ptr [ecx+esi*4], edx //metti in ecx (ovvero secondo array pv2) +
									   //esi*4(dimensione int)
		non_fare_niente:
		inc esi
		jmp condizione

		fine_ciclo:

		
	}

	for (i = 0; i < 5; i++)
	{
		printf("%d", v2[i]);
	}
}