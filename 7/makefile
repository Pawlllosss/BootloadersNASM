przyklad7.bin:
	nasm -fbin przyklad7.asm -o przyklad7.bin
clean:
	rm przyklad7.bin
run:
	qemu-system-x86_64 -hda przyklad7.bin
run_failed:
	qemu-system-i386 -hda przyklad7.bin

