CC = gcc

test_div: main.o div.o
	$(CC) $^ -o $@

main.o: main.c
	$(CC) -c $^ -o $@

div.o: div.asm
	nasm -f elf64 $^ -o $@
