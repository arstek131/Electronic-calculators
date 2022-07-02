.586
.model flat
.code

_concatena proc
;Date due stringhe, concatera la seconda con la prima
push ebp
mov ebp,esp
push esi
push edi
push ebx

mov ebx,dword ptr[ebp+8]
mov ecx,dword ptr [ebp+12]

mov esi,0
mov edi,0


call lunghezza
;in esi ho la lunghezza della prima stringa

ciclo:
cmp byte ptr[ecx+edi],0
je ho_finito
mov ah, byte ptr[ecx+edi]
mov edx, edi
add edx, esi
mov byte ptr[ebx+edx], ah
inc edi
jmp ciclo


ho_finito:

pop ebx
pop edi
pop esi
mov esp,ebp
pop ebp
ret

_concatena endp

lunghezza proc

boh:
cmp byte ptr[ebx+esi], 0
je fine
inc esi
jmp boh

fine:
ret

lunghezza endp

end