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
 * File: tokens.cpp
 * ------------------------------------------------------------
 * This file implements the functions for TokenClass enum
 */

#include "tokens.hpp"

std::string token_class_to_str(const TokenClass &token_class) {
    switch(token_class) {
        /* Reserved Keywords */
        case NUL:       return "NULL";
        case TRUE:      return "TRUE";
        case FALSE:     return "FALSE";
        case TVOID:     return "TVOID";
        case TINT:      return "TINT";
        case TSTRING:   return "TSTRING";
        case TBOOL:     return "TBOOL";
        case IF:        return "IF";
        case ELSE:      return "ELSE";
        case WHILE:     return "WHILE";
        case FOR:       return "FOR";
        case RETURN:    return "RETURN";
        case NEW:       return "NEW";
        /* Punctuations */
        case SEMICOLON: return "SEMICOLON";
        case COMMA:     return "COMMA";
        case LBRACE:    return "LBRACE";
        case RBRACE:    return "RBRACE";
        case LPAREN:    return "LPAREN";
        case RPAREN:    return "RPAREN";
        case LBRACKET:  return "LBRACKET";
        case RBRACKET:  return "RBRACKET";
        /* Binary Operators */
        case STAR:      return "STAR";
        case PLUS:      return "PLUS";
        case MINUS:     return "MINUS";
        case LSHIFT:    return "LSHIFT";
        case RLSHIFT:   return "RLSHIFT";
        case RASHIFT:   return "RASHIFT";
        case LESS:      return "LESS";
        case LESSEQ:    return "LESSEQ";
        case GREAT:     return "GREAT";
        case GREATEQ:   return "GREATEQ";
        case EQ:        return "EQ";
        case NEQ:       return "NEQ";
        case LAND:      return "LAND";
        case LOR:       return "LOR";
        case BAND:      return "BAND";
        case BOR:       return "BOR";
        /* Unary Operators */
        case NOT:       return "NOT";
        case TILDE:     return "TILDE";
        /* Other Token Classes */
        case ASSIGN:    return "ASSIGN";
        case INTLITERAL:return "INTLITERAL";
        case ID:        return "ID";
        case COMMENT:   return "COMMENT";
        case STRINGLITERAL:
                        return "STRINGLITERAL";
        case VAR:       return "VAR";
        case GLOBAL:    return "GLOBAL";
        default:        return "Invalid";
    }
}
