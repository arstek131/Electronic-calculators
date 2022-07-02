.586
.model flat
.code



_ricerca proc

push ebp
mov ebp,esp
push esi
push edi
push ebx

mov edx, dword ptr[ebp+8] ;mi sono salvato il vettore
mov ebx, dword ptr[ebp+12] ;mi sono salvato l'elemento da ricercare

mov esi, 0
mov edi, 0

ciclo:
cmp esi, dword ptr[ebp+16] ;controllo se sono arrivato alla fine del vettore
je ho_finito
mov ecx, dword ptr[edx+esi*4] ;sposto in ecx man mano gli elementi del vettore
cmp ebx, ecx
je trovato
inc esi
jmp ciclo



trovato:
mov edi, esi
jmp ho_finito




ho_finito:
mov eax, edi

pop ebx
pop edi
pop esi
mov esp,ebp
pop ebp
ret


_ricerca endp

end