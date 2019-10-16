#include <iostream>
#include <cstdint>

extern "C" uint64_t ReadTSC();
extern "C" uint64_t avx512fma(int64_t count);

int main() {

  constexpr int n = 11;
  uint64_t tsc[n];

  for (int i=0; i<n; ++i) {
    uint64_t t1 = ReadTSC();
    uint64_t t2 = ReadTSC();
    tsc[i] = t2 - t1;
  }

  uint64_t tsc_latency = 0;
  for (int i=1; i<n; ++i) {
    //std::cout << tsc[i] << std::endl;
    tsc_latency += tsc[i];
  }

  tsc_latency /= (n-1);

  std::cout << "tsc latency: "<< tsc_latency << std::endl;

  constexpr int64_t loop = 10000;
  for (int i=0; i<10; ++i) {

    uint64_t t1 = ReadTSC();
    avx512fma(loop);
    uint64_t t2 = ReadTSC();

    std::cout << (t2-t1-tsc_latency)/loop << std::endl;
  }

  return 0;
}
