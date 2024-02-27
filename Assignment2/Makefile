all: main.cpp scanner.cpp lexer.cpp
	g++ main.cpp scanner.cpp tokens.cpp -o scanner

lexer.cpp: lexer.l
	flex -o lexer.cpp lexer.l
	g++ lexer.cpp -o lexer 

clean:
	rm -rf scanner lexer lexer.cpp