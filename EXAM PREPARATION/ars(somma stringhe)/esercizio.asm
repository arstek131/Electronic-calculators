.586
.model flat
.code

_sommalungstringhe proc
;passate 2 stringhe alla funzione ritornare in eax la loro lunghezza totale
push ebp
mov ebp,esp
push edi
push esi
push ebx

mov esi,0 
mov edi,0
mov ebx,dword ptr[ebp+8]
mov ecx,dword ptr [ebp+12]

ciclo:
cmp byte ptr[ebx+edi],0
je azzera_edi
inc esi
inc edi
jmp ciclo

azzera_edi:
mov edi,0
jmp conta_seconda

conta_seconda:
cmp byte ptr[ecx+edi],0
je fine_ciclo
inc esi
inc edi
jmp conta_seconda

fine_ciclo:
mov eax,esi
pop ebx
pop esi
pop edi
mov esp,ebp
pop ebp
ret



_sommalungstringhe endp

end