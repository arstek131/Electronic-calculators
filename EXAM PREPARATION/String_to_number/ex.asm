.586
.model flat
.code

_scrivi_num proc

push ebp 
mov ebp,esp
push ebx
push esi
push edi


mov ebx,dword ptr[ebp+8]
mov esi,0
mov edi,0
call strlen

cmp byte ptr[ebx+esi],'-'
je decremento_edi
call conversione
jmp fine

decremento_edi:
dec edi
inc esi
call conversione
jmp nega

nega:
neg ecx
jmp fine

fine:
mov eax,ecx
pop edi
pop esi
pop ebx
mov esp,ebp
pop ebp
ret


_scrivi_num endp

conversione proc
;esi indice di partenza
;edi lunghezza stringa
;ecx variabile somma

mov ecx,0
push esi
mov eax,1
push ebx
mov ebx,10
mov esi,0
dec edi
potenza:
cmp esi,edi
je pop_esi
mul ebx
inc esi
jmp potenza

pop_esi:
pop ebx
pop esi
inc edi
jmp conversione1 

conversione1:
cmp byte ptr[ebx+esi],0
je fine
mov edi,eax
mov eax, 0
mov al,byte ptr[ebx+esi]
sub al,48
mul edi
add ecx,eax
inc esi
jmp dividi_10

dividi_10:
mov eax,edi
cdq
push ebx
mov ebx,10
div ebx
pop ebx
jmp conversione1

fine:
ret

conversione endp

strlen proc

;edi indice

ciclo:
cmp byte ptr[ebx+edi], 0
je fine
inc edi
jmp ciclo

fine:
ret

strlen endp

end