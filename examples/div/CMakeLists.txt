cmake_minimum_required(VERSION 3.14)

set(project_name "test_div")

#project(${project_name} ASM_NASM C)
project(${project_name})

enable_language(ASM_NASM)
set(CMAKE_ASM_NASM_OBJECT_FORMAT elf64)

set(CMAKE_ASM_NASM_COMPILE_OBJECT "<CMAKE_ASM_NASM_COMPILER> <INCLUDES> \
    <FLAGS> -f ${CMAKE_ASM_NASM_OBJECT_FORMAT} -o <OBJECT> <SOURCE>")

#set_source_files_properties(div.asm PROPERTIES COMPILE_FLAGS "-g -Fdwarf")

add_executable(${project_name} main.c div.asm)

