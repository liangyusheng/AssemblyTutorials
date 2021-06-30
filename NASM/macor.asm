; like as define directive.

SYS_EXIT    equ 1
SYS_WRITE   equ 4
SYS_CALL    equ 0x80
STDIN       equ 0
STDOUT      equ 1

segment .data
    message db "Hello, World!", 0xa
    message_len equ $ - message

segment .text
    global _start

start_:
    mov edx, message_len
    mov ecx, message
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    ; system call.
    int SYS_CALL

    mov eax, SYS_EXIT
    int SYS_CALL
