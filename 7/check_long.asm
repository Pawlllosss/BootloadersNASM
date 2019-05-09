check_cpuid:
	pushfd
	pop eax

	mov ecx, eax

	xor eax, 1 << 21
	
	push eax
	popfd

	pushfd
	pop eax

	; przywrocenie oryginalnego EFLAGS
	push ecx
	popfd

	xor eax, ecx
	jz err
	ret

check_lm:
	; sprawdzenie czy istnieje funkcja cpuid
	mov eax, 0x80000000
	cpuid
	cmp eax, 0x80000001
	jb err

	; sprawdczenie czy LM obslugiwany
	mov eax, 0x80000001
	cpuid
	test edx, 1 << 29 ; jesli 30. bit ustawiony to LM
	jz err
	ret

err:
	mov ah, 0x0e
	mov al, '!'
	int 0x10
	hlt
