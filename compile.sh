echo "NASM..."
nasm -f bin src/boot/boot.asm -o bin/temp/boot.bin
echo "GCC..."
gcc -fomit-frame-pointer -std=c99 -Wall -O -nostdlib -nostdinc -c -o bin/temp/kernel.o src/kernel.c
echo "LD..."
ld  -Bstatic --oformat binary -T ld/linker.ld -o bin/temp/kernel.bin bin/temp/kernel.o
echo "DD..."
dd if=/dev/zero of=bin/MonoOS.img bs=1024 count=32000
dd if=bin/temp/boot.bin of=bin/MonoOS.img bs=1 count=512 conv=notrunc
dd if=bin/temp/kernel.bin of=bin/MonoOS.img bs=1024 count=12 conv=notrunc seek=512
echo "KVM..."
kvm -hda bin/MonoOS.img -m 256m
echo "DONE..."
