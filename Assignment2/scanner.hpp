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
 * File: scanner.hpp
 * ---------------------------------------------------------------------
 * This file defines the data structure of DFA, NFA, Scanner, and necessary
 * functions for scanning
 */

#ifndef SCANNER_HPP
#define SCANNER_HPP

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <queue>
#include <map>
#include <set>

#include "tokens.hpp"

const char EPSILON = static_cast<char>(255);

/**
 * Deterministic Finite Automata
 */
class DFA {
/* DFA State Definition */
public:
    struct State {
        unsigned int id;
        bool accepted = false;
        TokenClass token_class = NONE;
        std::map<char, State*> transition = {};

        static unsigned int increment_id;

        State() : id(increment_id++) {
            // TODO
        }

        bool operator==(const State& other) const {
            return id == other.id;
        }

        /**
         * Print the ID and every transition
         * For cleaner output, null transitions are ignored
         */
        void print() {
            if (!accepted)
                printf("<%d> ->", id);
            else
                printf("<%d(%s)> ->", id, token_class_to_str(token_class).c_str());
            for (auto trans : transition) {
                if (trans.second != nullptr) {
                    if (trans.first == EPSILON)
                        printf(" <%s, %d>", "EPSILON", trans.second->id);
                    else printf(" <%c, %d>", trans.first, trans.second->id);
                }
            }
            printf("\n");
        }
    };

/* Constructor and Destructor */
public:
    DFA() = default;

    ~DFA();

/* Debug Only */
public:
    void print();

/* Member Varaibles */
public:
    std::vector<State*> states;
};

/**
 * Non-Deterministic Finite Automata
 */
class NFA {
/* NFA State Definition */
public:
    struct State {
        unsigned int id;
        bool accepted = false;
        TokenClass token_class = NONE;
        unsigned int precedence = 0;
        std::map<char, std::set<State*>> transition = {};

        static unsigned int increment_id;

        State() : id(increment_id++) {}

        bool operator==(const State& other) const {
            return id == other.id;
        }

        void print() {
            printf("<%d> ->", id);
            for (auto trans : transition) {
                if (trans.first == EPSILON) printf(" <%s, <", "EPSILON");
                else printf(" <%c, <", trans.first);
                for (auto state : trans.second)
                    if (state != nullptr) printf("%d ", state->id);
                printf(">>");
            }
            printf("\n");
        }
    };

/* Constructor and Destructor */
public:
    NFA();

    NFA(char c);

    ~NFA();

    static NFA* from_string(std::string str);

    static NFA* from_letter();

    static NFA* from_digit();

    static NFA* from_any_char();

/* Common Operations of Formal Lanuage */
public:
    void concat(NFA* from);

    void set_union(NFA* from);

    void set_union(std::set<NFA*> set);

    void set_intersect(NFA* from);

    void kleene_star();

/* NFA -> DFA Transformation */
public:
    DFA* to_DFA();

    /**
     * The end state of NFA for each token should be marked as accepted, its token class, and its precedence
     * @param token_class
     * @param precedence: precedence of this token, especially for operators
     */
    inline void set_token_class_for_end_state(TokenClass &token_class, unsigned int precedence = 0) {
        end->accepted = true;
        end->token_class = token_class;
        end->precedence = precedence;
    };

/* Debug Only */
public:
    void print();

private:
    std::set<State*> epsilon_closure(State* state);

    std::set<State*> epsilon_closure(std::set<State*> states);

    std::set<State*> move(std::set<State*> closure, char c);

    std::vector<State*> iter_states();

/* Member Variables */
private:
    State* start;
    State* end;
};

class Scanner {
public:
    Scanner();

public:   
    int scan(std::string &filename);

    void add_token(std::string token_str, TokenClass token_class, unsigned int precedence = 100);

    void add_identifier_token(TokenClass token_class, unsigned int precedence = 50);

    void add_integer_token(TokenClass token_class, unsigned int precedence = 50);

    void add_string_token(TokenClass token_class, unsigned int precedence = 50);

    void add_comment_token(TokenClass token_class, unsigned int precedence = 50);

    void NFA_to_DFA() {
        dfa = nfa->to_DFA();
    }

    inline void print_nfa() { nfa->print(); };

    inline void print_dfa() { dfa->print(); };

private:
    NFA *nfa;
    DFA *dfa;
};

#endif  // SCANNER_HPP
