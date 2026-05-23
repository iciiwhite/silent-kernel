<!-- © 2026 Icii Digital. This software is provided 'as is', without warranty of any kind, express or implied. In no event shall Icii Digital be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software. -->

# The Silent Kernel

A unikernel for one‑shot secure enclaves.  
Boots in milliseconds, executes a single Go binary with zero standard library surface, then irreversibly zeroes its own memory and powers off.

## Architecture

- Hand‑written multiboot2 loader (NASM) transitions to 64‑bit long mode.
- Custom Plan 9 assembly entry sets up TLS and invokes the enclave.
- Go enclave never touches the standard library, signals, or the OS.
- Deterministic memory destruction – all physical pages are wiped before ACPI power‑off.
- No garbage collector – manual memory management only.

## Build

```bash
make
```

Requires:
- Go 1.22+
- NASM
- GNU ld
- Multiboot2‑aware bootloader (GRUB2 recommended)

## Boot

Add to GRUB configuration:

```bash
menuentry "Silent Kernel" {
    multiboot2 /boot/silent-kernel.elf
}
```

Or run directly with QEMU:

```bash
qemu-system-x86_64 -kernel silent-kernel.elf -serial stdio
```

## Enclave

The enclave logic resides in ```kernel/entry.go```. Modify the ```enclave()``` function to embed any secret computation. On completion the kernel wipes itself.

## Security

- No I/O beyond the serial console.
- No persistent storage.
- Full memory zeroisation on exit.
- Self‑contained binary, no dependencies.