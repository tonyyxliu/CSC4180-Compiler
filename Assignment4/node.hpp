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

/**
 * Define all classes of symbols for Micro language,
 * including both tokens (terminal symbols) and non-terminal symbols
 * @note Should not be modified.
 */
enum class SymbolClass {
    /* Non-terminal symbols */
    program,
    global_decl,
    function_decl,
    var_decls,
    var_decl,
    args,
    arg,
    ref,
    global_exps,
    stmts,
    exps,
    new_init_value,
    new_init_size,
    array_index,
    func_call,
    /* Reserved Keywords */
    NUL,
    TRUE,
    FALSE,
    TVOID,          // Type void
    TINT,           // Type int
    TSTRING,        // Type string
    TBOOL,          // Type bool
    IF,
    ELSE,
    WHILE,
    FOR,
    RETURN,
    NEW,
    /* Binary Operators */
    STAR,           // multiplication
    PLUS,           // addition
    MINUS,          // subtraction
    LSHIFT,         // shift left
    RLSHIFT,        // shift right logical
    RASHIFT,        // shift right arithmetic
    LESS,           // less than
    LESSEQ,         // less than or equal to
    GREAT,          // greater than
    GREATEQ,        // greater than or equal to
    EQ,             // equal        ==
    NEQ,            // not equal    !=
    LAND,           // logical AND  &
    LOR,            // logical OR   |
    BAND,           // bitwise AND [&]
    BOR,            // bitwise OR  [|]
    /* Unary Operators */
    // unary MINUS is recognized as MINUS token
    NOT,            // unary NOT    !
    TILDE,          // unary tilde, ~, it takes one number and inverts all bits of it
    /* Other Token Classes */
    ASSIGN,         // =
    ID,             // main, program
    INTLITERAL,     // e.g, 90
    STRINGLITERAL,  // e.g, "hello_world"
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
 * Basic data structure for tree-structure
 */
struct Node {
    SymbolClass symbol_class;
    std::string lexeme;
    std::vector<Node*> children;

    Node(const SymbolClass &symbol, std::string label = "") {
        symbol_class = symbol;
        lexeme = label;
        // exclude enclosing quotes for STRINGLITERAL symbol
        if (symbol_class == SymbolClass::STRINGLITERAL)
            lexeme = lexeme.substr(1, lexeme.length() - 2);
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
};

/**
 * [Recursive] Write tree structure as Dot content and output as file stream
 * @param out: output file stream
 * @param node
 * @param counter: node counter
 * @return
 */
void write_parse_tree(std::ofstream& out, Node* node, int& counter);

/**
 * Export tree structure as a Dot file for visualization
 * It calls the recursive write_parse_tree function.
 * @param root: the root node of the tree to export
 * @param filename: filename to write to
 * @return
 */
void export_parse_tree_to_dot(Node* root, const std::string& filename);

#endif  // CSC4180_NODE_HPP
