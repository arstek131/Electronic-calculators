.586
.model flat
.code

_myFun proc

push ebp
mov ebp,esp
push esi
push edi
push ebx

mov ebx, dword ptr[ebp+8]
;in ebx metto il vettore

mov ecx, dword ptr[ebp+12]
;in eax metto il divisore


mov esi, 0
mov edi,0 


ciclo:
cmp esi, 4
je fine_ciclo
mov eax, dword ptr[ebx+esi*4]
call controlla_div

cmp edx, 0
je vero
jne false

false:
inc esi
jmp ciclo

vero:
inc edi
inc esi
jmp ciclo


fine_ciclo:
cmp edi, esi
je condizione_ok
jne condizione_neg

condizione_ok:
mov eax,1
jmp fine

condizione_neg:
mov eax, 0
jmp fine



fine:

pop ebx
pop edi
pop esi
mov esp,ebp
pop ebp
ret



_myFun endp

controlla_div proc
;in eax ho sempre l'iesimo elemento del vettore
;in ecx ho il divisore (quindi 2)

cdq
idiv ecx
ret




controlla_div endp

end