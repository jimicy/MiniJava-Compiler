#include <stdio.h>
#include <iostream>
#include "main.h"
#include "CodeGen.h"

// Using extern to declare their existance as global variables
extern int yylex(void);
extern FILE*   yyin;
extern int yyparse();

char *filename = NULL;
ast_program program_ast;

// Logs errors
void error_message(int lineno, const char *error, ...)
{
	fprintf(stderr, "%s:%d: ", filename, lineno);
	va_list args;
	va_start (args, error);
	vfprintf (stderr, error, args);
	va_end (args); 
	fputs("\n", stderr);

	exit(1);
}

// Return 1 if there is an error, otherwise return 0 for normal exit.
int main(int argc, char *argv[])
{
	// get the file
	filename = argv[1];

	if(filename == NULL) {
		fputs("usage: main [file.java]\n", stderr);
		return 1;
	}

	// Open our passed in file. `$ ./main <filename>`
	// `yyin` is a a global variable that our lexical analyzer uses to determine which file to scan
	yyin = fopen(filename, "r");
	if(yyin == NULL)
	{
		fprintf(stderr, "%s: ", argv[1]);
		perror("");
		return 1;
	}

	// Call the function yyparse to cause parsing to occur
	// The value returned by yyparse is 0 if parsing was successful.
	// Return 1 if unsuccessful.
	if(yyparse() == 1){
		return 1;
	}


	// Print out the AST generated for the `<file>.java`
	FILE *out_file;
	out_file = fopen("Output_AST.txt", "w");
	ast_program_print(out_file, 0, &program_ast);

	//Call **CodeGen.cpp** and pass in our parsed ast `ast_program ast`
	makeProgram(program_ast);
	
	return 0;
}