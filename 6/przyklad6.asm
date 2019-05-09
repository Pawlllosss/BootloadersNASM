section .boot
bits 16
global boot
boot:
	mov ax, 0x2401
	int 0x15

	;włączenie trybu vga
	mov ax, 0x3
	int 0x10


	mov ah, 0x2
	mov al, 6
	mov ch, 0
	mov dh, 0
	mov cl, 2
	mov bx, copy_target
	int 0x13
	cli

	mov eax, cr0
	or  eax, 1              ; ustawienie bitu PE na 1 (wejscie w protected mode)
	mov cr0, eax

lgdt [GDT.Pointer]      ; zaladowanie gdt

jmp GDT.Code:boot2      ; przeskok do segmentu opisujacego kod

%include "gdt.asm"
times 510 - ($-$$) db 0
dw 0xaa55

copy_target:
bits 32
boot2:
	mov esp,kernel_stack_top
	extern kmain
	call kmain
	cli
	hlt

section .bss
align 4
kernel_stack_bottom:
	resb 16384 ; 16 KB
kernel_stack_top:
