default rel

global avx512fma

SECTION .text  align=16

avx512fma:
  vpxord zmm0, zmm0
  vpxord zmm1, zmm1
  vpxord zmm2, zmm2
  vpxord zmm3, zmm3
  vpxord zmm4, zmm4
  vpxord zmm5, zmm5
  vpxord zmm6, zmm6
  vpxord zmm7, zmm7
  vpxord zmm8, zmm8
L1:
  vfmadd231ps zmm0, zmm0, zmm0
  vfmadd231ps zmm1, zmm1, zmm1
  vfmadd231ps zmm2, zmm2, zmm2
  vfmadd231ps zmm3, zmm3, zmm3
  vfmadd231ps zmm4, zmm4, zmm4
  vfmadd231ps zmm5, zmm5, zmm5
  vfmadd231ps zmm6, zmm6, zmm6
  vfmadd231ps zmm7, zmm7, zmm7
  ;vfmadd231ps zmm8, zmm8, zmm8
  sub rdi, 1
  jne L1
  ret
;avx512fma ENDP

