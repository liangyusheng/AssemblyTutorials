; 效果同 equ 指令。

%assign SYS_EXIT    1
%assign SYS_WRITE   4
%assign SYS_CALL    0x80
%assign STDIN       0
%assign STDOUT      1

segment .data
    message db "Hello, World!", 0xa
    %assign message_len $ - message

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
