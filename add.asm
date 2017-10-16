; nasm -f elf32 -g -F dwarf add.asm
; ld -m elf_i386 -o add add.o

SECTION .text
GLOBAL _start:
_start:
    mov eax, 2
    mov ecx, 3
    push eax
    push ecx
    call add
    add esp, 8
    mov ebx, 0
    mov eax, 1
    int 080h
    
_add:
    push ebp
    mov ebp, esp
    
    movsx eax, word [ebp + 8h]
    movsx ecx, word [ebp + 0Ch]
    add eax, ecx
    
    mov esp, ebp
    pop ebp
    retn
