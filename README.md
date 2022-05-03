# CompromyseOS
A simple operating system written in assembly

![image](https://user-images.githubusercontent.com/71056504/166417899-5ff1a782-52d8-418c-9975-e62d8a4b46ca.png)

# Running

### Requirements

* qemu-system-x86_64

### Starting

> Download a release from [here](https://github.com/compromyse/compromyseos/releases).

Then run 
```bash
qemu-system-x86_64 -serial stdio -d guest_errors -drive format=raw,file=final.bin
```
to start the VirtualMachine.

# Compiling and running

### Requirements

* Makefile
* nasm
* qemu-system-x86_64
* git

### Clone the repository

Clone the repository with
```bash
git clone https://github.com/compromyse/compromyseos
```

### Build the OS

Just run `make` in the repository directory.

### Running it

Run `make run` in the repository directory.
