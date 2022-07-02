.586
.model flat
.code

_palindroma proc
;0 se non è palindroma, 1 se lo è
push ebp
mov ebp, esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp+8]
;metto in ebx il primo elemento del vettore

mov esi, 0
mov edi, 0
mov ecx, 0

ciclo:
call lunghezza


;in esi ho la lunghezza della stringa

cicloa:
mov al, byte ptr[ebx+esi-1]
mov ah, byte ptr[ebx+edi]
cmp ah, 0
je fine_ciclo
cmp al, ah
jne fine_falso
je incremento

incremento:
inc edi
dec esi
jmp cicloa



fine_falso:
mov eax, 0
jmp finito


fine_ciclo:
mov eax, 1
jmp finito

finito:

pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret

_palindroma endp

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