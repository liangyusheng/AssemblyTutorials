%define KERNEL_CALL 0x80
%define SYS_EXIT    1
%define SYS_WRITE   4
%define STDIN       0
%define STDOUT      1

segment .data
    message db "Hello, World!", 0xa
    message_len equ $-message

segment .text
    global _start

_start:
    mov edx, message_len
    mov ecx, message
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    int KERNEL_CALL

    mov eax, SYS_EXIT
    int KERNEL_CALL
