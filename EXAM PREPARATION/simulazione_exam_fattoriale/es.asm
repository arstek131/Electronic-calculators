.586
.model flat
.code

_fattoriali proc

push ebp
mov ebp,esp
push edi
push esi
push ebx


mov ebx, dword ptr[ebp+8]
;metto il primo vettore (vettore degli elementi di cui fare il fattoriale)

mov ecx, dword ptr[ebp+12]
;metto il secondo vettore (vettore degli elementi che dovrà contenere il fattoriale)



mov esi, 0
mov edi, 2
mov ecx, dword ptr[ebp+16]

ciclo:
cmp esi, ecx
je fine_ciclo
mov eax, dword ptr[ebx+esi*4] ;metto in eax il primo elemento del vettore
cmp eax, 0
je metti_1
cmp edi, eax
jge metti_1
push ecx
mov ecx, eax
qui:
mul edi
inc edi
cmp edi, ecx
jne qui
mov ecx, dword ptr[ebp+12]
mov dword ptr[ecx+esi*4], eax
inc esi
pop ecx
jmp ciclo




metti_1:
push eax
mov eax,1
push ecx
mov ecx, dword ptr[ebp+12]
mov dword ptr[ecx+esi*4], eax
pop ecx
pop eax
inc esi
jmp ciclo






fine_ciclo:

mov eax, 0
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret


_fattoriali endp

end