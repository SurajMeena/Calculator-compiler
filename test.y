%{
#include <stdio.h>
int yylex(void);
void yyerror(char *s);
%}
%token INTEGER
%%
program:
program expr '\n'   { printf("%d\n", $2); }
|
;
expr:
INTEGER             { $$ = $1; } 
| expr '+' expr     { $$ = $1 + $3; }
| expr '-' expr     { $$ = $1 - $3; }
;

%%
extern FILE *yyin;
void yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
}
int main(int argc,char **argv) {
	yyin=fopen(argv[1],"r");
	yyparse();
	return 0;
}
