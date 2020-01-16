#include <stdio.h>

extern int sum32(int x1, int x2, int x3, int x4, int x5, int x6, int x7, int x8, int x9, int x10);
extern long sum64(long x1, long x2, long x3, long x4, long x5, long x6, long x7, long x8, long x9, long x10);

int main() {

  printf("%d\n", sum32(1,2,3,4,5,6,7,8,9,10));
  printf("%ld\n", sum64(1,2,3,4,5,6,7,8,9,10));

  return 0;
}

