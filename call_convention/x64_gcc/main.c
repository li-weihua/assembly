#include <stdio.h>

// integer parameters
extern int sum1(int, int, int, int, int, int, int, int);

// mix integer and float type
extern int sum2(float, int, int, float, int, float, int, float, int);

// float type
extern float 
sum3(float,float,float,float,float,
     float,float,float,float,float);

// mix int and float
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

// passing struct
typedef struct {
  int a, b;
} Struct_2i;

typedef struct {
  int a;
  long b;
  int c;
} Struct_3i;

typedef struct {
  int a, b, c, d;
} Struct_4i;

typedef struct {
  int a, b, c, d, e;
} Struct_5i;

extern int sumstruct_2i(Struct_2i);
extern int sumstruct_3i(Struct_3i);
extern int sumstruct_4i(Struct_4i);
extern int sumstruct_5i(Struct_5i);

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

  // struct parameters
  Struct_2i s2i = {.a=2, .b=-10};
  Struct_3i s3i = {.a=2, .b=-10, .c=-1};
  Struct_4i s4i = {.a=2, .b=-10, .c=-1, .d=3};
  Struct_5i s5i = {.a=2, .b=-10, .c=-1, .d=3, .e=-5};

  printf("sum_2i = %d\n", sumstruct_2i(s2i));
  printf("sum_3i = %d\n", sumstruct_3i(s3i));
  printf("sum_4i = %d\n", sumstruct_4i(s4i));
  printf("sum_5i = %d\n", sumstruct_5i(s5i));

  return 0;
}
