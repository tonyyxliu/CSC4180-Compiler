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
 * This file defines some utility data structures and functions for tree node.
 * It also includes functions transferring tree into .dot file for graphviz visualization. 
 */

#include "node.hpp"

std::string symbol_class_to_str(const SymbolClass &symbol_class) {
    switch (symbol_class) {
        /* Non-terminal symbols */
        case SymbolClass::program:          return "<program>";
        case SymbolClass::global_decl:      return "<global_decl>";
        case SymbolClass::function_decl:    return "<function_decl>";
        case SymbolClass::var_decls:        return "<var_decls>";
        case SymbolClass::var_decl:         return "<var_decl>";
        case SymbolClass::args:             return "<args>";
        case SymbolClass::arg:              return "<arg>";
        case SymbolClass::ref:              return "<ref>";
        case SymbolClass::global_exps:      return "<global_exps>";
        case SymbolClass::stmts:            return "<stmts>";
        case SymbolClass::exps:             return "<exps>";
        /* CodeGen-Used Non-Terminals */
        case SymbolClass::new_init_value:   return "<new init value>";
        case SymbolClass::new_init_size:    return "<new init size>";
        case SymbolClass::array_index:      return "<array index>";
        case SymbolClass::func_call:        return "<func call>";
        /* Reserved Keywords */
        case SymbolClass::NUL:       return "NULL";
        case SymbolClass::TRUE:      return "TRUE";
        case SymbolClass::FALSE:     return "FALSE";
        case SymbolClass::TVOID:     return "void";
        case SymbolClass::TINT:      return "int";
        case SymbolClass::TSTRING:   return "string";
        case SymbolClass::TBOOL:     return "bool";
        case SymbolClass::IF:        return "IF";
        case SymbolClass::ELSE:      return "ELSE";
        case SymbolClass::WHILE:     return "WHILE";
        case SymbolClass::FOR:       return "FOR";
        case SymbolClass::RETURN:    return "RETURN";
        case SymbolClass::NEW:       return "NEW";
        /* Binary Operators */
        case SymbolClass::STAR:      return "STAR";
        case SymbolClass::PLUS:      return "PLUS";
        case SymbolClass::MINUS:     return "MINUS";
        case SymbolClass::LSHIFT:    return "LSHIFT";
        case SymbolClass::RLSHIFT:   return "RLSHIFT";
        case SymbolClass::RASHIFT:   return "RASHIFT";
        case SymbolClass::LESS:      return "LESS";
        case SymbolClass::LESSEQ:    return "LESSEQ";
        case SymbolClass::GREAT:     return "GREAT";
        case SymbolClass::GREATEQ:   return "GREATEQ";
        case SymbolClass::EQ:        return "EQ";
        case SymbolClass::NEQ:       return "NEQ";
        case SymbolClass::LAND:      return "LAND";
        case SymbolClass::LOR:       return "LOR";
        case SymbolClass::BAND:      return "BAND";
        case SymbolClass::BOR:       return "BOR";
        /* Unary Operators */
        case SymbolClass::NOT:       return "NOT";
        case SymbolClass::TILDE:     return "TILDE";
        /* Other Token Classes */
        case SymbolClass::ASSIGN:    return "ASSIGN";
        case SymbolClass::INTLITERAL:return "INTLITERAL";
        case SymbolClass::ID:        return "ID";
        case SymbolClass::STRINGLITERAL:
                        return "STRINGLITERAL";
        /* Invalid Cases */
        default:        return "Invalid";
    }
}

std::string escape_newlines(const std::string& s) {
    std::string result;
    for (char c : s) {
        if (c == '\n') {
            result += "\\n";
        } else {
            result += c;
        }
    }
    return result;
}

void write_parse_tree(std::ofstream& out, Node* node, int& counter) {
    if (node == nullptr) return;
    // Create a unique identifier for the node
    std::string node_id = "node" + std::to_string(counter++);
    // Write the node
    out << node_id << " [";
    out << "label=\"" << escape_newlines(symbol_class_to_str(node->symbol_class)) << "\"";
    out << ",lexeme=\"" << node->lexeme << "\"";
    out << "];\n";
    // Write connections to children
    for (auto* child : node->children) {
        std::string child_id = "node" + std::to_string(counter);
        write_parse_tree(out, child, counter);
        out << node_id << " -> " << child_id << ";\n";
    }
}

void export_parse_tree_to_dot(Node* root, const std::string& filename) {
    std::ofstream out(filename);
    out << "digraph AST {\n";
    int counter = 0;
    write_parse_tree(out, root, counter);
    out << "}";
}
