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

#include <boost/program_options.hpp>

#include "node.hpp"
#include "ir_generator.hpp"

int scan_only = 0;
int cst_only = 0;

extern int yyparse();
extern int yylex();
extern Node* root_node;

namespace po = boost::program_options;

int main(int argc, char const *argv[]) {
    po::options_description desc(
R"(CUHK-SZ CSC4180 Assignment-1: Micro Language Compiler Frontend
Usage: Usage: compiler [options] source-program.m
Allowed options: )");
    desc.add_options()
        ("help,h", R"(Usage: Usage: compiler [options] source-program.m)")
        ("scan-only,s",
            "[Default: false] print out token class and lexeme pairs for each token, no parsing operations onwards")
        ("cst-only,c",
            "[Default: false] generate concrete syntax tree only, do not generate AST and LLVM IR")
        ("dot,d",
            po::value<std::string>()->default_value("ast.dot"),
            "[Default: ast.dot] the .dot filename where compiler will output the tree")
        ("output,o",
            po::value<std::string>()->default_value("program.ll"),
            "[Default: program.ll] LLVM IR file compiled from source code")
        ("source-program", po::value<std::string>(), "source Micro program to compile");
    // Positional arguments
    po::positional_options_description p;
    p.add("source-program", -1);
    // Variable Map
    po::variables_map vm;
    std::string dot_filename;
    std::string ir_filename;
    std::string source_filename;
    try {
        po::store(po::command_line_parser(argc, argv).options(desc).positional(p).run(), vm);
        po::notify(vm);
    } catch (const po::error &ex) {
        std::cerr << ex.what() << '\n';
        return 1;
    }
    if (vm.count("help")) {
        std::cout << desc << "\n";
        return 0;
    }
    if (vm.count("cst-only")) cst_only = 1;
    if (vm.count("dot"))
        dot_filename = vm["dot"].as<std::string>();
    if (vm.count("output"))
        ir_filename = vm["output"].as<std::string>();
    if (vm.count("source-program"))
        source_filename = vm["source-program"].as<std::string>();
    else {
        std::cerr << "No source program file provided.\n";
        return -1;
    }
    freopen(source_filename.c_str(), "r", stdin);
    if (vm.count("scan-only")) {
        scan_only = 1;      // set this flag to enable flex scanner to print out token info
        while (yylex());    // keep extracting tokens from flex scanner
        return 0;
    }
    yyparse();
    // Dump token class for CST and lexeme for AST
    export_parse_tree_to_dot(root_node, dot_filename, vm.count("cst-only") ? false : true);
    // cst-only should not pursue IR Generation
    if (vm.count("cst-only")) return 0;
    std::ofstream ir_output = std::ofstream(ir_filename);
    auto ir_generator = new IR_Generator(ir_output);
    ir_generator->export_ast_to_llvm_ir(root_node);
    delete ir_generator;
    return 0;
}
