# Case-Study of Clang/LLVM Compiler Phases

In tutorial 1, TA has introduced the following six phases of compiler, while the first four belong to the compiler front-end and the last two belong to the compiler back-end.
1. Scanning (Lexical Analysis)
2. Parsing (Syntactic Analysis)
3. Semantic Analysis
4. Intermediate Code Generation
5. Optimization
6. Code Generation

Apart from the conceptual study about what does each phase do, it is better to have a hands-on experience on what does each phase do and what is the output of each phase. In this documentation, we are going to use Clang/LLVM as an example, and to see how it deals with each compiler phase.

## Sample Program: Hello World

A simple hello world program is used for demonstration of Clang/LLVM compiler.

```c
// hello_world.c
#include <stdio.h>

int main() {
    printf("Hello, world!\n");
    return 0;
}
```

## Print Clang Phases

Execute the following command to see all the phases supported by `Clang`:

```bash
clang -ccc-print-phases hello_world.c
```

```bash
root@9dd19eb3eee8:/home/csc4180/tutorial# clang -ccc-print-phases hello_world.c
            +- 0: input, "hello_world.c", c
         +- 1: preprocessor, {0}, cpp-output
      +- 2: compiler, {1}, ir
   +- 3: backend, {2}, assembler
+- 4: assembler, {3}, object
5: linker, {4}, image
```

## Scanning (Lexical Analysis)

Execute the following command to see the output of scanning phase of `Clang`. You are supposed to see a large amount of output since the <stdio.h> library has been included in preprocessing stage. If you want to see more specific and less output, you could add the `-nostdinc` option with clang. 

```bash
clang -fmodules -E -Xclang -dump-tokens hello_world.c
```

```bash
root@9dd19eb3eee8:/home/csc4180/tutorial# clang -fmodules -E -Xclang -dump-tokens -nostdinc ./hello_world.c
./hello_world.c:2:10: fatal error: 'stdio.h' file not found
#include <stdio.h>
         ^~~~~~~~~
int 'int'        [StartOfLine]  Loc=<./hello_world.c:4:1>
identifier 'main'        [LeadingSpace] Loc=<./hello_world.c:4:5>
l_paren '('             Loc=<./hello_world.c:4:9>
r_paren ')'             Loc=<./hello_world.c:4:10>
l_brace '{'      [LeadingSpace] Loc=<./hello_world.c:4:12>
identifier 'printf'      [StartOfLine] [LeadingSpace]   Loc=<./hello_world.c:5:5>
l_paren '('             Loc=<./hello_world.c:5:11>
string_literal '"Hello, world!\n"'              Loc=<./hello_world.c:5:12>
r_paren ')'             Loc=<./hello_world.c:5:29>
semi ';'                Loc=<./hello_world.c:5:30>
return 'return'  [StartOfLine] [LeadingSpace]   Loc=<./hello_world.c:6:5>
numeric_constant '0'     [LeadingSpace] Loc=<./hello_world.c:6:12>
semi ';'                Loc=<./hello_world.c:6:13>
r_brace '}'      [StartOfLine]  Loc=<./hello_world.c:7:1>
eof ''          Loc=<./hello_world.c:7:2>
1 error generated.
```

## Parsing (Syntactic Analysis) & Semantic Analysis

Execute the following command to see the abstract syntax tree outputed by `Clang` of the `hello_world.c` program

```bash
clang -fmodules -fsyntax-only -Xclang -ast-dump hello_world.c
```

```bash
root@9dd19eb3eee8:/home/csc4180/tutorial# clang-10 -fmodules -fsyntax-only -Xclang -ast-dump -nostdinc ./hello_world.c
./hello_world.c:2:10: fatal error: 'stdio.h' file not found
#include <stdio.h>
         ^~~~~~~~~
TranslationUnitDecl 0x8eec48 <<invalid sloc>> <invalid sloc>
|-TypedefDecl 0x8ef4e0 <<invalid sloc>> <invalid sloc> implicit __int128_t '__int128'
| `-BuiltinType 0x8ef1e0 '__int128'
|-TypedefDecl 0x8ef550 <<invalid sloc>> <invalid sloc> implicit __uint128_t 'unsigned __int128'
| `-BuiltinType 0x8ef200 'unsigned __int128'
|-TypedefDecl 0x8ef868 <<invalid sloc>> <invalid sloc> implicit __NSConstantString 'struct __NSConstantString_tag'
| `-RecordType 0x8ef640 'struct __NSConstantString_tag'
|   `-Record 0x8ef5a8 '__NSConstantString_tag'
|-TypedefDecl 0x8ef900 <<invalid sloc>> <invalid sloc> implicit __builtin_ms_va_list 'char *'
| `-PointerType 0x8ef8c0 'char *'
|   `-BuiltinType 0x8eece0 'char'
|-TypedefDecl 0x9325d0 <<invalid sloc>> <invalid sloc> implicit __builtin_va_list 'struct __va_list_tag [1]'
| `-ConstantArrayType 0x8efbb0 'struct __va_list_tag [1]' 1 
|   `-RecordType 0x8ef9f0 'struct __va_list_tag'
|     `-Record 0x8ef958 '__va_list_tag'
|-FunctionDecl 0x932680 <./hello_world.c:4:1, line:7:1> line:4:5 main 'int ()'
| `-CompoundStmt 0x932ab8 <col:12, line:7:1>
|   |-CallExpr 0x932a30 <line:5:5, col:29> 'int'
|   | |-ImplicitCastExpr 0x932a18 <col:5> 'int (*)(const char *, ...)' <FunctionToPointerDecay>
|   | | `-DeclRefExpr 0x932930 <col:5> 'int (const char *, ...)' Function 0x9327b8 'printf' 'int (const char *, ...)'
|   | `-ImplicitCastExpr 0x932a70 <col:12> 'const char *' <NoOp>
|   |   `-ImplicitCastExpr 0x932a58 <col:12> 'char *' <ArrayToPointerDecay>
|   |     `-StringLiteral 0x9329a8 <col:12> 'char [15]' lvalue "Hello, world!\n"
|   `-ReturnStmt 0x932aa8 <line:6:5, col:12>
|     `-IntegerLiteral 0x932a88 <col:12> 'int' 0
`-FunctionDecl 0x9327b8 <line:5:5> col:5 implicit used printf 'int (const char *, ...)' extern
  |-ParmVarDecl 0x932858 <<invalid sloc>> <invalid sloc> 'const char *'
  `-FormatAttr 0x9328c8 <col:5> Implicit printf 1 2
1 error generated.
```

## Intermediate Code Generation (LLVM IR)

In this section, you are gong to see the most important thing in LLVM, that is the LLVM Intermediate Representation (LLVM IR). With LLVM IR, you can plug in multiple types of compiler front-end to translate the source code into LLVM IR, which is platform-independent, and later do optimization and code generation for various types of compiler backend, including x86_64, ARM, and RISC-V. The following command will generate 

```bash
clang --target=riscv64 -emit-llvm -S -I/usr/include hello_world.c -o hello_world.ll
```

```bash
root@9dd19eb3eee8:/home/csc4180/tutorial# clang-10 --target=riscv64 -emit-llvm -S -I/usr/include ./hello_world.c -o ./hello_world.ll
root@9dd19eb3eee8:/home/csc4180/tutorial# cat ./hello_world.ll 
; ModuleID = './hello_world.c'
source_filename = "./hello_world.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

@.str = private unnamed_addr constant [15 x i8] c"Hello, world!\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local signext i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %2 = call signext i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0))
  ret i32 0
}

declare dso_local signext i32 @printf(i8*, ...) #1

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{!"clang version 10.0.0-4ubuntu1~18.04.2 "}
```

## Optimization

LLVM uses a tool called `opt` to optimize the LLVM IR generated in the previous phases, and you will get optimized LLVM IR.

```bash
opt hello_world.ll -S --O3
# or
clang --target=riscv64 -O3 -emit-llvm -S -I/usr/include hello_world.c -o hello_world.ll
```

## Code Generation

### Translating LLVM IR to Target Assembly Code

```bash
llc -march=riscv64 hello_world.ll -o hello_world.s
```

```bash
root@9dd19eb3eee8:/home/csc4180/tutorial# cat ./hello_world.s
        .text
        .file   "hello_world.c"
        .globl  main                    # -- Begin function main
        .p2align        1
        .type   main,@function
main:                                   # @main
# %bb.0:
        addi    sp, sp, -32
        sd      ra, 24(sp)
        sd      s0, 16(sp)
        addi    s0, sp, 32
        sw      zero, -20(s0)
        lui     a0, %hi(.L.str)
        addi    a0, a0, %lo(.L.str)
        call    printf
        mv      a0, zero
        ld      s0, 16(sp)
        ld      ra, 24(sp)
        addi    sp, sp, 32
        ret
.Lfunc_end0:
        .size   main, .Lfunc_end0-main
                                        # -- End function
        .type   .L.str,@object          # @.str
        .section        .rodata.str1.1,"aMS",@progbits,1
.L.str:
        .asciz  "Hello, world!\n"
        .size   .L.str, 15

        .ident  "clang version 10.0.0-4ubuntu1~18.04.2 "
        .section        ".note.GNU-stack","",@progbits
```

### Assembling: Generating Object Code From Assembly Code

```bash
riscv64-linux-gnu-as hello_world.s -o hello_world.o
```

The output object code is machine-readable and hard for human to read and understand.

### Linking: Transfering Object Code to Executable Code

```bash
riscv64-unknown-linux-gnu-gcc hello_world.o -o hello_world
```


## Program Execution

```bash
qemu-riscv64 -L /opt/riscv/sysroot hello_world
```

```bash
root@9dd19eb3eee8:/home/csc4180/tutorial# qemu-riscv64 -L /opt/riscv/sysroot ./hello_world
Hello, world!
```