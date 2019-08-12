/* description: Parses end executes mathematical expressions. */


/* lexical grammar */
%lex

%%

"//".*                                        /* IGNORE */
"/*""/"*([^*/]|[^*]"/"|"*"[^/])*"*"*"*/"      /*Se ignoran los comentarios multilinea*/

//Delimitadores

"("                   return '(';
")"                   return ')';

//Operaciones Aritmeticas
"*"                   return '*';
"+"                   return '+';



//Designacion de Tipos

//Palabras Reservadas

//Expresiones Regulares

\s+                                             /* skip whitespace */
[0-9]+("."[  |0-9]+])?                           return 'NUMBER';


<<EOF>>               return 'EOF';

/lex

/* operator associations and precedence */


%left '+' 
%left '*' 


%start S

%% /* language grammar */

S: E EOF                { return $1; }
;


E : E '+' E             { $$ = "SUM(" + $1 +","+ $3 +")"; }
    | E '*' E           { $$ = "MUL(" + $1 +","+ $3 +")"; }
    | NUMBER            { $$ = $1; }
    | '(' E ')'         { $$ = $2; }
    ;