org 0x7c00
bits 16

call check_cpuid
call check_lm

cli				; wazne!

enable_a20:
	mov ax, 0x2401
	int 0x15

clearing_tables:
	mov edi, 0x1000		; ustawienie na poczatek tabeli stronnicowania
	mov cr3, edi		; cr3 przechowuje poczatek tabeli stronnicowania
	xor eax, eax		; wyzerowanie rejestru eax
	mov ecx, 4096		; licznik petli (liczba bajtow w tabeli)
	rep stosd		; wyzerowanie tabeli stronicowania

	mov edi, 0x1000		; przywrocenie oryginalnej wartosci


;ustawienie wskaznikow na kolejne tablice stronnicowania
setting_tables:
	mov dword [edi], 0x2003 ; wskazanie na PDPT
	mov edi, 0x2000		
	mov dword [edi], 0x3003	; wskazanie na PDT
	mov edi, 0x3000
	mov dword [edi], 0x4003	; wskazanie na PT
	mov edi, 0x4000

;ustawienie Identity Table (mapowanie pierwszych 2MB)
identity_table:
	mov dword ebx, 3
	mov ecx, 512		; ustawienie licznika petli (512 wpisow w tabeli)

set_entry:
	mov dword [edi], ebx ; dword czyli 4 bajty
	add ebx, 0x1000 ; mapowany adres
	add edi, 8	; przejscie do kolejnego wpisu w tabeli stronnicowania
	loop set_entry

PAE_setting:
	mov eax, cr4
	or  eax, 1 << 5
	mov cr4, eax

EFER_setting:
	mov ecx, 0xc0000080
	rdmsr
	or  eax, 1 << 8
	wrmsr

enter_protected:
	mov eax, cr0
	or eax, 1 << 31 ; wlaczenie stronicowania
	or eax, 1 << 0  ; ustawienie Protected Mode
	mov cr0, eax


lgdt [GDT.Pointer]
jmp GDT.Code:long_mode

%include "gdt.asm"
%include "check_long.asm"

bits 64
long_mode:
	VID_MEM equ 0xb8000
	mov edi, VID_MEM
	mov rax, 0x3f203f203f203f20
	mov ecx, 500
	rep stosq

	hlt


times 510 - ($ - $$) db 0
dw 0xaa55
