#!/bin/bash

make clean
make all
cat stage1 stage2 > image
dd if=image of=floppy.vfd
qemu-system-i386 -monitor stdio -drive file=floppy.vfd,if=floppy,format=raw -m 32

exit 0
