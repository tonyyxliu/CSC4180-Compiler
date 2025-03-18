
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
 * File: main.cpp
 * -----------------------------
 * This file asks the user to input a file name and generates its tokens
 */

#include "scanner.hpp"

unsigned int DFA::State::increment_id = 1;
unsigned int NFA::State::increment_id = 1;

int main(int argc, char const *argv[]) {
    if (argc == 2) {
        std::string filename = argv[1];
        auto scanner = Scanner();
        /* Reserved Keywords Tokens */
        scanner.add_token("for", FOR);
        scanner.add_token("while", WHILE);
        scanner.add_token("if", IF);
        scanner.add_token("else", ELSE);
        scanner.add_token("new", NEW);
        scanner.add_token("var", VAR);
        scanner.add_token("global", GLOBAL);
        scanner.add_token("return", RETURN);
        scanner.add_token("int", TINT);
        scanner.add_token("bool", TBOOL);
        scanner.add_token("string", TSTRING);
        /* Punctuations and Brackets */
        scanner.add_token("(", LPAREN);
        scanner.add_token(")", RPAREN);
        scanner.add_token("[", LBRACKET);
        scanner.add_token("]", RBRACKET);
        scanner.add_token("{", LBRACE);
        scanner.add_token("}", RBRACE);
        scanner.add_token(";", SEMICOLON);
        scanner.add_token(",", COMMA);
        scanner.add_token("true", TRUE);
        scanner.add_token("false", FALSE);
        /* Binary Operators */
        scanner.add_token("*", STAR, 100);
        scanner.add_token("+", PLUS, 90);
        scanner.add_token("-", MINUS, 90);
        scanner.add_token("<<", LSHIFT, 80);
        scanner.add_token(">>", RLSHIFT, 80);
        scanner.add_token(">>>", RASHIFT, 80);
        scanner.add_token("<", LESS, 70);
        scanner.add_token("<=", LESSEQ, 70);
        scanner.add_token(">", GREAT, 70);
        scanner.add_token(">=", GREATEQ, 70);
        scanner.add_token("==", EQ, 60);
        scanner.add_token("!=", NEQ, 60);
        scanner.add_token("!", NOT, 60);
        scanner.add_token("&", LAND, 50);
        scanner.add_token("|", LOR, 40);
        scanner.add_token("~", TILDE, 35);
        scanner.add_token("[&]", BAND, 30);
        scanner.add_token("[|]", BOR, 20);
        /* Other Token Classes */
        scanner.add_token("=", ASSIGN);
        scanner.add_identifier_token(ID);
        scanner.add_integer_token(INTLITERAL);
        scanner.add_string_token(STRINGLITERAL);
        scanner.add_comment_token(COMMENT);
        // scanner.print_nfa();
        scanner.NFA_to_DFA();
        // scanner.print_dfa();
        scanner.scan(filename);
    } else {
        std::cout << "Please input the file name of Oat v.1 source program." << std::endl;
    }

    return 0;
}
