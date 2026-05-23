; © 2026 Icii Digital. This software is provided 'as is', without warranty of any kind, express or implied. In no event shall Icii Digital be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.

%define MULTIBOOT2_MAGIC 0xe85250d6
%define MULTIBOOT2_ARCH  0
%define HEADER_LENGTH    (multiboot_header_end - multiboot_header)
%define CHECKSUM         -(MULTIBOOT2_MAGIC + MULTIBOOT2_ARCH + HEADER_LENGTH)

section .multiboot
align 8
multiboot_header:
    dd MULTIBOOT2_MAGIC
    dd MULTIBOOT2_ARCH
    dd HEADER_LENGTH
    dd CHECKSUM
    dw 0
    dw 0
    dd 8
multiboot_header_end:

section .text
extern _start_go
global _start
_start:
    cli
    mov rsp, stack_top
    mov rdi, _bss_start
    mov rcx, _bss_end
    sub rcx, rdi
    xor al, al
    rep stosb
    call _start_go
.halt:
    hlt
    jmp .halt

section .bss
align 4096
stack_bottom:
    resb 32768
stack_top: