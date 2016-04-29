#!/bin/bash

make clean
make all
cat stage1 kernel > image
dd if=image of=floppy.vfd
qemu-system-i386 -monitor stdio -drive file=floppy.vfd,if=floppy,format=raw -m 32

exit 0
