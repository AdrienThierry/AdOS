# AdOS
Hobby development of a simple OS in x86 assembly and C.

To run the samples, you have to install **qemu**.
In each folder you can find a **launch.sh** script that does all the job of compiling, linking, creating a qemu floppy image and running the code on qemu.

## Samples

### Hello

Simple x86 assembly program that runs in real-mode and prints "Hello World" in several colors, using BIOS interrupts.

### Simple_bootloader

Simple bootloader (stage1) that runs on the MBR and loads a stage2 program in another memory region to get rid of the 512 Bytes boot sector limit.

### Protected_mode

Code to go into protected mode. Doesn't work yet.
