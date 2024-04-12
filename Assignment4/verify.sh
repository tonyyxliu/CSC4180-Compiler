#!bin/bash

# compile runtime.c into LLVM IR
clang --target=riscv64 -emit-llvm -S -I/usr/include runtime.c -o runtime.ll

mkdir -p ./testcases && cd testcases
mkdir -p ./tokens
mkdir -p ./ast
mkdir -p ./llvm_ir
mkdir -p ./riscv_assembly
mkdir -p ./executable
mkdir -p ./output

for test_idx in {0..5}; do
    test="test$test_idx"
    test_program="./test$test_idx.oat"
    tokens="./tokens/${test}.txt"
    parser_ast_dot="./ast/${test}.dot"
    ast_png_after_semantic_analysis="./ast/${test}-after.png"
    self_ir="./llvm_ir/${test}-self.ll"
    merged_ir="./llvm_ir/${test}.ll"
    assembly="./riscv_assembly/${test}.s"
    exe="./executable/${test}"
    output="./output/${test}.txt"
    echo "$test"
    # Visualize initial output AST and the one after semantic analysis
    python3 ../a4.py ${parser_ast_dot} ${ast_png_before_semantic_analysis} ${self_ir}
    ## Uncomment the following after you finish output the LLVM IR
    # # Combine LLVM IR of source program and runtime functions into one merged IR file
    # llvm-link ${self_ir} runtime.ll -o ${merged_ir}
    # llc -march=riscv64 ${merged_ir} -o ${assembly}
    # riscv64-unknown-linux-gnu-gcc ${assembly} -o ${exe}
    # qemu-riscv64 -L /opt/riscv/sysroot ${exe} > ${output}
done