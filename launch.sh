#!/bin/bash

make clean
make
qemu-system-i386 -drive file=floppy.vfd,if=floppy,format=raw -m 32

exit 0
