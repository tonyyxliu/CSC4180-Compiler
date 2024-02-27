/**
 * --------------------------------------
 * CUHK-SZ CSC4180: Compiler Construction
 * Assignment 2: Oat v.1 Scanner
 * --------------------------------------
 * Author: Mr.Liu Yuxuan
 * Position: Teaching Assisant
 * Date: February 27th, 2024
 * Email: yuxuanliu1@link.cuhk.edu.cn
 * 
 * File: tokens.hpp
 * ------------------------------------------------------------
 * This file lists TokenClass enum for each token of Oat v.1 Language
 */

#ifndef TOKENS_HPP
#define TOKENS_HPP

#include <string>

/**
 * Token Specification of Oat v.1 Language
 */
enum TokenClass {
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
    VAR,
    GLOBAL,
    /* Punctuations */
    SEMICOLON,      // ;
    COMMA,          // ,
    LBRACE,         // {
    RBRACE,         // }
    LPAREN,         // (
    RPAREN,         // )
    LBRACKET,       // [
    RBRACKET,       // ]
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
    INTLITERAL,     // 90
    STRINGLITERAL,  // "hello_world"
    COMMENT,        // /* comment */
    NONE,           // Invalid token class, used for State.token_class initialization
};

/**
 * Convert TokenClass enum into string for logging
 * @param token_class
 * @return: corresponding string for the input token class
 */
std::string token_class_to_str(const TokenClass &token_class);

#endif  // TOKENS_HPP
