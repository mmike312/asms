bits 32

global start

extern exit

import exit msvcrt.dll

segment data use 32 class=data

    a db 7fh
    b dw 7abch
    c dd 45h
    d dq 7777777777777777h

segment code use 32 class=code
;c - a - (b + a) + c

start:

    mov eax, [c]
    
    mov edx, 0
    mov dl, [a]
    
    mov ecx, 0
    mov cx, [b]
    add cx, dx
    
    sub eax, edx
    sub eax, ecx
    
    add eax, [c]
   
push dword 0
call [exit]
    