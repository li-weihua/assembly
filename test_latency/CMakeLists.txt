cmake_minimum_required(VERSION 3.9)

project(test_latency CXX ASM_NASM)

# use c++ 11
set(CMAKE_CXX_STANDARD 11)

# sometimes cmake make wrong decision of elf32 and elf64
set(CMAKE_ASM_NASM_OBJECT_FORMAT elf64)
set(CMAKE_ASM_NASM_COMPILE_OBJECT "<CMAKE_ASM_NASM_COMPILER> <INCLUDES> \
    <FLAGS> -f ${CMAKE_ASM_NASM_OBJECT_FORMAT} -o <OBJECT> <SOURCE>")

add_executable(test_latency main.cc rdtsc.asm fma.asm)

