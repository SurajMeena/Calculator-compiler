%{
#include <iostream>
#include <string>
#include <stdio.h>
#include <stdlib.h>
using namespace std;

int yylex(void);
void yyerror(char *s);
%}

%union {
    int val;
    char *str;
}

%type <val> expression final_value
%token <val> INTEGER
%left <str> '+' '/' '*' '-'
%start final_value

%%

expression 
    : INTEGER               { 
                            cout << "INTEGER--" << $$ <<endl;
                            $$ = $$ ;
                            } 
    | expression '+' INTEGER {
                            cout << $1 << "+" << $3 <<endl;
                            $$ = $1 + $3;
                            cout << $$ <<endl;
                            }                            
    | expression '-' INTEGER {
                            cout << $1 << "-" << $3 <<endl;
                            $$ = $1 - $3;
                            cout << $$ <<endl;
                            }                            
    | expression '*' INTEGER {
                            cout << $1 << "*" << $3 <<endl;
                            $$ = $1 * $3;
                            cout << $$ <<endl;
                            }                            
    | expression '/' INTEGER { 
                            cout << $1 << "/" << $3 <<endl;
                            $$ = $1 / $3;
                            cout << $$ <<endl;
                            }
                            ;


final_value 
    : expression               { 
                            cout << "final value-" << $$ <<endl;
                            $$ = $$ ;
                            }
                            ;
%%

extern FILE *yyin;
int main(int argc, char **argv){
    yyin = fopen(argv[1], "r");
    yyparse();
    return 0;
}

void yyerror(char *str){
    fprintf(stderr, "error: %s\n", str);
}
