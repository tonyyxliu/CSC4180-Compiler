/**
 * --------------------------------------
 * CUHK-SZ CSC4180: Compiler Construction
 * Assignment 4: Oat v.1 Compiler Frontend
 * --------------------------------------
 * Author: Mr.Liu Yuxuan
 * Position: Teaching Assisant
 * Date: April 13th, 2024
 * Email: yuxuanliu1@link.cuhk.edu.cn
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

extern int yylineno;

int yyerror (char *s);

int yylex();

Node* root_node = nullptr;

%}

// yylval data types
%union {
    struct Node *node;
    std::string *string;
    int integer;
}

// Terminal Symbols
%token NUL TRUE_ FALSE_ TVOID TINT TSTRING TBOOL
%token IF ELSE WHILE FOR RETURN NEW VAR GLOBAL SCANEOF
%token SEMICOLON COMMA ASSIGN
%token <integer> INTLITERAL
%token <string> STRINGLITERAL ID

// Binary Operator Symbols
// precedence declaration from low to high
%left LPAREN RPAREN
%left LBRACKET RBRACKET
%left LBRACE RBRACE
%left BOR                          // precedence: 20
%left BAND                         // precedence: 30
%left LOR                          // precedence: 40
%left LAND                         // precedence: 50
%left EQ NEQ                       // precedence: 60
%left LESS LESSEQ GREAT GREATEQ    // precedence: 70
%left LSHIFT RLSHIFT RASHIFT       // precedence: 80
%left PLUS MINUS                   // precedence: 90
%left STAR                         // precedence: 100, left associative

// Unary Operator Symbols
%left UMINUS                       // unary MINUS. Unary operators should have higher precedence than binary operators, otherwise, shift-reduce conflicts occur
%token NOT
%token TILDE

// Start Symbol
%start start

// Non-Terminal Symbols
%type <node> program decl global_decl function_decl var_decl var_decls var_decls_follow

%type <node> exp exp_opt exps exps_follow global_exp global_exps global_exps_follow

%type <node> arg args args_follow block stmt stmt_opt stmts lhs if_stmt else_stmt type ref

%%

/**
 * Format:
 * Non-Terminal  :  [Non-Terminal, Terminal]+ (production rule 1)   { parser actions in C++ }
 *                  | [Non-Terminal, Terminal]+ (production rule 2) { parser actions in C++ }
 *                  ;
 */
start           : program SCANEOF { root_node = $1; };

program         : %empty { $$ = nullptr; }
                | decl program {
                    // flatten the AST
                    $$ = new Node(SymbolClass::program);
                    $$->append_child($1);
                    if ($2 != nullptr) {
                        for (auto child : $2->children)
                            $$->append_child(child);
                    }
                };

decl            : global_decl { $$ = $1; }
                | function_decl { $$ = $1; };

global_decl     : GLOBAL ID ASSIGN global_exp SEMICOLON {
                    $$ = new Node(SymbolClass::global_decl);
                    $$->append_child(new Node(SymbolClass::ID, *$2));
                    $$->append_child($4);
                };

function_decl   : type ID LPAREN args RPAREN block {
                    $$ = new Node(SymbolClass::function_decl);
                    $$->append_child($1);
                    $$->append_child(new Node(SymbolClass::ID, *$2));
                    $$->append_child($4);
                    $$->append_child($6);
                };

arg             : type ID {
                    $$ = new Node(SymbolClass::arg);
                    $$->append_child($1);
                    $$->append_child(new Node(SymbolClass::ID, *$2));
                };

args            : %empty { $$ = new Node(SymbolClass::args); }
                | arg args_follow {
                    $$ = new Node(SymbolClass::args);
                    $$->append_child($1);
                    if ($2 != nullptr) {
                        for (auto child : $2->children)
                            $$->append_child(child);
                    }
                };

args_follow     : %empty { $$ = nullptr; }
                | COMMA arg args_follow {
                    $$ = new Node(SymbolClass::args);
                    $$->append_child($2);
                    if ($3 != nullptr) {
                        for (auto child : $3->children)
                            $$->append_child(child);
                    }
                };

block           : LBRACE stmts RBRACE { $$ = $2; };

stmts           : %empty { $$ = new Node(SymbolClass::stmts); }
                | stmt stmts {
                    $$ = new Node(SymbolClass::stmts);
                    $$->append_child($1);
                    if ($2 != nullptr) {
                        for (auto child : $2->children)
                            $$->append_child(child);
                    }
                };

type            : TINT { $$ = new Node(SymbolClass::TINT); }
                | TBOOL { $$ = new Node(SymbolClass::TBOOL); }
                | ref { $$ = $1; };

ref             : TSTRING { $$ = new Node(SymbolClass::TSTRING); }
                | type LBRACKET RBRACKET {
                    $$ = new Node(SymbolClass::ref);
                    $$->append_child($1);
                };

global_exps     : %empty { $$ = nullptr; }
                | global_exp global_exps_follow {
                    $$ = new Node(SymbolClass::global_exps);
                    $$->append_child($1);
                    if ($2 != nullptr) {
                        for (auto child : $2->children)
                            $$->append_child(child);
                    }
                };

global_exps_follow  : %empty { $$ = nullptr; }
                    | COMMA global_exp global_exps_follow {
                        $$ = new Node(SymbolClass::global_exps);
                        $$->append_child($2);
                        if ($3 != nullptr) {
                            for (auto child : $3->children)
                                $$->append_child(child);
                        }
                    };

global_exp      : INTLITERAL { $$ = new Node(SymbolClass::INTLITERAL, std::to_string($1)); }
                | STRINGLITERAL { $$ = new Node(SymbolClass::STRINGLITERAL, *$1); }
                | TRUE_ { $$ = new Node(SymbolClass::TRUE); }
                | FALSE_ { $$ = new Node(SymbolClass::FALSE); }
                | type NUL {
                    $$ = new Node(SymbolClass::NUL);
                    $$->append_child($1);
                }
                | NEW type LBRACKET RBRACKET LBRACE global_exps RBRACE {
                    $$ = new Node(SymbolClass::NEW);
                    $$->append_child($2);
                    $$->append_child($6);
                };

stmt            : lhs ASSIGN exp SEMICOLON {
                    $$ = new Node(SymbolClass::ASSIGN);
                    $$->append_child($1);
                    $$->append_child($3);
                }
                | var_decl SEMICOLON { $$ = $1; }
                | RETURN exp SEMICOLON {
                    $$ = new Node(SymbolClass::RETURN);
                    $$->append_child($2);
                }
                | RETURN SEMICOLON { $$ = new Node(SymbolClass::RETURN); }
                | ID LPAREN exps RPAREN SEMICOLON {
                    $$ = new Node(SymbolClass::func_call);
                    $$->append_child(new Node(SymbolClass::ID, *$1));
                    $$->append_child($3);
                }
                | if_stmt { $$ = $1; }
                | FOR LPAREN var_decls SEMICOLON exp_opt SEMICOLON stmt_opt RPAREN block {
                    $$ = new Node(SymbolClass::FOR);
                    $$->append_child($3);
                    $$->append_child($5);
                    $$->append_child($7);
                    $$->append_child($9);
                }
                | WHILE LPAREN exp RPAREN block {
                    $$ = new Node(SymbolClass::WHILE);
                    $$->append_child($3);
                    $$->append_child($5);
                };

stmt_opt       : %empty { $$ = nullptr; }
                | stmt { $$ = $1; };

exp_opt         : %empty { $$ = nullptr; }
                | exp { $$ = $1; };

if_stmt         : IF LPAREN exp RPAREN block else_stmt {
                    $$ = new Node(SymbolClass::IF);
                    $$->append_child($3);
                    $$->append_child($5);
                    auto else_node = new Node(SymbolClass::ELSE);
                    else_node->append_child($6);
                    $$->append_child(else_node);
                };

else_stmt       : %empty { $$ = nullptr; }
                | ELSE block { $$ = $2; }
                | ELSE if_stmt { $$ = $2; };

lhs             : ID { $$ = new Node(SymbolClass::ID, *$1); }
                | exp LBRACKET exp RBRACKET {
                    $$ = new Node(SymbolClass::array_index);
                    $$->append_child($1);
                    $$->append_child($3);
                };

var_decls       : %empty { $$ = nullptr; }
                | var_decl var_decls_follow {
                    $$ = new Node(SymbolClass::var_decls);
                    $$->append_child($1);
                    if ($2 != nullptr) {
                        for (auto child : $2->children)
                            $$->append_child(child);
                    }
                };

var_decls_follow    : %empty { $$ = nullptr; }
                    | COMMA var_decl var_decls_follow {
                        $$ = new Node(SymbolClass::var_decls);
                        $$->append_child($2);
                        if ($3 == nullptr) {
                            for (auto child : $3->children)
                                $$->append_child(child);
                        }
                    };

var_decl        : VAR ID ASSIGN exp {
                    $$ = new Node(SymbolClass::var_decl);
                    $$->append_child(new Node(SymbolClass::ID, *$2));
                    $$->append_child($4);
                };

exps            : %empty { $$ = nullptr; }
                | exp exps_follow {
                    $$ = new Node(SymbolClass::exps);
                    $$->append_child($1);
                    if ($2 != nullptr) {
                        for (auto child : $2->children)
                            $$->append_child(child);
                    }
                };

exps_follow     : %empty { $$ = nullptr; }
                | COMMA exp exps_follow {
                    $$ = new Node(SymbolClass::exps);
                    $$->append_child($2);
                    if ($3 != nullptr) {
                        for (auto child : $3->children)
                            $$->append_child(child);
                    }
                };

exp             : ID { $$ = new Node(SymbolClass::ID, *$1); }
                | INTLITERAL { $$ = new Node(SymbolClass::INTLITERAL, std::to_string($1)); }
                | STRINGLITERAL { $$ = new Node(SymbolClass::STRINGLITERAL, *$1); }
                | TRUE_ { $$ = new Node(SymbolClass::TRUE); }
                | FALSE_ { $$ = new Node(SymbolClass::FALSE); }
                | type NUL {
                    $$ = new Node(SymbolClass::NUL);
                    $$->append_child($1);
                }
                | ID LPAREN exps RPAREN {
                    $$ = new Node(SymbolClass::func_call);
                    $$->append_child(new Node(SymbolClass::ID, *$1));
                    $$->append_child($3);
                }
                | NEW type LBRACKET RBRACKET LBRACE exps RBRACE {
                    $$ = new Node(SymbolClass::new_init_value);
                    $$->append_child($2);
                    $$->append_child($6);
                }
                | NEW type LBRACKET exp RBRACKET {
                    $$ = new Node(SymbolClass::new_init_size);
                    $$->append_child($2);
                    $$->append_child($4);
                }
                | LPAREN exp RPAREN { $$ = $2; }
                | exp LBRACKET exp RBRACKET {
                    $$ = new Node(SymbolClass::array_index);
                    $$->append_child($1);
                    $$->append_child($3);
                }
                | exp STAR exp {
                    $$ = new Node(SymbolClass::STAR);
                    $$->append_child($1);
                    $$->append_child($3);
                }
                | exp PLUS exp {
                    $$ = new Node(SymbolClass::PLUS);
                    $$->append_child($1);
                    $$->append_child($3);
                }
                | exp MINUS exp {
                    $$ = new Node(SymbolClass::MINUS);
                    $$->append_child($1);
                    $$->append_child($3);
                }
                | exp LSHIFT exp {
                    $$ = new Node(SymbolClass::LSHIFT);
                    $$->append_child($1);
                    $$->append_child($3);
                }
                | exp RLSHIFT exp {
                    $$ = new Node(SymbolClass::RLSHIFT);
                    $$->append_child($1);
                    $$->append_child($3);
                }
                | exp RASHIFT exp {
                    $$ = new Node(SymbolClass::RASHIFT);
                    $$->append_child($1);
                    $$->append_child($3);
                }
                | exp LESS exp {
                    $$ = new Node(SymbolClass::LESS);
                    $$->append_child($1);
                    $$->append_child($3);
                }
                | exp LESSEQ exp {
                    $$ = new Node(SymbolClass::LESSEQ);
                    $$->append_child($1);
                    $$->append_child($3);
                }
                | exp GREAT exp {
                    $$ = new Node(SymbolClass::GREAT);
                    $$->append_child($1);
                    $$->append_child($3);
                }
                | exp GREATEQ exp {
                    $$ = new Node(SymbolClass::GREATEQ);
                    $$->append_child($1);
                    $$->append_child($3);
                }
                | exp EQ exp {
                    $$ = new Node(SymbolClass::EQ);
                    $$->append_child($1);
                    $$->append_child($3);
                }
                | exp NEQ exp {
                    $$ = new Node(SymbolClass::NEQ);
                    $$->append_child($1);
                    $$->append_child($3);
                }
                | exp LAND exp {
                    $$ = new Node(SymbolClass::LAND);
                    $$->append_child($1);
                    $$->append_child($3);
                }
                | exp LOR exp {
                    $$ = new Node(SymbolClass::LOR);
                    $$->append_child($1);
                    $$->append_child($3);
                }
                | exp BAND exp {
                    $$ = new Node(SymbolClass::BAND);
                    $$->append_child($1);
                    $$->append_child($3);
                }
                | exp BOR exp {
                    $$ = new Node(SymbolClass::BOR);
                    $$->append_child($1);
                    $$->append_child($3);
                }
                | MINUS exp %prec UMINUS {
                    // For MINUS token, if it has two children in AST, then it's a binary operator
                    // if it only has one child in AST, it is an unary operator.
                    $$ = new Node(SymbolClass::MINUS);
                    $$->append_child($2);
                }
                | NOT exp %prec UMINUS {
                    $$ = new Node(SymbolClass::NOT);
                    $$->append_child($2);
                }
                | TILDE exp %prec UMINUS {
                    $$ = new Node(SymbolClass::TILDE);
                    $$->append_child($2);
                };
%%

int yyerror(char *msg) {
	std::cerr << "Syntax Error on line " << yylineno << ": " << msg << "\n";
	return 0;
}
