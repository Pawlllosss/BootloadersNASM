; second stag
mov ah, 0x0e
mov al, '2'
int 0x10

;times 1024 - ($-$$) db 0
