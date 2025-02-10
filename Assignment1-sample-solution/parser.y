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
 * This file implements some syntax analysis rules and works as a parser
 * The grammar tree is generated based on the rules and MIPS Code is generated
 * based on the grammar tree and the added structures and functions implemented
 * in File: added_structure_function.c
 */

%{
/* C declarations used in actions */
#include <cstdio>     
#include <cstdlib>
#include <cstring>
#include <string>
#include <vector>
#include <ctype.h>

#include "node.hpp"

int yyerror (char *s);

int yylex();

// // This varaible is external to the flex scanner
// int scan_only = 0;

extern int cst_only;

Node* root_node = nullptr;
%}

// yylval data types
%union {
    struct Node *node;
    std::string *string;
    char id[32]; 
    int integer;
}

// Terminal Symbols
%token <string> BEGIN_ END READ WRITE
%token <string> LPAREN RPAREN SEMICOLON COMMA
%token <string> ASSIGNOP PLUSOP MINUSOP SCANEOF
%token <integer> INTLITERAL
%token <id> ID

// Start Symbol
%start start

// Non-Terminal Symbols
%type <node> program statement_list statement id_list expr_list expression primary

%%
/**
 * Format:
 * Non-Terminal  :  [Non-Terminal, Terminal]+ (production rule 1)   { parser actions in C++ }
 *                  | [Non-Terminal, Terminal]+ (production rule 2) { parser actions in C++ }
 *                  ;
 */
start           : program SCANEOF {
                    if (cst_only) {
                        root_node = new Node(SymbolClass::START);
                        root_node->append_child($1);
                        root_node->append_child(new Node(SymbolClass::SCANEOF, "SCANEOF"));
                    } else {
                        root_node = $1;
                    }
                }
                ;

program         : BEGIN_ statement_list END {
                    if (cst_only) {
                        $$ = new Node(SymbolClass::PROGRAM);
                        $$->append_child(new Node(SymbolClass::BEGIN_, *$1));
                        $$->append_child($2);
                        $$->append_child(new Node(SymbolClass::END, *$3));
                    } else {
                        $$ = new Node(SymbolClass::PROGRAM);
                        $$->append_child($2);
                    }
                }
                ;

statement_list  : statement {
                    if (cst_only) {
                        $$ = new Node(SymbolClass::STATEMENT_LIST);
                        $$->append_child($1);
                    }
                    else {
                        $$ = $1;
                    }
                }
                | statement_list statement {
                    if (cst_only) {
                        $$ = new Node(SymbolClass::STATEMENT_LIST);
                        $$->append_child($1);
                        $$->append_child($2);
                    }
                    else {
                        $$ = new Node(SymbolClass::STATEMENT_LIST);
                        if ($1->should_preserver_in_ast())
                            $$->append_child($1);
                        else {
                            for (auto child : $1->children)
                                $$->append_child(child);
                        }
                        $$->append_child($2);
                    }
                }
                ;

statement       : ID ASSIGNOP expression SEMICOLON {
                    if (cst_only) {
                        $$ = new Node(SymbolClass::STATEMENT);
                        $$->append_child(new Node(SymbolClass::ID, std::string($1)));
                        $$->append_child(new Node(SymbolClass::ASSIGNOP, *$2));
                        $$->append_child($3);
                        $$->append_child(new Node(SymbolClass::SEMICOLON, *$4));
                    }
                    else {
                        $$ = new Node(SymbolClass::ASSIGNOP, *$2);
                        $$->append_child(new Node(SymbolClass::ID, std::string($1)));
                        $$->append_child($3);
                    }
                }
                | READ LPAREN id_list RPAREN SEMICOLON {
                    if (cst_only) {
                        $$ = new Node(SymbolClass::STATEMENT);
                        $$->append_child(new Node(SymbolClass::READ, *$1));
                        $$->append_child(new Node(SymbolClass::LPAREN, *$2));
                        $$->append_child($3);
                        $$->append_child(new Node(SymbolClass::RPAREN, *$4));
                        $$->append_child(new Node(SymbolClass::SEMICOLON, *$5));
                    }
                    else {
                        $$ = new Node(SymbolClass::READ, *$1);
                        if ($3->should_preserver_in_ast()) {
                            $$->append_child($3);
                        }
                        else {
                            for (auto child : $3->children)
                                $$->append_child(child);
                        }
                    }
                }
                | WRITE LPAREN expr_list RPAREN SEMICOLON {
                    if (cst_only) {
                        $$ = new Node(SymbolClass::STATEMENT);
                        $$->append_child(new Node(SymbolClass::WRITE, *$1));
                        $$->append_child(new Node(SymbolClass::LPAREN, *$2));
                        $$->append_child($3);
                        $$->append_child(new Node(SymbolClass::RPAREN, *$4));
                        $$->append_child(new Node(SymbolClass::SEMICOLON, *$5));
                    }
                    else {
                        $$ = new Node(SymbolClass::WRITE, *$1);
                        if ($3->should_preserver_in_ast()) {
                            $$->append_child($3);
                        }
                        else {
                            for (auto child : $3->children)
                                $$->append_child(child);
                        }
                    }
                }
                ;

id_list         : ID {
                    if (cst_only) {
                        $$ = new Node(SymbolClass::ID_LIST);
                        $$->append_child(new Node(SymbolClass::ID, std::string($1)));
                    }
                    else {
                        $$ = new Node(SymbolClass::ID, std::string($1));
                    }
                }
                | ID COMMA id_list {
                    if (cst_only) {
                        $$ = new Node(SymbolClass::ID_LIST);
                        $$->append_child(new Node(SymbolClass::ID, std::string($1)));
                        $$->append_child(new Node(SymbolClass::COMMA, *$2));
                        $$->append_child($3);
                    }
                    else {
                        // Manually set COMMA as a Non-Terminal symbol to ignore in AST
                        $$ = new Node(SymbolClass::COMMA);
                        $$->append_child(new Node(SymbolClass::ID, std::string($1)));
                        if ($3->should_preserver_in_ast())
                            $$->append_child($3);
                        else {
                            for (auto &child : $3->children)
                                $$->append_child(child);
                        }
                    }
                }
                ;

expr_list       : expression {
                    if (cst_only) {
                        $$ = new Node(SymbolClass::EXPRESSION_LIST);
                        $$->append_child($1);
                    }
                    else {
                        $$ = $1;
                    }
                }
                | expr_list COMMA expression {
                    if (cst_only) {
                        $$ = new Node(SymbolClass::EXPRESSION_LIST);
                        $$->append_child($1);
                        $$->append_child(new Node(SymbolClass::COMMA, *$2));
                        $$->append_child($3);
                    }
                    else {
                        // For AST, COMMA is not considered a terminal symbol
                        $$ = new Node(SymbolClass::COMMA);
                        if ($1->should_preserver_in_ast()) {
                            $$->append_child($1);
                        }
                        else {
                            for (auto child : $1->children)
                                $$->append_child(child);
                        }
                        $$->append_child($3);
                    }
                }
                ;

expression      : primary {
                    if (cst_only) {
                        $$ = new Node(SymbolClass::EXPRESSION);
                        $$->append_child($1);
                    }
                    else {
                        $$ = $1;
                    }
                }
                | expression PLUSOP primary {
                    if (cst_only) {
                        $$ = new Node(SymbolClass::EXPRESSION);
                        $$->append_child($1);
                        $$->append_child(new Node(SymbolClass::PLUSOP, *$2));
                        $$->append_child($3);
                    }
                    else {
                        $$ = new Node(SymbolClass::PLUSOP, *$2);
                        $$->append_child($1);
                        $$->append_child($3);
                    }
                }
                | expression MINUSOP primary {
                    if (cst_only) {
                        $$ = new Node(SymbolClass::EXPRESSION);
                        $$->append_child($1);
                        $$->append_child(new Node(SymbolClass::MINUSOP, *$2));
                        $$->append_child($3);
                    }
                    else {
                        $$ = new Node(SymbolClass::MINUSOP, *$2);
                        $$->append_child($1);
                        $$->append_child($3);
                    }
                }
                ;

primary         : ID {
                    if (cst_only) {
                        $$ = new Node(SymbolClass::PRIMARY);
                        $$->append_child(new Node(SymbolClass::ID, std::string($1)));
                    }
                    else {
                        $$ = new Node(SymbolClass::ID, std::string($1));
                    }
                }
                | INTLITERAL {
                    if (cst_only) {
                        $$ = new Node(SymbolClass::PRIMARY);
                        $$->append_child(new Node(SymbolClass::INTLITERAL, std::to_string($1)));
                    }
                    else {
                        $$ = new Node(SymbolClass::INTLITERAL, std::to_string($1));
                    }
                }
                | LPAREN expression RPAREN {
                    if (cst_only) {
                        $$ = new Node(SymbolClass::PRIMARY);
                        $$->append_child(new Node(SymbolClass::LPAREN, *$1));
                        $$->append_child($2);
                        $$->append_child(new Node(SymbolClass::RPAREN, *$3));
                    }
                    else {
                        $$ = $2;
                    }
                }
                ;
%%

int yyerror(char *s) {
	printf("Syntax Error on line %s\n", s);
	return 0;
}
