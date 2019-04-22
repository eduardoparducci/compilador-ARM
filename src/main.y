%{
#include <stdio.h>
int mul=0;
void yyerror(char *c);
int yylex(void);

%}

%token INT MULT SOMA SUB EOL PARO PARC
%left SOMA SUB
%left MULT
%%

PROGRAMA:
        PROGRAMA EXPRESSAOP EOL { printf("\tldmfd\tsp!, {r0}\n"); }
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

EXPRESSAOP:
    NUMERO {
        printf("\tmov\tr0, #%d\n\tstmfd\tsp!, {r0}\n", $1);
        $$ = $1;
    }
    | EXPRESSAOP SOMA EXPRESSAOP  {
        printf("\tldmfd\tsp!, {r1}\n\tldmfd\tsp!, {r2}\n\tadd r0, r1, r2\n\tstmfd\tsp!, {r0}\n");
        $$ = $1;
    }
    | EXPRESSAOP SUB EXPRESSAOP  {
        printf("\tldmfd\tsp!, {r1}\n\tldmfd\tsp!, {r2}\n\tsub r0, r2, r1\n\tstmfd\tsp!, {r0}\n");
        $$ = $1;
    }
    | EXPRESSAOP MULT EXPRESSAOP  {
      printf("\tmov\tr2, #0\n\tmov\tr0, #0\n\tldmfd	sp!, {r1}\n\tldmfd	sp!, {r3}\n\tm%d_b\n\tcmp\tr2, r1\n\tbeq\tm%d_e\n\tadd\tr2, r2, #1\n\tadd\tr0, r0, r3\n\tb\tm%d_b\n\tm%d_e\n\tstmfd\tsp!, {r0}\n", mul, mul, mul, mul);
        mul++;
        $$ = $1;
    }
    | PARO EXPRESSAOP PARC  {
        $$ = $2;
    }
    ;
%%

void yyerror(char *s) {
  fprintf(stderr, "%s\n", s);
}

int main() {
  printf("\tmov\tsp, #0x200\n");
  yyparse();
  return 0;

}
