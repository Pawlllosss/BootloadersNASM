echo replacing with program: $1

dd if=$1 of=disk.img seek=62 count=1 conv=notrunc
