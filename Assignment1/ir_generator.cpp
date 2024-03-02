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
 * This file defines the LLVM IR Generator class, which generate LLVM IR (.ll) file given the AST from parser.
 */

#include "ir_generator.hpp"

void IR_Generator::export_ast_to_llvm_ir(Node* node) {
    // Declare scanf and printf standard functions
    out << "; Declare printf\n";
    out << "declare i32 @printf(i8*, ...)\n";
    out << "\n";
    out << "; Declare scanf\n";
    out << "declare i32 @scanf(i8*, ...)\n";
    out << "\n";
    // Define main() function body
    out << "define i32 @main() {\n";
    // Recursively generate LLVM IR on AST
    gen_llvm_ir(node);
    out << "\tret i32 0\n";
    out << "}\n";
}

void IR_Generator::gen_llvm_ir(Node* node) {
    // For Non-Terminal Symbol, iterate all its children
    if (!is_terminal_symbol(node->symbol_class)) {
        for (auto child : node->children)
            gen_llvm_ir(child);
        return;
    }
    // For Terminal Symbols, do case-by-case IR generation
    switch (node->symbol_class) {
        case SymbolClass::READ: {
            gen_llvm_ir_for_read(node);
            return;
        }
        case SymbolClass::WRITE: {
            gen_llvm_ir_for_write(node);
            return;
        }
        case SymbolClass::ASSIGNOP: {
            gen_llvm_ir_for_assignment(node);
            return;
        }
        default:
            printf("IR generation for %s is not supported yet.\n");
    }
}

void IR_Generator::gen_llvm_ir_for_read(Node* node) {
    size_t num_children = node->children.size();
    if (num_children == 0) {
        printf("Error: READ must have at least one child\n");
        return;
    }
    // Allocate memory for value to read
    for (auto &child : node->children) {
        if (child->symbol_class != SymbolClass::ID) {
            printf("Error: every child of READ should be an identifier\n");
            return;
        }
        if (initiated_ids.find(child->lexeme) != initiated_ids.end()) {
            std::cerr << "Error: re-initialize ID: " << child->lexeme << "\n";
            return;
        }
        out << "\t" << get_id_reg(child) << " = alloca i32\n";
        initiated_ids.insert(child->lexeme);
    }
    // Allocate memory for format string
    std::string scanf_fmt, scanf_fmt_str;
    std::tie(scanf_fmt, scanf_fmt_str) = get_scanf_format();
    size_t num_format_bytes = 3 * num_children;
    std::string format_data_type = "[" + std::to_string(num_format_bytes) + " x i8]";
    out << "\t"
        << scanf_fmt
        << " = "
        << "alloca " + format_data_type
        << "\n";
    // Write content to format string
    out << "\t"
        << "store " + format_data_type
        << " c\"\%d";
    for (int i = 1; i < num_children; ++i)
        out << " \%d";
    out << "\\00\"";
    out << ", "
        << format_data_type << "* " << scanf_fmt
        << "\n";
    // Get pointer to format string
    out << "\t"
        << scanf_fmt_str
        << " = "
        << "getelementptr " << format_data_type
        << ", " + format_data_type + "* "
        << scanf_fmt
        << ", i32 0"
        << ", i32 0"
        << "\n";
    // Call scanf function
    out << "\t"
        << "call i32 (i8*, ...) @scanf(i8* "
        << scanf_fmt_str;
    for (auto &child : node->children)
        out << ", i32* " << get_id_reg(child);
    out << ")\n";
    // // Load value from val_ptr to ID
    // for (int idx = 0; idx < num_children; ++idx) {
    //     out << "\t"
    //         << get_id_reg(node->children[idx])
    //         << " = load i32, i32* "
    //         << ptr_array[idx]
    //         << "\n";
    // }
    return;
}

void IR_Generator::gen_llvm_ir_for_write(Node* node) {
    size_t num_children = node->children.size();
    if (num_children == 0) {
        printf("Error: WRITE must have at least one child\n");
        return;
    }
    // Allocate memory for format string
    size_t num_format_bytes = 3 * num_children + 1;
    std::string format_data_type = "[" + std::to_string(num_format_bytes) + " x i8]";
    std::string printf_fmt, printf_fmt_str;
    std::tie(printf_fmt, printf_fmt_str) = get_printf_format();
    out << "\t"
        << printf_fmt
        << " = "
        << "alloca " + format_data_type
        << "\n";
    // Write content to format string
    out << "\t"
        << "store " + format_data_type
        << " c\"\%d";
    for (int i = 1; i < num_children; ++i)
        out << " \%d";
    out << "\\0A\\00\"";
    out << ", "
        << format_data_type << "* " << printf_fmt
        << "\n";
    // Get pointer to format string
    out << "\t"
        << printf_fmt_str
        << " = "
        << "getelementptr " << format_data_type
        << ", " + format_data_type + "* "
        << printf_fmt
        << ", i32 0"
        << ", i32 0"
        << "\n";
    // Prepare data array to print
    std::vector<std::string> data_array;
    data_array.reserve(num_children);
    for (auto &child : node->children) {
        switch (child->symbol_class) {
            case SymbolClass::ID: {
                std::string val_reg = get_tmp_reg();
                out << "\t" << val_reg << " = load i32, i32* " << get_id_reg(child) << "\n";
                data_array.push_back(val_reg);
                break;
            }
            case SymbolClass::INTLITERAL:
                data_array.push_back(child->lexeme);
                break;
            case SymbolClass::PLUSOP:
            case SymbolClass::MINUSOP:
                data_array.push_back(gen_llvm_ir_for_plus_minus(child));
                break;
            default:
                std::cerr << "Error: invalid data for printf: " << child->lexeme << "\n";
                return;
        }
    }
    // Call printf function
    out << "\t"
        << "call i32 (i8*, ...) @printf(i8* "
        << printf_fmt_str;
    for (auto &data : data_array)
        out << ", i32 " << data;
    out << ")\n";
    return;
}

void IR_Generator::gen_llvm_ir_for_assignment(Node* node) {
    if (node->children.size() != 2) {
        printf("Error: ASSIGNOP should have only two children\n");
        return;
    }
    std::string lhs;
    std::string rhs;
    switch (node->children[0]->symbol_class) {
        case SymbolClass::ID:
            lhs = get_id_reg(node->children[0]);
            break;
        default:
            printf("Error: ASSIGNOP's left child should be an ID\n");
            return;
    }
    switch (node->children[1]->symbol_class) {
        case SymbolClass::ID: {
            rhs = get_id_reg(node->children[1]);
            break;
        }
        case SymbolClass::INTLITERAL: {
            rhs = node->children[1]->lexeme;
            break;
        }
        case SymbolClass::PLUSOP:
        case SymbolClass::MINUSOP:
            rhs = gen_llvm_ir_for_plus_minus(node->children[1]);
            break;
        default:
            printf("Error: ASSIGNOP's right child is not either ID or INTLITERAL\n");
            return;
    }
    if (initiated_ids.find(node->children[0]->lexeme) == initiated_ids.end()) {
        out << "\t" << get_id_reg(node->children[0]) << " = alloca i32\n";
        initiated_ids.insert(node->children[0]->lexeme);
    }
    out << "\t" << "store i32 " + rhs + ", i32* " + lhs << "\n";
    // std::string tmp_val_ptr = get_val_ptr();
    // out << "\t" << tmp_val_ptr << " = alloca i32\n";
    // out << "\t" << "store i32 " + rhs + ", i32* " + tmp_val_ptr << "\n";
    // out << "\t" << lhs + " = load i32, i32* " + tmp_val_ptr << "\n";
    return;
}

std::string IR_Generator::gen_llvm_ir_for_plus_minus(Node* node) {
    if (node->children.size() != 2) {
        printf("Error: PLUS/MINUS OPs should have only two children\n");
        return "";
    }
    std::string lhs;
    std::string rhs;
    switch (node->children[0]->symbol_class) {
        case SymbolClass::ID:
            lhs = get_tmp_reg();
            out << "\t" << lhs << " = load i32, i32* " << get_id_reg(node->children[0]) << "\n";
            break;
        case SymbolClass::INTLITERAL:
            lhs = node->children[0]->lexeme;
            break;
        case SymbolClass::PLUSOP:
        case SymbolClass::MINUSOP:
            lhs = gen_llvm_ir_for_plus_minus(node->children[0]);
            break;
        default:
            printf("Error: invalid symbol class for PLUSOP children\n");
    }
    switch (node->children[1]->symbol_class) {
        case SymbolClass::ID:
            rhs = get_tmp_reg();
            out << "\t" << rhs << " = load i32, i32* " << get_id_reg(node->children[1]) << "\n";
            break;
        case SymbolClass::INTLITERAL:
            rhs = node->children[1]->lexeme;
            break;
        case SymbolClass::PLUSOP:
        case SymbolClass::MINUSOP:
            rhs = gen_llvm_ir_for_plus_minus(node->children[1]);
            break;
        default:
            printf("Error: invalid symbol class for PLUSOP children\n");
    }
    std::string output_tmp_reg = get_tmp_reg();
    if (node->symbol_class == SymbolClass::PLUSOP) {
        out << "\t"
            << output_tmp_reg
            << " = "
            << "add i32 " + lhs + ", " + rhs
            << "\n";
    }
    else if (node->symbol_class == SymbolClass::MINUSOP) {
        out << "\t"
            << output_tmp_reg
            << " = "
            << "sub i32 " + lhs + ", " + rhs
            << "\n";
    }
    return output_tmp_reg;
}
