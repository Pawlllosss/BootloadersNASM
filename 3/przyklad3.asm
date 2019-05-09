org 0x7c00

boot:
	mov ax, 0x2401
	int 0x15 	; aktywacja linii A20

	mov al, 0x3
	int 0x10 	; wlaczenie trybu vga przerwaniem

	cli
	
	mov eax, cr0
	or  eax, 1	        ; ustawienie bitu PE na 1 (wejscie w protected mode)
	mov cr0, eax

	lgdt [GDT.Pointer] 	; zaladowanie gdt
	
	jmp GDT.Code:boot2	; przeskok do segmentu opisujacego kod

%include "gdt.asm"

bits 32				  ; przejscie do trybu protected
boot2:
; ustawienie deskryptorow danych
	mov ax, GDT.Data
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov ss, ax

	mov esi, string
	mov ebx, 0xb8000	  ; ustawienie na poczatek bufora VGA
	; mov eax, 0
.loop:
	lodsb
	or al, al
	; or eax, eax
	jz stop
	or eax, 0x0100		  ; 4 bity tlo, 4 bity kolor znaku, 8 bitow kod asci
	mov [ebx], eax	  ; przemieszcza bajt pod adresem eax do miejsca przechowanego pod adresem ebx
    add ebx, 2 ; przejscie do kolejnego obszaru, po ktorym mozna rysowac
	jmp .loop
stop:
	cli
	hlt
string: db "Hello!", 0


times 	510 - ($ - $$) db 0
dw 	0xaa55
