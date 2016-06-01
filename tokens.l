/*Our flex file that generates our lexical analyzer. Generates `tokens.cpp`
which is then used by our **parser.y** so it can get the `%token` from scanning an input file*/
%{
#include "parser.hpp"
#include "main.h"
%}
/*The `yylineno` option tells flex to define an integer variable
called yylineno and to maintain the current line number in it.
What that means is that every time the scanner reads a newline character,
it increments yylineno, and if the scanner backs up over a newline
(using some features we’ll get to later), it decrements it.

 `no default` If the scanner encounters input that does not match any of its rules, it aborts with an error. This option is useful for finding holes in a scanner's rule set.
*/
%option nodefault yylineno noyywrap
%x IN_COMMENT
%%

 /*Ignore whitespace*/
[ \t\n\r]+ ;

 /*Ignore comments*/
"//".* ;

 /*Ignore block comments*/
"/*" BEGIN(IN_COMMENT);
<IN_COMMENT>.|[\n\r] ;
<IN_COMMENT>"*/" BEGIN(INITIAL);

 /*Keywords*/
"class" 			 return CLASS;
"public" 			 return PUBLIC;
"static" 			 return STATIC;
"length" 			 return LENGTH;
"return" 			 return RETURN;
"if" 	 			 return IF;
"else" 	 			 return ELSE;
"while"  			 return WHILE;
"new"    			 return NEW;
"this"   			 return THIS;
"System.out.println" return PRINT;
 
 /*Types*/
"void" 				 return VOID;
"int" 				 return INT;
"boolean" 			 return BOOL;
"String" 			 return STRING;

 /*Boolean values*/
"true"  return TRUE;
"false" return FALSE;

 /*Operators*/
"||" return OR;
"&&" return AND;
"==" return EQUAL;
"!=" return NEQUAL;
"<=" return LEQ;
">=" return GEQ;
"<"  return LESS;
">"  return GREATER;
"+"  return PLUS;
"-"  return MINUS;
"*"  return MULT;
"!"  return NOT;

 /*Symbols*/
"{"  return LBLOCK;
"}"  return RBLOCK;
"("  return LPAREN;
")"  return RPAREN;
"["  return LBRACK;
"]"  return RBRACK;
"="  return ASSIGN;
";"  return SCOLON;
","  return COMMA;
"."  return PERIOD;

 /*Integer
Integer is either a single digit 0-9 or multiple digits starting with 1-9.  
019 would be an invalid token.
`yylval.integer` = atoi(yytext) sets the value of the token `INTEGER` as the int value of the string matched.

Identifier
`yylval.id` = strdup(yytext) sets the value of the token `id` as the string matched.
*/
[0-9] 						yylval.integer = atoi(yytext); return INTEGER;
[1-9][0-9]* 				yylval.integer = atoi(yytext); return INTEGER;
[_a-zA-Z][_a-zA-Z0-9]* 		yylval.id = strdup(yytext); return id;

. error_message(yylineno, "Not a valid token. Bad input character '%s'.", yytext);

%%

