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

extern int cst_only;

Node* root_node = nullptr;
%}

// TODO: define yylval data types with %union

// TODO: define terminal symbols with %token. Remember to set the type.

// Start Symbol
%start start

// TODO: define Non-Terminal Symbols with %type. Remember to set the type.

%%
/**
 * Format:
 * Non-Terminal  :  [Non-Terminal, Terminal]+ (production rule 1)   { parser actions in C++ }
 *                  | [Non-Terminal, Terminal]+ (production rule 2) { parser actions in C++ }
 *                  ;
 */


// TODO: your production rule here
// The tree generation logic should be in the operation block of each production rule

%%

int yyerror(char *s) {
	printf("Syntax Error on line %s\n", s);
	return 0;
}
