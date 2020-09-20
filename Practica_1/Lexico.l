%{
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
//#include "y.tab.h"
FILE  *yyin;
int yylval;
char *yyltext;

%}
%option noyywrap
%option yylineno

DECVAR                "DECVAR"
ENDDEC                "ENDDEC"
IF				      "IF"|"if"
ELSE			      "ELSE"|"else"
WHILE			      "WHILE"|"while"
INTEGER			      "INTEGER"|"Integer"
FLOAT			      "FLOAT"|"Float"
WRITE				  "WRITE"|"write"
DIGITO			      [0-9]
LETRA			      [a-zA-Z]
COMA				  ","
PyC				      ";"
P_A                   "("
P_C                   ")"
LLAVE_A				  "{"
LLAVE_C				  "}"
ASIGN                 ":"
OP_SUM                "+"
OP_RES                "-"
OP_MULT               "*"
OP_DIV                "/"
OP_IGUAL		      "=="
OP_DIST		          "!="
OP_MAY                ">"
OP_MIN                "<"
OP_MAYEQ              ">="
OP_MINEQ              "<="
PALABRA_RESERVADA     (DECVAR|ENDDEC|IF|ELSE|WHILE|INTEGER|FLOAT|WRITE)
ID                    {LETRA}({LETRA}|{DIGITO})*
CTE_ENTERA			  {DIGITO}+
CTE_REAL			  {DIGITO}+\.{DIGITO}+
STRING                (\".*\")

%%

{PALABRA_RESERVADA}   printf("\nPalabra Reservada: %s", yytext);
{ID}				  printf("\nIdentificador: %s", yytext);
{STRING}			  printf("\nString: %s", yytext);
{CTE_ENTERA}		  printf("\nConstante Entera: %s", yytext);
{CTE_REAL}		      printf("\nConstante Real: %s", yytext);
{ASIGN}				  printf("\nAsignacion: %s", yytext);
{OP_SUM}			  printf("\nSuma: %s", yytext);
{OP_MULT}			  printf("\nMultiplicacion: %s", yytext);
{OP_RES}			  printf("\nResta: %s", yytext);
{OP_DIV}			  printf("\nDivision: %s", yytext);
{OP_IGUAL}			  printf("\nIgual: %s", yytext);
{OP_DIST}			  printf("\nDistinto: %s", yytext);
{OP_MAY}			  printf("\nMayor: %s", yytext);
{OP_MIN}			  printf("\nMenor: %s", yytext);
{OP_MAYEQ}			  printf("\nMayor Igual: %s", yytext);
{OP_MINEQ}			  printf("\nMenor Igual: %s", yytext);
{COMA}				  printf("\nComa: %s", yytext);
{PyC}				  printf("\nPunto y Coma: %s", yytext);
{P_A}				  printf("\nParentesis A: %s", yytext);
{P_C}				  printf("\nParentesis C: %s", yytext);
{LLAVE_A}			  printf("\nLlave A: %s", yytext);
{LLAVE_C}			  printf("\nLlave C: %s", yytext);
"\n"
"\t"
%%

int main(int argc,char *argv[])
{
    if ((yyin = fopen(argv[1], "rt")) == NULL)
    {
        printf("\nNo se puede abrir el archivo: %s\n", argv[1]);
    }
    else
    {
        yylex();
    }
    fclose(yyin);
    return 0;
}
int yyerror(void)
{
    printf("Syntax Error\n");
    system("Pause");
    exit(1);
}