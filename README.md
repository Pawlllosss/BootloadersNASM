# BootloadersNASM
This repo contains examples of bootloaders written by me for the low-level programming lab classes. Every example is provided with makefile. 
Qemu is used to run them. Comments in code are written in polish.

## Description of directories

### 1

Minimalistic bootloader it only runs and hangs. To run type **make** and **make run**.

### 2

Prints *hello world*, with use of the interrupt *0x10* and *lodsb* operator. To run type **make** and **make run**.

### 3

Prints blue string *hello!* in the Protected Mode, with use of the VGA mode. Gloal Descriptor Table is placed in the another file. To run type **make** and **make run**.

### 4

First and second stage of the booting proccess. It prints *?!*. 
The code responsible for printing *!* is placed in the second sector. The interrupt *0x13* is used to load a second sector of a disc.
To run type **make** and **make run**.

### 5

This example shows an example of the bootloader booting a program placed on the 63th sector of a disk.
Script **build_image.sh** is responsible for creating the disk image, with bootloader and program **anotherCode.bin** on the 63th sector.
**make run** runs only the bootloader, **make run_image** runs the created image. Command **replace_program.sh ***program_name.bin*****
replaces the program on the 63th sector of the disk image with the program passed as an argument.

### 6

Example running in Protected Mode, which uses a code written in C to print *I am written in c* with use of the VGA buffer.
To run type **make** and **make run**.

### 7

Example running in Long Mode it uses 64 bit registers and prints blue background.
To run type **make** and **make run**.
