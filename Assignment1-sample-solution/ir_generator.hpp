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
 * This file defines the LLVM IR Generator class, which generate LLVM IR file (.ll) given the AST from parser.
 */

#ifndef CSC4180_IR_GENERATOR_HPP
#define CSC4180_IR_GENERATOR_HPP

#include <iostream>
#include <tuple>
#include <unordered_set>

#include "node.hpp"

/**
 * LLVM IR Generator of Micro Language
 * It takes the AST generated from parser and generate LLVM IR instructions.
 */
class IR_Generator {
public:
    IR_Generator(std::ofstream &output)
        : out(output) {}

    /**
     * Export AST to LLVM IR file
     * @param node: root node of an AST
     * @return
     */
    void export_ast_to_llvm_ir(Node* node);

private:
    /**
     * Recursively generate LLVM IR of the given AST tree node
     * @param node: root node of an AST
     * @return
     */
    void gen_llvm_ir(Node* node);

    void gen_llvm_ir_for_read(Node* node);

    void gen_llvm_ir_for_write(Node* node);

    void gen_llvm_ir_for_assignment(Node* node);

    std::string gen_llvm_ir_for_plus_minus(Node* node);

private:
    /**
     * Get the pesudo register for an identifier
     * @param node
     * @return name of the pesudo register in LLVM (%ID)
     */
    inline std::string get_id_reg(Node* node) {
        return "\%" + node->lexeme;
    }

    inline std::string get_tmp_reg() {
        ++tmp_reg_idx;
        return "\%_tmp_" + std::to_string(tmp_reg_idx);
    }

    inline std::string get_val_ptr() {
        ++val_ptr_idx;
        return "\%_val_ptr_" + std::to_string(val_ptr_idx);
    }

    inline std::tuple<std::string, std::string> get_scanf_format() {
        // std::tuple<std::string, std::string> format = std::make_tuple(
        //     "\%_scanf_format_" + std::to_string(scanf_idx),
        //     "\%_scanf_str_" + std::to_string(scanf_idx)
        // );
        // return format;
        ++scanf_idx;
        return std::make_tuple(
            "\%_scanf_format_" + std::to_string(scanf_idx),
            "\%_scanf_str_" + std::to_string(scanf_idx)
        );
    }

    inline std::tuple<std::string, std::string> get_printf_format() {
        ++printf_idx;
        return std::make_tuple(
            "\%_printf_format_" + std::to_string(printf_idx),
            "\%_printf_str_" + std::to_string(printf_idx)
        );
    }

private:
    std::ofstream &out;
    std::unordered_set<std::string> initiated_ids;
    int tmp_reg_idx = 0;
    int val_ptr_idx = 0;
    int scanf_idx = 0;
    int scanf_val_ptr_idx = 0;
    int printf_idx = 0;

};

#endif  // CSC4180_IR_GENERATOR_HPP
