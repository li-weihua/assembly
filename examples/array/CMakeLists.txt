cmake_minimum_required(VERSION 3.5)

project(sum_array CXX ASM_NASM)

set(CMAKE_CXX_STANDARD 11)

set(CMAKE_ASM_NASM_OBJECT_FORMAT elf64)
set(CMAKE_ASM_NASM_COMPILE_OBJECT "<CMAKE_ASM_NASM_COMPILER> <INCLUDES> \
    <FLAGS> -f ${CMAKE_ASM_NASM_OBJECT_FORMAT} -o <OBJECT> <SOURCE>")

add_executable(sum_array main.cc sum.asm)

