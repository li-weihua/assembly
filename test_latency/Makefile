test_latency: main.o rdtsc.o fma.o
	g++ $^ -o $@

main.o: main.cc
	g++ -std=c++14 -c main.cc

rdtsc.o: rdtsc.asm
	nasm -f elf64 rdtsc.asm

fma.o: fma.asm
	nasm -f elf64 fma.asm

clean:
	-$(RM) *.o
