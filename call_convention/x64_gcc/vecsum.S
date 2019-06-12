# extern int vecsum(int *vec, int n);
# int* is passed by rdi register
# n is passed by esi register
  .globl	vecsum
vecsum:
  xor %eax, %eax
beginloop:
  cmp $0, %rsi
  jz endloop
  add  (%rdi), %eax
  add $4, %rdi
  sub $1, %rsi
  jmp beginloop
endloop:
  ret

