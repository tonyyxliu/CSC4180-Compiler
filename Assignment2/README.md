# Assignment 2: Scanner for Oat v.1 Language

**Release Date**: February 29th, 2024
**Deadline**: March 21st, 2024

## Instructions & Oat Language Specification

Refer to the [Instruction PDF](./CSC4180-A2-Instruction.pdf)

## How to Run the Compiler

```bash
cd /path/to/project
make all

# Flex Scanner
118010200@c2d52c9b1339:~/A2$ ./lexer < ./testcases/test0.oat
# Handwritten Scanner
118010200@c2d52c9b1339:~/A2$ ./scanner ./testcases/test0.oat
```

## Sample: test0.m

**Oat v.1 Program**
```text
int main() { 
    var str = "hello world!";
    print_string(str);
    return 0;
}
```

**Output <token_class, lexeme> pairs**
```bash
118010200@c2d52c9b1339:~/A2$ ./lexer < ./testcases/test0.oat
    TINT int
    ID main
    LPAREN (
    RPAREN )
    LBRACE {
    VAR var
    ID str
    ASSIGN =
    STRINGLITERAL "hello world!"
    SEMICOLON ;
    ID print_string
    LPAREN (
    ID str
    RPAREN )
    SEMICOLON ;
    RETURN return
    INTLITERAL 0
    SEMICOLON ;
    RBRACE }

118010200@c2d52c9b1339:~/A2$ ./scanner ./testcases/test0.oat
    TINT int
    ID main
    LPAREN (
    RPAREN )
    LBRACE {
    VAR var
    ID str
    ASSIGN =
    STRINGLITERAL "hello world!"
    SEMICOLON ;
    ID print_string
    LPAREN (
    ID str
    RPAREN )
    SEMICOLON ;
    RETURN return
    INTLITERAL 0
    SEMICOLON ;
    RBRACE }
```