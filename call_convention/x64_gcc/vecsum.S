  .globl intsum, floatsum
  .text
# extern int intsum(int *vec, int n);
# int* is passed by rdi register
# n is passed by esi register
intsum:
  xor %eax, %eax
  cmp $0, %rsi
  jz endloop1
beginloop1:
  add  (%rdi), %eax
  add $4, %rdi
  sub $1, %rsi
  jnz beginloop1
endloop1:
  ret


#extern double floatsum(double*, unsigned int);
floatsum:
  xorpd %xmm0, %xmm0
  cmp $0, %rsi
  jz endloop2
beginloop2:
  addsd (%rdi), %xmm0
  add $8, %rdi
  sub $1, %rsi
  jnz beginloop2
endloop2:
  ret
