  .globl sum1, sum2, sum3, sum4
# note: the following code is not optimized! 

# sum eight integer parametes
# int sum1(int, int, int, int, int, int, int, int);
sum1:
  movl %edi, %eax
  addl %esi, %eax
  addl %edx, %eax
  addl %ecx, %eax
  addl %r8d, %eax
  addl %r9d, %eax
  addl 8(%rsp), %eax
  addl 16(%rsp), %eax
  ret

# int sum2(float, int, int, float, int, float, int, float, int);
sum2:
  cvtss2si   %xmm0, %eax    #1
  addl %edi, %eax            #2
  addl %esi, %eax            #3
  cvtss2si   %xmm1, %r10d   #4
  addl %r10d, %eax
  addl %edx, %eax            #5
  cvtss2si   %xmm2, %r10d   #6
  addl %r10d, %eax
  addl %ecx, %eax            #7
  cvtss2si   %xmm3, %r10d   #8
  addl %r10d, %eax
  addl %r8d,  %eax
  ret

# extern float 
# sum3(float,float,float,float,float,
#      float,float,float,float,float);
sum3:
  addss %xmm1, %xmm0      #1,2
  addss %xmm2, %xmm0      #3
  addss %xmm3, %xmm0      #4
  addss %xmm4, %xmm0      #5
  addss %xmm5, %xmm0      #6
  addss %xmm6, %xmm0      #7
  addss %xmm7, %xmm0      #8
  movss 8(%rsp), %xmm1    #9
  addss %xmm1, %xmm0
  movss 16(%rsp), %xmm1   #10
  addss %xmm1, %xmm0
  ret

#extern int 
#sum4(int, int, int, int, int, int,
#     float,float,float,float,
#     float,float,float,float,
#     int, float, float, int);
sum4:
  addl %esi, %edi
  addl %edx, %edi
  addl %ecx, %edi
  addl %r8d, %edi
  addl %r9d, %edi
  
  addss %xmm1, %xmm0
  addss %xmm2, %xmm0
  addss %xmm3, %xmm0
  addss %xmm4, %xmm0
  addss %xmm5, %xmm0
  addss %xmm6, %xmm0
  addss %xmm7, %xmm0

  cvtsi2ss 8(%rsp), %xmm1
  addss %xmm1, %xmm0
  addss 16(%rsp), %xmm0
  addss 24(%rsp), %xmm0
  cvtsi2ss 32(%rsp), %xmm2
  addss %xmm2, %xmm0
  cvtsi2ss %edi, %xmm3
  addss %xmm3, %xmm0
  ret
