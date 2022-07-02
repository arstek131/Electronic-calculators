.586
.model flat
.code

_reverse proc
;reverse di una stringa inline
push ebp
mov ebp,esp
push esi
push edi
push ebx

mov ecx,dword ptr[ebp+8]
;mi salvo in ebx la stringa

mov esi,0
call lunghezza
;in esi ho la lunghezza della prima stringa


dec esi
mov edi, 0

mov eax, esi
mov edi, 2

cdq
div edi

mov edx,eax



mov edi,0

ciclo:
cmp esi, edx
je fine_ciclo
mov al, byte ptr[ecx+esi]
;cmp al, 32
;je nulla
mov bl, byte ptr[ecx+edi]
;cmp bl, 32
;je nulla
mov byte ptr[ecx+esi], bl
mov byte ptr[ecx+edi], al
inc edi
dec esi
jmp ciclo

;nulla:
;inc edi
;dec esi
;jmp ciclo


fine_ciclo:
pop ebx
pop edi
pop esi
mov esp,ebp
pop ebp
ret

_reverse endp

lunghezza proc

boh:
cmp byte ptr[ecx+esi], 0
je fine
inc esi
jmp boh

fine:
ret

lunghezza endp

end