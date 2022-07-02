.586
.model flat
.code


square proc
push eax
mov eax,edx
imul eax
mov edx,eax
pop eax
ret
square endp


_happyNumber proc

push ebp
mov ebp,esp
push esi
push edi
push ebx

mov esi,0
mov edi,0

mov ebx,dword ptr[ebp+8]
cmp ebx,0
je triste
mov ecx,0			;sum
mov edx,0			;resto

ciclo1:
cmp ecx,1
jne controllo_4
je controlla_sum

controllo_4:
cmp ecx,4
jne azzera_sum
je controlla_sum

azzera_sum:
mov ecx,0
jmp ciclo2

ciclo2:
cmp ebx,0
jle assegna
mov eax,ebx
mov esi,10
cdq
idiv esi
mov ebx,eax
;mov edx,ebx
call square
add ecx,edx
jmp ciclo2

assegna:
mov ebx,ecx
jmp ciclo1

triste:
mov eax,0
jmp fine

controlla_sum:
cmp ecx,4
jne happy
mov eax,0
jmp fine

happy:
cmp ecx,0
je sad
mov eax,1
jmp fine

sad:
mov eax,0
jmp fine
fine:

pop ebx
pop edi
pop esi
mov esp,ebp
pop ebp
ret
_happyNumber endp
end