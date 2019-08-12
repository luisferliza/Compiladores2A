/*
Organizacion de lenguajes y compiladores 2
Material de apoyo
Autor: Luis Fernando Lizama
Descripcion: Permite Convertir una cadena en formato binario a numeros decimales
*/


%{
   function Node() {
    this.exp = 0;
    this.val =0;    
   }

%}
/* lexical grammar */
%lex
%%

\s+                   /* skip whitespace */
"."                   return '.'
"0"                   return '0'
"1"                   return '1'


<<EOF>>               return 'EOF'
// any other characters will throw an error
.                     return 'INVALID'

/lex


%start S

%% /* language grammar */


S: L EOF     {return $1.val}
;

L : L B     { $$= $1; $$.val = $1.val + $2 * $$.exp; $$.exp = $1.exp/2;}

|C '.'    { $$ = new Node(); $$.exp = 0.5; $$.val = $1}
;

C : C B  { $$ = $1*2 + $2}
| B     { $$ = $1; }
;

B: '0'  {$$ = parseInt($1, 10); } 
| '1'   {$$ = parseInt($1, 10)} ;