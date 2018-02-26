%{
#include <stdlib.h>
#include <stdio.h>
#include "parse.tab.h"
void yyerror(char *);
%}
%%
0   {
    yylval.val = atoi(yytext);
    return INTEGER;
}
[1-9][0-9]* {
   yylval.val = atoi(yytext);
    return INTEGER;
}
[-+*/] {
   return *yytext;
}
.   yyerror("Unknown character");
%%
int yywrap(void) {
    return 1;
}
