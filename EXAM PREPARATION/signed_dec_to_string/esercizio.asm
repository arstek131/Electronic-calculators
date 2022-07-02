.586
.model flat
.code

_SignedToString proc

push ebp
mov ebp,esp
push edi
push esi
push ebx

mov ecx,dword ptr[ebp+8]
;mi salvo in ebx la stringa

mov eax,dword ptr[ebp+12]
;mi salvo il numero unsigned da convertire

mov ebx,eax

mov esi,0
call lunghezza
inc esi

cmp ebx,0
jl aggiungi_ancora

mov byte ptr[ecx+esi], 0
;ho la stringa di lunghezza esatta e nell'ultima posizione gli ho messo lo zero terminato
jmp quasi_finish


aggiungi_ancora:
push edi
mov edx, 45
mov edi, 0
mov byte ptr[ecx+edi], dl
inc esi
pop edi
mov byte ptr[ecx+esi], 0
;ho la stringa di lunghezza esatta e nell'ultima posizione gli ho messo lo zero terminato
mov eax,ebx
mov edx, -1
xor eax, edx 
sub eax, edx 
dec esi
call spostamento
jmp finalmente_finito

quasi_finish:
mov eax,ebx
dec esi
call spostamento

finalmente_finito:

pop edi
pop esi
mov esp, ebp
pop ebp
ret

_SignedToString endp

lunghezza proc

mov edi,10

ciclo:
mov edx,0
cdq
idiv edi
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
cdq
idiv edi
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