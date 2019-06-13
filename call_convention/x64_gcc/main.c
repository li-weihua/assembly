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
extern int intsum(int *vec, int n);
extern double floatsum(double*, unsigned int);

// recursive function
extern long factorial(unsigned int n);

int main() {

  printf("%d\n", sum1(1,2,3,4,5,6,7,8));
  printf("%d\n", sum2(1.f, 2, 3, 4.f, 5, 6.f, 7, 8.f, 9));
  printf("%f\n", sum3(1,2,3,4,5,6,7,8,9,10));
  printf("%f\n", sum4(1,2,3,4,5,6,
                      1,2,3,4,5,6,7,8,
                      11,12,13,14));
  

  int intvec[] = {1,2,3,4,5,6,7,8,9};
  printf("%d\n", intsum(intvec, 9));

  double floatvec[] = {40.5, 26.7, 21.9, 1.5, -40.5, -23.4};
  printf("%f\n", floatsum(floatvec, 6));
  printf("%f\n", floatsum(floatvec, 2));
  printf("%f\n", floatsum(floatvec, 0));
  printf("%f\n", floatsum(floatvec, 3));

  printf("factorial function:\n");

  for (int i=0; i<11; ++i) {
    printf("%d! = %ld\n", i, factorial(i));
  }

  return 0;
}
