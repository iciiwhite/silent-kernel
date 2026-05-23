# © 2026 Icii Digital. This software is provided 'as is', without warranty of any kind, express or implied. In no event shall Icii Digital be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.

SHELL := /bin/bash
GO := go
NASM := nasm
LD := ld

all: silent-kernel.elf

boot/start.o: boot/start.s
	$(NASM) -f elf64 -o $@ $<

silent-kernel.elf: boot/start.o kernel/*.go runtime/*.go runtime/*.s go.mod
	$(GO) build -o $@ -ldflags="-T linker.ld -linkmode external -extldflags '-nostdlib'" .

clean:
	rm -f boot/start.o silent-kernel.elf