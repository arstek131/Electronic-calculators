.586
.model flat
.code

_naiveSort proc

push ebp
mov ebp,esp
push esi
push edi
push ebx

mov edi,0
mov esi,0 ;sarà la mia i del primo ciclo
mov eax,dword ptr[ebp+8] ; in eax mi salvo il mio vettore

ciclo:
mov ecx,dword ptr[ebp+12] ;mi salvo la lunghezza del vettore
dec ecx ;contatore secondo ciclo
mov edi,esi
cmp esi,ecx
jge fine
ciclo1:
inc edi
cmp edi,dword ptr[ebp+12]
je incrementa
mov ebx,dword ptr[eax+esi*4] ;i
mov edx,dword ptr[eax+edi*4] ;j
cmp ebx,edx
jg scambia
jmp ciclo1

incrementa:
inc esi
jmp ciclo

scambia:
mov ecx,ebx
mov dword ptr[eax+esi*4],edx
mov dword ptr[eax+edi*4],ecx
jmp ciclo1

fine:
pop ebx
pop edi
pop esi
mov esp,ebp
pop ebp
ret

_naiveSort endp

end