GDT:
        .Null: equ $ - GDT
        dq 0x0          ; null descriptor - pierwsze 8 bajtow
	.Code: equ $ - GDT
        dw 0xffff       ; ustawienie limitu segmentu - 2 bajty
        dw 0            ; baza (bity 0-15)
        db 0            ; dalsza czesc bazy (bity 16-23)
        db 0x9a         ; access byte
        db 11001111b    ; 4 gorne bity - flagi, 4 dolne - limit
        db 0            ; ostatnia czesc bazy (bity 24-31)
	.Data: equ $ - GDT
        dw 0xffff
        dw 0
        db 0
        db 0x92
        db 11001111b
        db 0

	.Pointer:
        dw $ - GDT - 1 ; rozmiar GDT
        dd GDT	       ; adres poczatku GDT
