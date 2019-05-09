#dd if=/dev/zero of=disk.img bs=1024 count=14400
echo 'dd if=przyklad5.bin of=disk.img seek=0 count=1 conv=notrunc'
dd if=przyklad5.bin of=disk.img seek=0 count=1 conv=notrunc
echo 'dd if=anotherCode.bin of=disk.img seek=62 count=1 conv=notrunc'
dd if=anotherCode.bin of=disk.img seek=62 count=1 conv=notrunc
