# gcc x64 function calling convention

reference website: https://github.com/hjl-tools/x86-psABI/wiki/X86-psABI

https://stackoverflow.com/questions/44083087/amd64-abi-function-calling-sequence-for-arguments-of-type-m256

## categories
The document defines seven categories:

- [x] **INTEGER**  This class consists of integral types that fit into one of the general purpose registers
- [x] **SSE**      The class consists of types that fit into a vector register.
- [x] **SSEUP** The class consists of types that fit into a vector register and can be passed and returned in the upper bytes of it.
- **X87, X87UP**  These classes consists of types that will be returned via the x87 FPU.
- **COMPLEX_X87**  This class consists of types that will be returned via the x87 FPU.
- **NO_CLASS**  This class is used as initializer in the algorithms. It will be used for padding and empty structures and unions.
- **MEMORY**  This class consists of types that will be passed and returned in memory via the stack.

## Classification

The size of each argument gets rounded up to eightbytes, therefore the stack will always be eightbyte aligned.

- [x] Arguments of types (signed and unsigned) \_Bool, char, short, int, long, long long, and pointers are in the **INTEGER** class.

- [x] Arguments of types float, double, \_Decimal32, \_Decimal64 and \_\_m64 are in class **SSE**.

- [ ] Arguments of types \_\_float128, \_Decimal128 and \_\_m128 are split into two halves. The least significant ones belong to class **SSE**, the most significant one to class **SSEUP**.

- Arguments of type \_\_m256 are split into four eightbyte chunks. The least significant one belongs to class **SSE** and all the others to class **SSEUP**.

- Arguments of type \_\_m512 are split into eight eightbyte chunks. The least significant one belongs to class **SSE** and all the others to class **SSEUP**.

- The 64-bit mantissa of arguments of type long double

- The 64-bit mantissa of arguments of type long double belongs to class X87, the 16-bit exponent plus 6 bytes of padding belongs to class X87UP.

- Arguments of type \_\_int128 offer the same operations as INTEGERs,
  yet they do not fit into one general purpose register but require two registers.
  For classification purposes \_\_int128 is treated as if it were implemented
  as:
  ```c
	typedef struct {
		long low, high;
	} __int128;
  ```
  
  with the exception that arguments of type __int128 that are stored in memory must be aligned on a 16-byte boundary.
  
- Arguments of complex T where T is one of the types float or double
    are treated as if they are implemented as:
    
    ```c    
    struct complexT {
    T real;
    T imag;
    };
    
    ```
A variable of type complex long double is classified as type COMPLEX_X87.

The classification of aggregate (structures and arrays) and union types works as follows:
1. If the size of an object is larger than eight eightbytes, or it contains unaligned fields, it has class MEMORY
2. If a C++ object is non-trivial for the purpose of calls, as specified in the C++ ABI 13 , it is passed by invisible reference (the object is replaced in the parameter list by a pointer that has class INTEGER)
3. If the size of the aggregate exceeds a single eightbyte, each is classified separately. Each eightbyte gets initialized to class NO_CLASS.
4. Each field of an object is classified recursively so that always two fields are considered. The resulting class is calculated according to the classes of the fields in the eightbyte:




###  caller-saved (volatile) and callee-saved (non-volatile) registers

Caller-saved register is also called volatile register, which means callee can use freely.
Callee-saved register cannot be modified.

|                        | registers                                                    |
| ---------------------- | ------------------------------------------------------------ |
| caller-saved registers | 6-parameters, RAX, R10,  R11,  K0-K8, xmm0-xmm15, ymm0-ymm15, zmm0-zmm31 |
| callee-saved registers | RBX , RBP , R12 - R15                                        |


## examples

### 1. integer type

The first six integer parameters are passed by **rdi , rsi , rdx , rcx , r8 , r9**,  the left are passed via stack, eg, 8(%rsp) ...


| parameter | 1    | 2    | 3    | 4    | 5    | 6    | 7       |
| --------- | ---- | ---- | ---- | ---- | ---- | ---- | ------- |
| type      | int  | int  | int  | int  | int  | int  | int     |
| register  | edi  | esi  | edx  | ecx  | r8d  | r9d  | 8(%rsp) |
| x64       | rdi  | rsi  | rdx  | rcx  | r8   | r9   | 8(%rsp) |

### 2. floating type

The first eight floating point parameters are passed by **xmm0, xmm1 , xmm2 , xmm3,
 xmm4 , xmm5, xmm6, xmm7**,  the left are passed via stack, eg, 8(%rsp) ...

| parameter | 1     | 2     | 3     | 4     | 5     | 6     | 7     | 8     | 9       |
| --------- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ------- |
| type      | float | float | float | float | float | float | float | float | float   |
| register  | xmm0  | xmm1  | xmm2  | xmm3  | xmm4  | xmm5  | xmm6  | xmm7  | 8(%rsp) |

### 3. mixing integer and float

When mixing them together, integer type is also passed by above registers following their appearance order, same for floating point type.  Integer parameters more than 6 or floating point parameters more than 8 are passed by stack.

| parameter | 1    | 2     | 3    | 4     |
| --------- | ---- | ----- | ---- | ----- |
| type      | int  | float | int  | float |
| register  | edi  | xmm0  | esi  | xmm1  |


### 4. pointer parameter

pointer treated as  integer paramter.

### 5. struct parameter

1. If the size of struct exceeds two eight-bytes, it will be passed by stack. 
2. Structures and unions assume the alignment of their most strictly aligned component. Each member is assigned to the lowest available offset with the appropriate alignment. Structure and union objects can require padding to meet size and alignment constraints.

Combine 1 and 2, e.g. mixing int and long should be carefull,  
```c
struct Struct_3i {int a; long b;  int c;};  
```
After **a** it should be padding 4 bytes to meet alignment, so **Struct_3i** is passed by stack.
