

all: lex.yy.c y.tab.c
	gcc -o main lex.yy.c y.tab.c -lfl

lex.yy.c:compiler.l y.tab.c
	flex compiler.l

y.tab.c:compiler.y
	bison -dy compiler.y

clean:
	rm y.tab.c lex.yy.c y.tab.h main
