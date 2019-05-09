przyklad6.bin:
	nasm -f elf32 przyklad6.asm -o przyklad6.o
	gcc -c -m32 -ffreestanding kmain.c -nostdlib -o kmain.o
	ld -o przyklad6.bin -m elf_i386 -T linker.ld kmain.o przyklad6.o
clean:
	rm przyklad6.bin
	rm *.o
run:
	qemu-system-x86_64 przyklad6.bin
