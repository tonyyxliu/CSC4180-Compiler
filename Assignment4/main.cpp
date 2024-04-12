/**
 * --------------------------------------
 * CUHK-SZ CSC4180: Compiler Construction
 * Assignment 1: Micro Language Compiler
 * --------------------------------------
 * Author: Mr.Liu Yuxuan
 * Position: Teaching Assisant
 * Date: January 25th, 2024
 * Email: yuxuanliu1@link.cuhk.edu.cn
 * 
 * This file defines the main function, which is the entrace to the Micro language compiler.
 */

#include <iostream>
#include <fstream>
#include <string>
#include <cstring>

#include "node.hpp"

extern int yyparse();

extern int yylex();

extern Node* root_node;

int main(int argc, char const *argv[]) {
    if (argc == 3) {
        auto source_filename = std::string(argv[1]);
        auto dot_filename = std::string(argv[2]);
        freopen(source_filename.c_str(), "r", stdin);
        yyparse();
        export_parse_tree_to_dot(root_node, dot_filename);
        return 0;
    } else {
        std::cerr << "Error: invalid number of arguments\n";
        return -1;
    }
}
