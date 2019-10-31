default rel

global sum_array

section .text align=16
; int sum_array
sum_array:
  xor eax, eax
addloop:
  add eax, [rdi]
  add rdi, 4
  sub esi, 1 
  jnz addloop
  ret

