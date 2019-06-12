#include <stdio.h>

extern int sum1(int, int, int, int, int, int, int, int);

extern int sum2(float, int, int, float, int, float, int, float, int);

extern float 
sum3(float,float,float,float,float,
     float,float,float,float,float);

extern float 
sum4(int, int, int, int, int, int,
     float,float,float,float,
     float,float,float,float,
     int, float, float, int);

// passing pointers
extern int vecsum(int *vec, int n);

int main() {

  printf("%d\n", sum1(1,2,3,4,5,6,7,8));
  printf("%d\n", sum2(1.f, 2, 3, 4.f, 5, 6.f, 7, 8.f, 9));
  printf("%f\n", sum3(1,2,3,4,5,6,7,8,9,10));
  printf("%f\n", sum4(1,2,3,4,5,6,
                      1,2,3,4,5,6,7,8,
                      11,12,13,14));
  

  int vec[] = {1,2,3,4,5,6,7,8,9};
  printf("%d\n", vecsum(vec, 9));

  return 0;
}
