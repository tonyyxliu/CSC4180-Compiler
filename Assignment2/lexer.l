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
%}

integer [0-9]+
id [a-zA-Z][a-zA-Z0-9_]*
comment \/\*([^*]|\*+[^*/])*\*+\/
string \"(.)*\"

%%

/* Define your tokens here */

%%

int main(int argc, char **argv)
{
  yylex();
  yywrap();
}

int yywrap (void) {return 1;}
