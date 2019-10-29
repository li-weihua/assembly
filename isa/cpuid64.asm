default rel

global asm_cpuidex

section .text align=16
; linux version
; void asm_cpuidex(regs[4], eax, ecx)
asm_cpuid:
  push rbx
  mov eax, esi
  mov ecx, edx
  cpuid
  mov [rdi], eax
  mov [rdi + 4], ebx
  mov [rdi + 8], ecx
  mov [rdi + 12], edx
  pop rbx
  ret
; asm_cpuidex end
