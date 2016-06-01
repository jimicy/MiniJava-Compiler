#ifndef MAIN_H
#define MAIN_H

// To get access to `ast_program program_ast`
#include "parser.hpp"

void error_message(int lineno, const char *error, ...);

// Declare `ast_program program_ast` as a global variable
// so parser.y can set it and we can use it in main.cpp
extern ast_program program_ast;

#endif