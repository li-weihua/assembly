default rel

global asm_isa_detect

section .data
; instruction set feature int
; bits: feature
; ----:---------
;    0: sse
;    1: sse2
;    2: sse3
;    3: ssse3
;    4: sse4.1
;    5: sse4.2
;    6: sse4a
;    7: f16c
;    8: avx
;    9: fma3
;   10: fma4
;   11: avx2
instructionSet: dd 0

section .text align=16
;
asm_isa_detect:
  push ebx
  mov eax, 1
  cpuid
  bt edx, 25 ; test sse support
  jnc ISEND
  or instructionSet, 1

ISEND:
  pop ebx
  ret
; asm_isa_detect end

