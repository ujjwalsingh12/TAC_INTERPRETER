VER = 2
all: 
	flex lexer$(VER).l
	bison -d parser$(VER).y
	g++ parser$(VER).tab.c lex.yy.c -o parser$(VER) -ll
	./parser$(VER) 

update:
	sudo sed -i '' '2s/.*/#include "parser$(VER).tab.h"/' lexer$(VER).l
	all
# Clean up generated files
clean:

	rm -f parser$(VER) parser$(VER).tab.c parser$(VER).tab.h lex.yy.c