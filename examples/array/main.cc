#include <iostream>

extern "C" int sum_array(int *arr, int n);

int main() {

  constexpr int n = 231;
  int *arr = new int[n];
  int sum = 0;

  for (int i=0; i<n; ++i) {
    arr[i] = 2*i+1;
    sum += arr[i];
  }

  if (sum_array(arr, n) == sum) {
    std::cout << "check ok!" << std::endl;
  } else {
    std::cout << "check fail!" << std::endl;
  }


  return 0;
}
