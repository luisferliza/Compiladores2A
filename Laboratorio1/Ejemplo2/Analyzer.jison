/* description: Analizador que suma numeros consecutivos y concatena letras. */


/* lexical grammar */
%lex

%%

"//".*                                        /* IGNORE */
"/*""/"*([^*/]|[^*]"/"|"*"[^/])*"*"*"*/"      /*Se ignoran los comentarios multilinea*/

//Delimitadores

","                   return ',';


//Operaciones Aritmeticas

//Designacion de Tipos

//Palabras Reservadas

//Expresiones Regulares

\s+                                             /* skip whitespace */
[0-9]                                           return 'NUMBER';
[A-Za-z]                                        return 'LETTER';


<<EOF>>               return 'EOF';

/lex

/* operator associations and precedence */


%start S

%% /* language grammar */

S: LL EOF                { return $1; }
;


LL : LL ',' LETRA       { $$ = $1 + "," + $3; }
    | LETRA             { $$ = $1; }
;

LETRA : LN              { $$ = $1.toString(); }
    | 'LETTER'        { $$ = $1; }
;

LN : LN ',' NUMBER      { $$ = $1 + parseInt($3, 10); }
    | NUMBER            { $$ = parseInt($1, 10); }
;
