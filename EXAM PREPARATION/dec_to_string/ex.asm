.586
.model flat
.code


_UnsignedToString proc

push ebp
mov ebp,esp
push esi
push edi
push ebx

mov ecx,dword ptr[ebp+8]
;mi salvo in ebx la stringa

mov eax,dword ptr[ebp+12]
;mi salvo il numero unsigned da convertire

mov ebx,eax

mov esi,0
call lunghezza
inc esi
mov byte ptr[ecx+esi], 0
;ho la stringa di lunghezza esatta e nell'ultima posizione gli ho messo lo zero terminato

mov eax,ebx
dec esi
call spostamento




pop ebx
pop edi
pop esi
mov esp,ebp
pop ebp
ret

_UnsignedToString endp

lunghezza proc

mov edi,10

ciclo:
mov edx,0
div edi
cmp eax,0
je fine
inc esi
jmp ciclo

fine:
ret

lunghezza endp

spostamento proc

mov edi,10

ciclo:
mov edx,0
div edi
cmp eax,0
je ho_finito
add edx, 48
mov byte ptr[ecx+esi], dl
dec esi
jmp ciclo

ho_finito:
add edx, 48
mov byte ptr[ecx+esi], dl
ret


spostamento endp

end