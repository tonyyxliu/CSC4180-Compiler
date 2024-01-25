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
        // 14 terminal symbols, noted in upper-case
        case SymbolClass::BEGIN_:           return "BEGIN_";
        case SymbolClass::END:              return "END";
        case SymbolClass::READ:             return "READ";
        case SymbolClass::WRITE:            return "WRITE";
        case SymbolClass::LPAREN:           return "LPAREN";
        case SymbolClass::RPAREN:           return "RPAREN";
        case SymbolClass::SEMICOLON:        return "SEMICOLON";
        case SymbolClass::COMMA:            return "COMMA";
        case SymbolClass::ASSIGNOP:         return "ASSIGNOP";
        case SymbolClass::PLUSOP:           return "PLUSOP";
        case SymbolClass::MINUSOP:          return "MINUSOP";
        case SymbolClass::INTLITERAL:       return "INTLITERAL";
        case SymbolClass::ID:               return "ID";
        case SymbolClass::SCANEOF:          return "SCANEOF";
        // 8 non-terminal symbols, noted in <> and lower-case
        case SymbolClass::START:            return "<start>";
        case SymbolClass::PROGRAM:          return "<program>";
        case SymbolClass::STATEMENT_LIST:   return "<statement list>";
        case SymbolClass::STATEMENT:        return "<statement>";
        case SymbolClass::ID_LIST:          return "<id list>";
        case SymbolClass::EXPRESSION_LIST:  return "<expression list>";
        case SymbolClass::EXPRESSION:       return "<expression>";
        case SymbolClass::PRIMARY:          return "<primary>";
    }
}

bool is_terminal_symbol(const SymbolClass &symbol_class) {
    switch (symbol_class) {
        case SymbolClass::BEGIN_:
        case SymbolClass::END:
        case SymbolClass::READ:
        case SymbolClass::WRITE:
        case SymbolClass::LPAREN:
        case SymbolClass::RPAREN:
        case SymbolClass::SEMICOLON:
        case SymbolClass::COMMA:
        case SymbolClass::ASSIGNOP:
        case SymbolClass::PLUSOP:
        case SymbolClass::MINUSOP:
        case SymbolClass::SCANEOF:
        case SymbolClass::INTLITERAL:
        case SymbolClass::ID:
            return true;
        case SymbolClass::START:
        case SymbolClass::PROGRAM:
        case SymbolClass::STATEMENT_LIST:
        case SymbolClass::STATEMENT:
        case SymbolClass::ID_LIST:
        case SymbolClass::EXPRESSION_LIST:
        case SymbolClass::EXPRESSION:
        case SymbolClass::PRIMARY:
            return false;
    }
}

bool is_preserved_symbol_for_ast(const SymbolClass &symbol_class) {
    switch (symbol_class) {
        case SymbolClass::READ:
        case SymbolClass::WRITE:
        case SymbolClass::INTLITERAL:
        case SymbolClass::ID:
        case SymbolClass::ASSIGNOP:
        case SymbolClass::PLUSOP:
        case SymbolClass::MINUSOP:
            return true;
        case SymbolClass::BEGIN_:
        case SymbolClass::END:
        case SymbolClass::LPAREN:
        case SymbolClass::RPAREN:
        case SymbolClass::SEMICOLON:
        case SymbolClass::COMMA:
        case SymbolClass::SCANEOF:
        case SymbolClass::START:
        case SymbolClass::PROGRAM:
        case SymbolClass::STATEMENT_LIST:
        case SymbolClass::STATEMENT:
        case SymbolClass::ID_LIST:
        case SymbolClass::EXPRESSION_LIST:
        case SymbolClass::EXPRESSION:
        case SymbolClass::PRIMARY:
            return false;
    }
}

void write_parse_tree(std::ofstream& out, Node* node, int& counter, bool export_lexeme) {
    if (node == nullptr) return;
    // Create a unique identifier for the node
    std::string node_id = "node" + std::to_string(counter++);
    // Write the node
    out << node_id
        << " [label=\""
        << ((export_lexeme) ? node->lexeme : symbol_class_to_str(node->symbol_class))
        << "\"];\n";
    // Write connections to children
    for (auto* child : node->children) {
        std::string child_id = "node" + std::to_string(counter);
        write_parse_tree(out, child, counter, export_lexeme);
        out << node_id << " -> " << child_id << ";\n";
    }
}

void export_parse_tree_to_dot(Node* root, const std::string& filename, bool export_lexeme) {
    std::cout << "export parse tree filename: " << filename << "\n";
    std::ofstream out(filename);
    out << "digraph AST {\n";
    int counter = 0;
    write_parse_tree(out, root, counter, export_lexeme);
    out << "}";
}
