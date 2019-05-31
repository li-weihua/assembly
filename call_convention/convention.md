# gcc x64 function calling convention

## integer type

The first six integer parameters are passed by **rdi , rsi , rdx , rcx , r8 , r9**,  the left are passed via stack, eg, 8(%rsp) ...


| parameter | 1    | 2    | 3    | 4    | 5    | 6    | 7       |
| --------- | ---- | ---- | ---- | ---- | ---- | ---- | ------- |
| type      | int  | int  | int  | int  | int  | int  | int     |
| register  | edi  | esi  | edx  | ecx  | r8d  | r9d  | [rsp+8] |

## floating type

The first eight floating point parameters are passed by **xmm0, xmm1 , xmm2 , xmm3,
 xmm4 , xmm5, xmm6, xmm7**,  the left are passed via stack, eg, 8(%rsp) ...

| parameter | 1     | 2     | 3     | 4     | 5     | 6     | 7     | 8     | 9       |
| --------- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ------- |
| type      | float | float | float | float | float | float | float | float | float   |
| register  | xmm0  | xmm1  | xmm2  | xmm3  | xmm4  | xmm5  | xmm6  | xmm7  | [rsp+8] |

## mixing  type

When mixing them together, integer type is also passed by above registers following their appearance order, same for floating point type.  Integer parameters more than 6 or floating point parameters more than 8 are passed by stack.

| parameter | 1    | 2     | 3    | 4     |
| --------- | ---- | ----- | ---- | ----- |
| type      | int  | float | int  | float |
| register  | edi  | xmm0  | esi  | xmm1  |

