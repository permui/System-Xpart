# X-Part: A Tiny OS Kernel with a Shell

## How to Build

The developer has environment:

* GNU toolchain for RISC-V. It can be downloaded [here](https://github.com/riscv-collab/riscv-gnu-toolchain)
* QEMU for RISC-V 64 (`qemu-system-riscv64`). The author's version is 6.1.0.
* Common build tools, including `make`

The following commands are available.

``` bash
make        # build the kernel
make run    # build and run the kernel
make debug  # build and start the kernel in debug mode
```

If everything works well, you will see a shell interface when you run `make run`.

## What does it include?

It supports

* The user mode / kernel mode distinction;
* Buddy System and SLUB memory management;
* Syscall `[read, write, getpid, clone, execve, wait, exit]`.