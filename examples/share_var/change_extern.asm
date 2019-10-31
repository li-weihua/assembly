default rel

global add_one, sum_array
global g_asm

extern g_cpp, g_array, g_n

section .data
g_asm: dw 2

section .text align=16
; add global g_val one
add_one:
  add dword [g_cpp], 1
  add dword [g_asm], 1
  ret

; int sum_array
sum_array:
  mov edx, [g_n]
  mov rcx, g_array
  xor eax, eax
sumloop:
  add eax, dword [rcx]
  add rcx, 4
  sub edx, 1
  jnz  sumloop
  ret

