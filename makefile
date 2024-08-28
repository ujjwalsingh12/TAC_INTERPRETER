all: 
	flex lexer.l
	bison -d parser5.y
	g++ parser5.tab.c lex.yy.c -o parser5 -ll
	./parser5 

# Clean up generated files
clean:

	rm -f parser5 parser5.tab.c parser5.tab.h lex.yy.c