  .global sumstruct_2i, sumstruct_3i, sumstruct_4i, sumstruct_5i

# via integer register, two integer are packed
sumstruct_2i:
  movl %edi, %eax
  sarq $32, %rdi
  addl %edi, %eax
  ret

# via stack, two integer are packed
sumstruct_3i:
  movl 8(%rsp), %eax
  addl 16(%rsp), %eax
  addl 24(%rsp), %eax
  ret


# via integer register, two integer are packed
sumstruct_4i:
  movl %edi, %eax
  sarq $32, %rdi
  addl %edi, %eax
  addl %esi, %eax
  sarq $32, %rsi
  addl %esi, %eax
  ret

# more than two eight-bytes via stack
sumstruct_5i:
  movl 8(%rsp), %eax 
  addl 12(%rsp), %eax
  addl 16(%rsp), %eax
  addl 20(%rsp), %eax
  addl 24(%rsp), %eax
  ret

