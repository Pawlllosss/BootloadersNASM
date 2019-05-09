org 0x7c00

boot:
	mov si, string		; rejestr przechowuje adres poczatku napisu
	mov ah, 0x0e		; dla przerwania 0x10 - Write Character in TTY Mode
.loop:
	lodsb			; laduje bajt z adresu si do rejestru al, po czym rejestr si jest inkrementowany
	or al, al		; sprawdzenie czy aktualny znak 0 - koniec napisu
	jz finish	
	int 0x10		; przerwanie 0x10 Video Services
	jmp .loop
finish:
	cli
	hlt
string:	db "Hello people!", 0

times 510 - ($ - $$) db 0
dw 0xaa55		
