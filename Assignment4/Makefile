all: scanner.cpp parser.cpp main.cpp
	g++ scanner.cpp parser.cpp node.cpp main.cpp -o compiler

scanner.cpp: parser.cpp scanner.l
	flex -o scanner.cpp scanner.l

parser.cpp: parser.y node.cpp
	bison -dv -o parser.cpp parser.y

clean: 
	rm -f scanner.cpp parser.cpp parser.hpp compiler parser.output stack.hh core.*