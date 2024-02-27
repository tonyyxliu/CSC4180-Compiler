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

int yyerror (char *s);

int yylex();

int end = 0;
%}

integer [0-9]+
id [a-zA-Z][a-zA-Z0-9_]*
comment \/\*([^*]|\*+[^*/])*\*+\/
string \"(.)*\"

%%
"null" {
    printf("NULL %s\n", yytext);
}

"true" {
    printf("TRUE %s\n", yytext);
}

"false" {
    printf("FALSE %s\n", yytext);
}

"void" {
    printf("TVOID %s\n", yytext);
}

"int" {
    printf("TINT %s\n", yytext);
}

"string" {
    printf("TSTRING %s\n", yytext);
}

"bool" {
    printf("TBOOL %s\n", yytext);
}

"if" {
    printf("IF %s\n", yytext);
}

"else" {
    printf("ELSE %s\n", yytext);
}

"while" {
    printf("WHILE %s\n", yytext);
}

"for" {
    printf("FOR %s\n", yytext);
}

"return" {
    printf("RETURN %s\n", yytext);
}

"new" {
    printf("NEW %s\n", yytext);
}

"var" {
    printf("VAR %s\n", yytext);
}

"global" {
    printf("GLOBAL %s\n", yytext);
}

";" {
    printf("SEMICOLON %s\n", yytext);
}

"," {
    printf("COMMA %s\n", yytext);
}

"{" {
    printf("LBRACE %s\n", yytext);
}

"}" {
    printf("RBRACE %s\n", yytext);
}

"(" {
    printf("LPAREN %s\n", yytext);
}

")" {
    printf("RPAREN %s\n", yytext);
}

"[" {
    printf("LBRACKET %s\n", yytext);
}

"]" {
    printf("RBRACKET %s\n", yytext);
}

"*" {
    printf("STAR %s\n", yytext);
}

"+" {
    printf("PLUS %s\n", yytext);
}

"-" {
    printf("MINUS %s\n", yytext);
}

"<<" {
    printf("LSHIFT %s\n", yytext);
}

">>" {
    printf("RLSHIFT %s\n", yytext);
}

">>>" {
    printf("RASHIFT %s\n", yytext);
}

"<" {
    printf("LESS %s\n", yytext);
}

"<=" {
    printf("LESSEQ %s\n", yytext);
}

">" {
    printf("GREAT %s\n", yytext);
}

">=" {
    printf("GREATEQ %s\n", yytext);
}

"==" {
    printf("EQ %s\n", yytext);
}

"!=" {
    printf("NEQ %s\n", yytext);
}

"&" {
    printf("LAND %s\n", yytext);
}

"|" {
    printf("LOR %s\n", yytext);
}

"[&]" {
    printf("BAND %s\n", yytext);
}

"[|]" {
    printf("BOR %s\n", yytext);
}

"!" {
    printf("NOT %s\n", yytext);
}

"~" {
    printf("TILDE %s\n", yytext);
}

"=" {
    printf("ASSIGN %s\n", yytext);
}

{id} {
    printf("ID %s\n", yytext);
}

{integer} {
    printf("INTLITERAL %s\n", yytext);
}

{string} {
    printf("STRINGLITERAL %s\n", yytext);
}

{comment} {
    printf("COMMENT %s\n", yytext);
}

<<EOF>> {
    if (!end) {
        end = 1;
        printf("EOF\n");
    }
    yyterminate();
}

[ \t\n]     { /* Do nothing */ }

. { printf("Unknown symbol %s\n", yytext); }

%%

int main(int argc, char **argv)
{
  yylex();
  yywrap();
}

int yywrap (void) {return 1;}
