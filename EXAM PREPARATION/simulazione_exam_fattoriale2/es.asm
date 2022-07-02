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

mov edx, dword ptr[ebp+16]
;metto la lunghezza dei vettori

mov esi, 0

ciclo:
cmp esi, edx
je fine_ciclo
mov eax, dword ptr[ebx+esi*4]
cmp eax, 0
je metti_1
cmp eax, 1
je metti_1
call factorial
inc esi
jmp ciclo


metti_1:
push eax
mov eax, 1
mov dword ptr[ecx+esi*4], eax
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

factorial proc

mov edi, 2
push edx
push eax
push ecx
mov ecx,eax

ciclo_mio:
cmp edi, ecx
je ho_finito
mul edi
inc edi
jmp ciclo_mio


ho_finito:
pop ecx
mov dword ptr[ecx+esi*4], eax
pop eax
pop edx
ret

factorial endp

end