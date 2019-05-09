all: przyklad5.bin anotherCode.bin anotherCode2.bin

przyklad5.bin:
	nasm -fbin przyklad5.asm -o przyklad5.bin

anotherCode.bin:
	nasm anotherCode.asm -o anotherCode.bin

anotherCode2.bin:
	nasm anotherCode2.asm -o anotherCode2.bin

clean:
	rm przyklad5.bin
	rm anotherCode.bin
	rm anotherCode2.bin

run:
	qemu-system-x86_64 -hda przyklad5.bin

run_image:
	qemu-system-x86_64 -hda disk.img
