bits 32

global start

extern exit

import exit msvcrt.dll

segment data use=32 class=data

    a db 7fh
    b dw 7abch
    c dd 1abch
    d dq 7777777777777777h

segment code use=32 class=code

    ;(d - a) - (a - c) - d
    ;d - a
    mov eax, [d]
    mov edx, [d + 4]
    mov ecx, 0
    mov cl, [a]
    
    clc
    sub eax, ecx
    sbb ebx, 0
    
    ;a - c
    mov ebx, 0
    mov ecx, 0
    clc
    mov bl, [a]
    mov eax, [c]
    sub ebx, eax
    mov ecx, 0
    sbb ecx, 0
    
    ;(d-a)-(a-c)   
    sub eax, ebx
    sbb edx, ecx
    
    ;totul - d
    mov ebx, [d]
    mov ecx, [d + 4]
    
    sub eax, ebx
    sbb edx, ecx
    
    