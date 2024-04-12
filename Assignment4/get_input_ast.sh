#!bin/bash

make all

mkdir -p ./testcases && cd testcases
mkdir -p ./tokens
mkdir -p ./ast

for test_idx in {0..5}; do
    test="test$test_idx"
    test_program="./test$test_idx.oat"
    tokens="./tokens/${test}.txt"
    parser_ast_dot="./ast/${test}.dot"
    ast_png_before_semantic_analysis="./ast/${test}-before.png"
    echo "$test"
    # Parser outputs AST in dot file
    ../compiler $test_program ${parser_ast_dot} > ${tokens}
    # Visualize initial output AST and the one after semantic analysis
    python3 ../a4.py ${parser_ast_dot} ${ast_png_before_semantic_analysis}
done
