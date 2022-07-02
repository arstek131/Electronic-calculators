.586
.model flat
.code

_salvaparolaspiazzamento proc
;passati 3 array di char
;1--> stringa completa
;2--> stringa vuota
;3--> parola da cercare in 1
;mettere nella stringa 2 la stringa 3 nella stessa posizione seguita dietro e davanti da spazi
push ebp
mov ebp,esp
push ebx
push esi
push edi

mov ebx,dword ptr[ebp+8]
mov esi,0
call strlen
push ebx
push esi
mov ebx,dword ptr[ebp+16]
mov esi,0
call strlen
mov eax,esi
pop esi
pop ebx
mov edx,dword ptr[ebp+12]
mov ecx,dword ptr[ebp+16];parola

mov byte ptr[edx+esi],0
mov edi,0
call spazi
mov esi,0


ciclo_per_confronto:
mov edi,0
cmp byte ptr[ebx+esi],0
je fine 
push eax
mov al,byte ptr[ecx+edi]
cmp byte ptr[ebx+esi],al
pop eax
je occorrenza
inc esi
jmp ciclo_per_confronto

occorrenza:
cmp edi,eax
je aggiusta_indici
push eax
mov al,byte ptr[ecx+edi]
cmp byte ptr[ebx+esi],al
pop eax
jne ciclo_per_confronto
inc edi
inc esi
jmp occorrenza

aggiusta_indici:
mov edi,0
sub esi,eax
jmp scrivi

scrivi:
cmp edi,eax
je fine
push eax
mov al,byte ptr[ecx+edi]
mov byte ptr[edx+esi],al
pop eax
inc esi
inc edi
jmp scrivi


fine:
mov eax,0
pop esi
pop edi
pop ebx
mov esp,ebp
pop ebp 
ret

_salvaparolaspiazzamento endp

spazi proc
;esi lunghezza
;edi indice stringa
;edx stringa che scrivo

ciclo:
cmp esi,edi
je fine
mov byte ptr[edx+edi], 32
inc edi
jmp ciclo

fine:
ret

spazi endp

strlen proc
;esi lunghezza
;bl la stringa da scorrere

ciclo:
mov al,byte ptr[ebx+esi]
cmp al,0
je fine
inc esi
jmp ciclo

fine:
ret


strlen endp

end