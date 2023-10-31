bits 32

global start

extern exit

import msvcrt.dll

sement data use32 cass=data

    a db 7fh
    b dw 7abch
    c dd 1abch
    d dq 77777777777777h
    
segment code use 32 class=code

;(c + b + a) - (d + d)
start:
    ;c+b+a
    mov eax, 0
    mov ebx, 0
    mov eax, [c]
    mov ecx, 0
    mov cx, [a]
    clc
    add eax, ecx
    adc edx, 0
    mov ecx, [b]
    clc
    add eax, ecx
    adc edx, 0
    
    ;(d + d)
    mov ebx, [d]
    mov ecx, [d + 4]
    
    clc
    add ebx, [d]
    adc ecx, [d + 4]
    
    ;diferenta
    sub eax, ebx
    sbb edx, ecx

push dword 0
call [exit]