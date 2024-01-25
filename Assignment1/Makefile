all: scanner.cpp parser.cpp main.cpp
	g++ -g -std=c++14 -I /usr/include/boost scanner.cpp parser.cpp node.cpp ir_generator.cpp main.cpp -lboost_program_options -o compiler

scanner.cpp: parser.cpp scanner.l
	flex -o scanner.cpp scanner.l

parser.cpp: parser.y node.cpp
	bison -dv -o parser.cpp parser.y

clean: 
	rm -f scanner.cpp parser.cpp parser.hpp compiler parser.output stack.hh core.*