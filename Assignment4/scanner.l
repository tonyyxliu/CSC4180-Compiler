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
 * File: lexer.l
 * -----------------------------
 * This file implements some lexical analysis rules to scan the input file 
 * and return the tokens which will be used later for parser
 */

%{
/* C/C++ Stuff (headers, declarations, variables, etc.) */
#include <cstdio>
#include <string>
#include <vector>

#include "parser.hpp"
// #include "node.hpp"

int yyerror (char *s);

int yylex();

bool end = false;       // indicates whether the input reaches the end

%}

id [a-zA-Z][a-zA-Z0-9_]*
comment \/\*([^*]|\*+[^*/])*\*+\/
intliteral [0-9]+
stringliteral \"[^"]*\"

%%
"null" {
    printf("NULL %s\n", yytext);
    return NUL;
}

"true" {
    printf("TRUE %s\n", yytext);
    return TRUE_;
}

"false" {
    printf("FALSE %s\n", yytext);
    return FALSE_;
}

"void" {
    printf("TVOID %s\n", yytext);
    return TVOID;
}

"int" {
    printf("TINT %s\n", yytext);
    return TINT;
}

"string" {
    printf("TSTRING %s\n", yytext);
    return TSTRING;
}

"bool" {
    printf("TBOOL %s\n", yytext);
    return TBOOL;
}

"if" {
    printf("IF %s\n", yytext);
    return IF;
}

"else" {
    printf("ELSE %s\n", yytext);
    return ELSE;
}

"while" {
    printf("WHILE %s\n", yytext);
    return WHILE;
}

"for" {
    printf("FOR %s\n", yytext);
    return FOR;
}

"return" {
    printf("RETURN %s\n", yytext);
    return RETURN;
}

"new" {
    printf("NEW %s\n", yytext);
    return NEW;
}

"var" {
    printf("VAR %s\n", yytext);
    return VAR;
}

"global" {
    printf("GLOBAL %s\n", yytext);
    return GLOBAL;
}

";" {
    printf("SEMICOLON %s\n", yytext);
    return SEMICOLON;
}

"," {
    printf("COMMA %s\n", yytext);
    return COMMA;
}

"{" {
    printf("LBRACE %s\n", yytext);
    return LBRACE;
}

"}" {
    printf("RBRACE %s\n", yytext);
    return RBRACE;
}

"(" {
    printf("LPAREN %s\n", yytext);
    return LPAREN;
}

")" {
    printf("RPAREN %s\n", yytext);
    return RPAREN;
}

"[" {
    printf("LBRACKET %s\n", yytext);
    return LBRACKET;
}

"]" {
    printf("RBRACKET %s\n", yytext);
    return RBRACKET;
}

"*" {
    printf("STAR %s\n", yytext);
    return STAR;
}

"+" {
    printf("PLUS %s\n", yytext);
    return PLUS;
}

"-" {
    printf("MINUS %s\n", yytext);
    return MINUS;
}

"<<" {
    printf("LSHIFT %s\n", yytext);
    return LSHIFT;
}

">>" {
    printf("RLSHIFT %s\n", yytext);
    return RLSHIFT;
}

">>>" {
    printf("RASHIFT %s\n", yytext);
    return RASHIFT;
}

"<" {
    printf("LESS %s\n", yytext);
    return LESS;
}

"<=" {
    printf("LESSEQ %s\n", yytext);
    return LESSEQ;
}

">" {
    printf("GREAT %s\n", yytext);
    return GREAT;
}

">=" {
    printf("GREATEQ %s\n", yytext);
    return GREATEQ;
}

"==" {
    printf("EQ %s\n", yytext);
    return EQ;
}

"!=" {
    printf("NEQ %s\n", yytext);
    return NEQ;
}

"&" {
    printf("LAND %s\n", yytext);
    return LAND;
}

"|" {
    printf("LOR %s\n", yytext);
    return LOR;
}

"[&]" {
    printf("BAND %s\n", yytext);
    return BAND;
}

"[|]" {
    printf("BOR %s\n", yytext);
    return BOR;
}

"!" {
    printf("NOT %s\n", yytext);
    return NOT;
}

"~" {
    printf("TILDE %s\n", yytext);
    return TILDE;
}

"=" {
    printf("ASSIGN %s\n", yytext);
    return ASSIGN;
}

{id} {
    printf("ID %s\n", yytext);
    yylval.string = new std::string(yytext, yyleng);
    return ID;
}

{intliteral} {
    printf("INTLITERAL %s\n", yytext);
    yylval.integer = std::atoi(yytext);
    return INTLITERAL;
}

{stringliteral} {
    printf("STRINGLITERAL %s\n", yytext);
    yylval.string = new std::string(yytext, yyleng);
    return STRINGLITERAL;
}

{comment} { /* Comments, Do nothing */ }

<<EOF>> {
    if (!end) {
        end = true;
        printf("SCANEOF\n");
        return SCANEOF;
    }
    yyterminate();
}

[ \t\n]     { /* Do nothing */ }

. { printf("Unknown symbol %s\n", yytext); }

%%

int yywrap (void) {return 1;}
