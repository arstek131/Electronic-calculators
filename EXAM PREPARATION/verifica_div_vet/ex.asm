.586
.model flat
.code

_divFun proc
;Esercizio dove una funzione prende 3 parametri, 2 vettori e un divisore
;E nelle stesse posizioni del secondo vettore mette 1 se l'elemento iesimo è divisibile
;altrimenti metto 0
push ebp
mov ebp, esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp+8]
;metto il primo vettore (vettore degli elementi da controllare)

mov ecx, dword ptr[ebp+12]
;metto il secondo vettore (vettore degli elementi che dovrà avere 0 o 1)




mov esi, 0
mov edi, 0

ciclo:
push ecx
mov ecx, dword ptr[ebp+16]
cmp esi, 4
je fine_ciclo
mov eax, dword ptr[ebx+esi*4]
cdq
idiv ecx
pop ecx
cmp edx, 0
je modifica_vet
push ebx
mov ebx, 0
mov dword ptr[ecx+esi*4], ebx
pop ebx
inc esi
jmp ciclo


modifica_vet:
push ebx
mov ebx, 1
mov dword ptr[ecx+esi*4], ebx
pop ebx
inc esi
jmp ciclo

fine_ciclo:

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret

_divFun endp

end