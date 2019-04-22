%{
#include <stdio.h>

void yyerror(char *c);
int yylex(void);

%}

%token INT MULT SOMA SUB EOL PARO PARC
%left SOMA SUB
%left MULT
%%

PROGRAMA:
        PROGRAMA EXPRESSAO EOL { printf("Resultado: %d\n", $2); }
        |
        ;


NUMERO:
    INT {
        $$ = $1;
    }
    | SUB NUMERO {
        $$ = $2*(-1);
    }
    | SOMA NUMERO {
        $$ = $2;
    }
    ;

EXPRESSAO:
    NUMERO {
        $$ = $1;
    }
    | EXPRESSAO SUB EXPRESSAO  {
        printf("Encontrei subtracao: %d - %d = %d\n", $1, $3, $1-$3);
        $$ = $1 - $3;
    }
    | EXPRESSAO SOMA EXPRESSAO  {
        printf("Encontrei soma: %d + %d = %d\n", $1, $3, $1+$3);
        $$ = $1 + $3;
    }
    | EXPRESSAO MULT EXPRESSAO  {
        printf("Encontrei mult: %d * %d = %d\n", $1, $3, $1*$3);
        $$ = $1 * $3;
    }
    | PARO EXPRESSAO PARC  {
        $$ = $2;
    }
    ;
%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
  yyparse();
  return 0;

}
