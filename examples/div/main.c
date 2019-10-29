#include <stdio.h>
#include <stdlib.h>

extern int mydiv(int a, int b, int *q, int *r);

int main(int argc, char* argv[]) {
  if (argc != 3) {
    printf("Usage: %s [dividend] [divisor]\n", argv[0]);
    return 1;
  }

  int a = atoi(argv[1]);
  int b = atoi(argv[2]);
  int q, r;

  if (mydiv(a, b, &q, &r) == 0) {
    // correct
    printf("%d = %d * (%d) + (%d)\n", a, b, q, r);
  } else {
    printf("dividor is zero!\n");
  }

  return 0;
}
