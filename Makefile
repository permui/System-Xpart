export
CROSS_=riscv64-unknown-elf-
GCC=${CROSS_}gcc
LD=${CROSS_}ld
OBJCOPY=${CROSS_}objcopy
OBJDUMP=${CROSS_}objdump

ISA=rv64imafd
ABI=lp64

INCLUDE = -I $(shell pwd)/include -I $(shell pwd)/arch/riscv/include
CF = -march=$(ISA) -mabi=$(ABI) -mcmodel=medany -fno-builtin -ffunction-sections -fdata-sections -nostartfiles -nostdlib -nostdinc -static -lgcc -Wl,--nmagic -Wl,--gc-sections 
OWENCF = -D__xlen=64 -g
LABCF = -DSJF
CFLAG = ${CF} ${INCLUDE} ${OWENCF} ${LABCF}

.PHONY:all run debug clean
all: clean
	${MAKE} -C lib all
	${MAKE} -C init all
	${MAKE} -C user all
	${MAKE} -C arch/riscv all
	riscv64-unknown-elf-objdump -D vmlinux > d.s
	@echo -e '\n'Build Finished OK

run: all
	@echo Launch the qemu ......
	# @qemu-system-riscv64 -nographic -machine virt -kernel vmlinux -bios default -initrd user/build/demo.bin
	@qemu-system-riscv64 -nographic -machine virt -kernel vmlinux -initrd user/build/simple_fs.cpio

debug: all
	@echo Launch the qemu for debug ......
	# @qemu-system-riscv64 -nographic -machine virt -kernel vmlinux -bios default -initrd user/build/demo.bin -S -s
	@qemu-system-riscv64 -nographic -machine virt -kernel vmlinux -initrd user/build/simple_fs.cpio -S -s

clean:
	${MAKE} -C lib clean
	${MAKE} -C init clean
	${MAKE} -C arch/riscv clean
	${MAKE} -C user clean
	$(shell test -f vmlinux && rm vmlinux)
	$(shell test -f System.map && rm System.map)
	@echo -e '\n'Clean Finished
