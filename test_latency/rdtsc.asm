default rel

global  ReadTSC

SECTION .text  align=16

ReadTSC:
        push    rbx                    ; ebx is modified by cpuid
        sub     eax, eax               ; 0
        cpuid                          ; serialize
        rdtsc                          ; read time stamp counter into edx:eax
        shl     rdx, 32
        or      rax, rdx               ; combine into 64 bit register        
        push    rax
        sub     eax, eax
        cpuid                          ; serialize
        pop     rax                    ; return value
        pop     rbx
        ret
;ReadTSC ENDP
