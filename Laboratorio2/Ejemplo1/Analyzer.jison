/*
Organizacion de lenguajes y compiladores 2
Material de apoyo
Autor: Luis Fernando Lizama
Descripcion: DDS que permite contar las incidencias de un numero en una lista de numeros
*/


%{
   function Node(num) {
    this.num = num;
    this.cont =0;    
   }
   

%}
/* lexical grammar */
%lex
%%

\s+                   /* skip whitespace */
[0-9]                 return 'NUMBER'
","                   return ','
"="                   return '='
"("                   return '('
")"                   return ')'


<<EOF>>               return 'EOF'
// any other characters will throw an error
.                     return 'INVALID'

/lex


%start S

%% /* language grammar */

S : LL ')' EOF    { return $1.cont; }
;

LL : LL ',' NUMBER      				{ $$ = $1; if($$.num == $3){ $$.cont++ } }
     | NUMBER '=' '(' NUMBER 			{ $$ = new Node($1); if($1 == $4) { $$.cont++; }}
;


