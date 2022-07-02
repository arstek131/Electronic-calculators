#include <stdio.h>

/*__declspec(naked) int somma(int a, int b)
{
	__asm
	{
		push ebp		//salvo il valore che il registro ebp aveva prima della chiamata a questa funzione, così come cita lo standard c per le chiamate a funzione
		mov ebp, esp	//inserisco nello stack un placeholder per tenere separato lo stack della funzione chiamata dalla funzione chiamante

		push ebx
		push esi  registri non necessari
		push edi

		 ora ho il corpo della funzione
		/*
		nota: ho lo stack del programma così formato in questo momento:
		* (chiamante)ebp		<----------- esp=ebp(di f)
		* eip (indirizzo di ritorno alla funzione chiamante, i.e., indirizzo dell'isturzione successiva da eseguire dopo la fine della funzione
		* a
		* b
		* (chiamante del chiamante) ebp
		* ... potenzialmente altra roba, ma non interessante ai fini della scrittura di questa funzione
		*/
		/*inserisco il valore di a in eax e gli sommo il valore di b, rispettivamente contenuti nella seconda e nella terza cella dello stack

		sub esp, 8
		mov eax, dword ptr[ebp+8]//come da convenzione, l'indirizzo di memoria del primo operando lo trovo due posizioni più in basso dello stack
		add eax, dword ptr[ebp + 12]


		pop edi
		pop esi
		pop ebx
		ora ripristino lo stack così come me lo ha fatto trovare il chiamante.

		mov esp, ebp//porto il valore dell'inizio dello stack per la mia funzione in esp, cosicché ho lo stack nella stessa configurazione descritta sopra, nonostante eventuali operazioni di push.
		pop ebp//poiché ebp è uno dei registri che la mia funzione non può aver modificato, lo riporto al valore originale.
		re//salto alla funzione chiamante

	}
}*/

//overwrite array with index value
/*__declspec(naked) int vettorenum(int * v, int lunghezza) {
	__asm {

		push EBP
		mov EBP, ESP
		push ebx
		push esi
		push edi

		mov EAX, 0
		mov ESI, 0
		mov Ebx, dword ptr[EBP + 8]
		ciclo:
		cmp ESI, dword ptr[EBP + 12]
			je fine
			mov edi, esi
			add edi, 1
			mov dword ptr[EbX + 4 * ESI], edi
			inc ESI
			jmp ciclo
			fine :

		pop edi
			pop esi
			pop Ebx
			mov ESP, EBP
			pop EBP
			ret
	}
}*/

__declspec(naked) int sommavettore(int *v, int lunghezza)
{
	__asm
	{
		push EBP
		mov EBP, ESP
		push ebx
		push esi
		push edi

		mov EAX, 0
		mov ESI, 0
		mov Ebx, dword ptr[EBP + 8]
		ciclo:
		cmp ESI, dword ptr[EBP + 12]
			je fine
			add EAX, dword ptr[EbX + 4 * ESI]
			inc ESI
			jmp ciclo
			fine :

		pop edi
			pop esi
			pop Ebx
			mov ESP, EBP
			pop EBP
			ret
	}
}

int main()
{
	int v[5] = { 1,2,3,4,5 };

	//printf("La somma = %d\n", somma(15, 7));
	printf("La sommavettore = %d", sommavettore(v,5));


	getchar();
}