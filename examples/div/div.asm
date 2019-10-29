default rel

global mydiv

section .text align=16
; int mydiv(int a, int b, int *q, int *r) -> a = b*q + r
mydiv:
  mov eax, 1
  test esi, esi ; check dividor
  jz ISEND
  mov r8, rdx
  mov eax, edi
  cdq
  idiv esi
  mov [r8], eax
  mov [rcx], edx
  mov eax, 0 ; zero means ok
ISEND:
  ret

