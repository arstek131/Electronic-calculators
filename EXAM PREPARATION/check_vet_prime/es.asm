.586
.model flat
.code

_checkPrime proc
;Sono dati due vettori, il primo contenete numeri naturali
;nel secondo vettore mettere 1 o 0 se il numero è primo o meno
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

ciclo:
mov edi, 2
cmp esi, 8
je fine_ciclo
mov eax, dword ptr[ebx+esi*4]

ciclo_interno:
cmp edi, eax
push eax
je modifica_vet
cdq
idiv edi
cmp edx, 0
je next
pop eax
inc edi
jmp ciclo_interno

modifica_vet:
mov edx, 1
mov dword ptr[ecx+esi*4], edx
inc esi
jmp ciclo

next:
inc esi
jmp ciclo




fine_ciclo:

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret

_checkPrime endp

end