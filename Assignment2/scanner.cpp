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
 * File: scanner.cpp
 * ------------------------------------------------------------
 * This file implements scanner function defined in scanner.hpp
 */

#include "scanner.hpp"

DFA::~DFA() {
    for (auto state : states) {
        state->transition.clear();
        delete state;
    }
}

void DFA::print() {
    printf("DFA:\n");
    for (auto state : states)
        state->print();
}

/**
 * Epsilon NFA
 * (Start) -[EPSILON]-> (End)
 */
NFA::NFA() {
    start = new State();
    end = new State();
    start->transition[EPSILON] = {end};
}

/**
 * NFA for a single character
 * (Start) -[c]-> (End)
 * It acts as the unit of operations like union, concat, and kleene star
 * @param c: a single char for NFA
 * @return NFA with only one char
 */
NFA::NFA(char c) {
    start = new State();
    end = new State();
    start->transition[c] = {end};
}

NFA::~NFA() {
    for (auto state : iter_states()) {
        state->transition.clear();
        delete state;
    }
}

/**
 * Concat a string of char
 * Start from the NFA of the first char, then merge all following char NFAs
 * @param str: input string
 * @return
 */
NFA* NFA::from_string(std::string str) {
    // TODO
}

/**
 * RegExp: [a-zA-Z]
 * @return
 */
NFA* NFA::from_letter() {
    // TODO
}

/**
 * RegExp: [0-9]
 * @return
 */
NFA* NFA::from_digit() {
    // TODO
}

/**
 * NFA for any char (ASCII 0-127)
 */
NFA* NFA::from_any_char() {
    // TODO
}
/**
 * Concatanat two NFAs
 * @param from: NFA pointer to be concated after the current NFA
 * @return: this -> from
 */
void NFA::concat(NFA* from) {
    // TODO
}

/**
 * Set Union with another NFA
 * @param
 */
void NFA::set_union(NFA* from) {
    // TODO
}

/**
 * Set Union with a set of NFAs
 */
void NFA::set_union(std::set<NFA*> set) {
    // TODO
}

/**
 * Kleene Star Operation
 */
void NFA::kleene_star() {
    // TODO
}

/**
 * Determinize NFA to DFA by subset construction
 * @return DFA
 */
DFA* NFA::to_DFA() {
    // TODO
}

/**
 * Get the closure of the given Nstates set
 * It means all the Nstates can be reached with the given Nstates set without any actions
 * @param state: State* , the starting state of getting epsilon closure
 * @return {set<State&>} The closure of state
 */
std::set<NFA::State*> NFA::epsilon_closure(NFA::State* state) {
    // TODO
}

/**
 * Get the set of neighbor states from the closure of starting state through char c
 * @param closure
 * @param c
 * @return
 */
std::set<NFA::State*> NFA::move(std::set<NFA::State*> closure, char c) {
    // TODO
}

void NFA::print() {
    printf("NFA:\n");
    for (auto state : iter_states())
        state->print();
}

/**
 * BFS Traversal
 */
std::vector<NFA::State*> NFA::iter_states() {
    std::vector<State*> states{};
    states.emplace_back(start);
    std::queue<State*> states_to_go{};
    states_to_go.emplace(start);
    std::set<State*> visited_states = {start};
    while(!states_to_go.empty()) {
        State* state = states_to_go.front();
        states_to_go.pop();
        for (auto trans : state->transition) {
            for (auto neighbor : trans.second) {
                if (visited_states.find(neighbor) == visited_states.end()) {
                    states_to_go.emplace(neighbor);
                    visited_states.insert(neighbor);
                    states.emplace_back(neighbor);
                }
            }
        }
    }
    return states;
}

/**
 * Constructor: Scanner
 * @usage: Scanner origin;
 *         Scanner scanner(reserved_word_strs, token_strs, reserced_word_num, token_num);
 * --------------------------------------------------------------------------------------
 * Create a Scanner object. The default constructor will not be used, and the second form
 * will create the NFA and DFA machines based on the given reserved words and tokens
 */
Scanner::Scanner() {
    nfa = new NFA();
}

/**
 * Given a filename of a source program, print all the tokens of it
 * @param {string} filename
 * @return 0 for success, -1 for failure
 */ 
int Scanner::scan(std::string &filename) {
    // TODO
    return 0;
}

/**
 * Add string tokens, usually for reserved words, punctuations, and operators
 * @param token_str: exact string to match for token recognition
 * @param token_class
 * @param precedence: precedence of token, especially for operators
 * @return
 */
void Scanner::add_token(std::string token_str, TokenClass token_class, unsigned int precedence) {
    auto keyword_nfa = NFA::from_string(token_str);
    keyword_nfa->set_token_class_for_end_state(token_class, precedence);
    nfa->set_union(keyword_nfa);
}

/**
 * Token: ID (Identifier)
 * RegExp: [a-zA-Z][a-zA-Z0-9_]*
 * @param token_class
 * @param precedence
 * @return
 */
void Scanner::add_identifier_token(TokenClass token_class, unsigned int precedence) {
    // TODO: mimic how add_token do
}

/**
 * Token: INTEGER
 * RegExp: [1-9][0-9]+
 * Negative integer is recognized by unary operator MINUS
 * @param token_class
 * @param precedence
 * @return
 */
void Scanner::add_integer_token(TokenClass token_class, unsigned int precedence) {
    // TODO: mimic how add_token do
}

/**
 * Token Class: STRINGLITERAL
 * RegExp: "(.|")*"
 * @param token_class
 * @param precedence
 * @return
 */
void Scanner::add_string_token(TokenClass token_class, unsigned int precedence) {
    // TODO: mimic how add_token do
}

/**
 * Token Class: COMMENT
 * RegExp: //\s(.)*
 * @param token_class
 * @param precedence
 * @return
 */
void Scanner::add_comment_token(TokenClass token_class, unsigned int precedence) {
    // TODO: mimic how add_token do
}
