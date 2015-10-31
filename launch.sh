#!/bin/bash

make clean
make
dd if=hello of=floppy.vfd
qemu-system-i386 -monitor stdio -drive file=floppy.vfd,if=floppy,format=raw -m 32

exit 0
