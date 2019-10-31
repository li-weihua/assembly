#include <iostream>

extern "C"  {
  int g_cpp;
  extern int g_asm; // defined in asm file!
  void add_one();

  int g_n = 99;
  int g_array[99];
  int sum_array();
}

int main() {
  // do some init first!
  int v1 = 12;
  int v2 = g_asm;
  g_cpp = v1;
  int sum = 0;

  for (int i=0; i<g_n; ++i) {
    g_array[i] = i + 1;
    sum += g_array[i];
  }

  std::cout << "g_cpp = " << g_cpp << std::endl;
  std::cout << "g_asm = " << g_asm << std::endl;

  add_one();

  std::cout << "g_cpp + 1= " << g_cpp << std::endl;

  if (g_cpp == (v1+1)) {
    std::cout << "g_cpp add one check ok!" << std::endl;
  } else {
    std::cout << "g_cpp add one check fail!" << std::endl;
  }

  std::cout << "g_asm + 1= " << g_asm << std::endl;

  if (g_asm == (v2+1)) {
    std::cout << "g_asm add_one check ok!" << std::endl;
  } else {
    std::cout << "g_asm add_one check fail!" << std::endl;
  }

  int s = sum_array();

  if (s == sum) {
    std::cout << "summing array check ok!" << std::endl;
  } else {
    std::cout << "summing array check fail!" << std::endl;
    std::cout << "correct: " << sum << ", but asm is: " << s << std::endl;
  }


  return 0;
}
