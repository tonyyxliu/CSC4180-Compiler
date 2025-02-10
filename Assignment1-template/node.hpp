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

#ifndef CSC4180_NODE_HPP
#define CSC4180_NODE_HPP

#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include "parser.hpp"

/**
 * Define all classes of symbols for Micro language,
 * including both tokens (terminal symbols) and non-terminal symbols
 * @note Should not be modified.
 */
enum class SymbolClass {
    // 14 terminal symbols (token classes)
    BEGIN_,
    END,
    READ,
    WRITE,
    LPAREN,
    RPAREN,
    SEMICOLON,
    COMMA,
    ASSIGNOP,
    PLUSOP,
    MINUSOP,
    SCANEOF,
    INTLITERAL,
    ID,
    // 8 non-terminal symbols
    START,
    PROGRAM,
    STATEMENT_LIST,
    STATEMENT,
    ID_LIST,
    EXPRESSION_LIST,
    EXPRESSION,
    PRIMARY,
};

/**
 * Translate symbol class into a string
 * used to visualize both concrete and abstract syntax tree
 * @param symbol_class
 * @return the string expression of the given symbol class
 * @note This file should not be modified. Otherwise, you may fail to pass the test.
 */
std::string symbol_class_to_str(const SymbolClass &symbol_class);

/**
 * Determine whether a symbol is terminal or non-terminal
 * @param symbol_class
 * @return true if the symbol is terminal and false if it is non-terminal
 * @note should not be modified
 */
bool is_terminal_symbol(const SymbolClass &symbol_class);

/**
 * Determine if the symbol should be preserved in output AST
 * Even among terminal symbols, some tokens should not appear in the AST, like SEMICOLON, BEGIN, END, and etc
 * Some non-terminal symbols are needed in AST since Micro language has no grammar about function
 * @param symbol_class
 * @return whether the symbol should be preserved in AST
 * @note should not be modified
 */
bool is_preserved_symbol_for_ast(const SymbolClass &symbol_class);

/**
 * Basic data structure for tree-structure
 */
struct Node {
    SymbolClass symbol_class;
    std::string lexeme;
    std::vector<Node*> children;

    Node(const SymbolClass &symbol, std::string label = "") {
        symbol_class = symbol;
        lexeme = is_terminal_symbol(symbol) ? label : symbol_class_to_str(symbol);
        children.resize(0);
    }

    /**
     * Append a child node to the children vector
     * @param child: pointer of the child node to append
     * @return
     */
    void append_child(Node* child) {
        this->children.push_back(child);
    }

    /**
     * Determine whether the node should preserve in ASI
     * totally dependens on the symbol class
     * @return true if it should be preserved and false otherwise
     */
    bool should_preserver_in_ast() {
        return is_preserved_symbol_for_ast(symbol_class);
    }
};

/**
 * [Recursive] Write tree structure as Dot content and output as file stream
 * @param out: output file stream
 * @param node
 * @param counter: node counter
 * @return
 */
void write_parse_tree(std::ofstream& out, Node* node, int& counter, bool export_lexeme);

/**
 * Export tree structure as a Dot file for visualization
 * It calls the recursive write_parse_tree function.
 * @param root: the root node of the tree to export
 * @param filename: filename to write to
 * @param export_lexeme: true to export lexeme and false to export token class when dumping tree to dot
 * @return
 */
void export_parse_tree_to_dot(Node* root, const std::string& filename, bool export_lexeme);

#endif  // CSC4180_NODE_HPP
