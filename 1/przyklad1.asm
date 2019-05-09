org 0x7C00 ; adres pamieci, w ktorym ma zostac zaladowany program

JMP $ ; petla nieskonczona

TIMES 510 - ($ - $$) db 0 ; wypelnienie zerami do 510. bajtu

;sumy kontrolne
DB 0x55
DB 0xAA
