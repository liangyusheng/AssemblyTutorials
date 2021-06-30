assume cs:code, ds:data, ss:stack

data segment
    db  128 dup(0)
data ends

stack segment stack
    db  128 dup (0)
stack ends


code segment
    start:  mov ax, stack
            mov ss, ax
            mov sp, 128

            call init_reg
            call set_screen

            mov ax, 4c00h
            int 21h

; ================================
set_screen:     mov bx, 1
                mov cx, 2000
                ; change bl's value to change screen color.
                mov dl, 00000101b

                mov es:[bx], dl
                add bx, 2
    refresh:
                mov es:[bx], dl
                add bx, 2
                loop refresh

                ret

; ================================
init_reg:       mov bx, 0b800h
                mov es, bx

                mov bx, data
                mov ds, bx

                ret
code ends
end start
