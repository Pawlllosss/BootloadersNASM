org 0x7c00

; first stage

mov ah, 0x0e
mov al, '?'
int 0x10

mov ah, 0x02	; funkcja do wykonania(odczyt sektorow)
mov al, 1	; liczba sektorow do odczytania
mov ch, 0	; id cylindra
mov dh, 0	; id glowicy
mov cl, 63	; id sektora
mov bx, 0x1000	; adres danych do zaladowania
int    0x13

jmp 0x1000

times 510 - ($ - $$) db 0
dw 0xaa55
