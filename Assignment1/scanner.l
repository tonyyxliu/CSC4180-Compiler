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
 * This file implements some lexical analysis rules to scan the input file 
 * and return the tokens which will be used for parser 
 */

%{
/* C/C++ Stuff (headers, declarations, variables, etc.) */
#include <cstdio>
#include <string>
#include <vector>
#include "parser.hpp"
#include "node.hpp"

int yyerror (char *s);

int yylex();

int end = 0;

/**
 * scan_only indicates whehter the flex scanner should print out the token information for debug.
 * The token information is in the following form:
 *   <token-class, lexeme>
 */
extern int scan_only;
%}

integer -?[0-9]+
id [a-zA-Z][a-zA-Z0-9_]{0,31}
comment --(.)*\n

%%
"begin" {
    if (scan_only) printf("BEGIN_ %s\n", yytext);
    yylval.string = new std::string(yytext, yyleng);
    return BEGIN_;
}

"end" {
    if (scan_only) printf("END %s\n", yytext);
    yylval.string = new std::string(yytext, yyleng);
    return END;
}

"read" {
    if (scan_only) printf("READ %s\n", yytext);
    yylval.string = new std::string(yytext, yyleng);
    return READ;
}

"write" {
    if (scan_only) printf("WRITE %s\n", yytext);
    yylval.string = new std::string(yytext, yyleng);
    return WRITE;
}

{integer} {
    if (scan_only) printf("INTLITERAL %s\n", yytext);
    yylval.integer = atoi(yytext);
    return INTLITERAL;
}

{id} {
    if (scan_only) printf("ID %s\n", yytext);
    sscanf(yytext, "%s", yylval.id);
    return ID;
}

"(" {
    if (scan_only) printf("LPAREN %s\n", yytext);
    yylval.string = new std::string(yytext, yyleng);
    return LPAREN;
}

")" {
    if (scan_only) printf("RPAREN %s\n", yytext);
    yylval.string = new std::string(yytext, yyleng);
    return RPAREN;
}

";" {
    if (scan_only) printf("SEMICOLON %s\n", yytext);
    yylval.string = new std::string(yytext, yyleng);
    return SEMICOLON;
}

"," {
    if (scan_only) printf("COMMA %s\n", yytext);
    yylval.string = new std::string(yytext, yyleng);
    return COMMA;
}

":=" {
    if (scan_only) printf("ASSIGNOP %s\n", yytext);
    yylval.string = new std::string(yytext, yyleng);
    return ASSIGNOP;
}

"+" {
    if (scan_only) printf("PLUSOP %s\n", yytext);
    yylval.string = new std::string(yytext, yyleng);
    return PLUSOP;
}

"-" {
    if (scan_only) printf("MINUSOP %s\n", yytext);
    yylval.string = new std::string(yytext, yyleng);
    return MINUSOP;
}

<<EOF>> {
    if (!end) {
        end = 1;
        if (scan_only) printf("SCANEOF\n");
        return SCANEOF;
    }
    yyterminate();
}

{comment}   { /* Do nothing */ }

[ \t\n]     { /* Do nothing */ }

. { if (scan_only) printf("Unknown symbol %s\n", yytext); }

%%

int yywrap (void) {return 1;}
