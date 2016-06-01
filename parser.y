%{
    #include <stdio.h>
    #include <stdint.h>
    #include <inttypes.h>
    #include <string.h>
    #include <stdlib.h>
    #include "main.h"

    extern int yylex();
    extern int yylineno;
    void yyerror(const char *s) { error_message(yylineno, "%s", s); }
%}

// Gives access to struct that represent the ast for the java program
%code requires{
    #include "ast.h"
}

// The %union declaration specifies the entire collection of possible C++ data types for semantic values.
%union{
    char *id;
    int integer;
    ast_expr *expr;
    ast_stmt *statement;
    ast_vardecl *declaration;
    ast_methoddecl *method;
    ast_classdecl *class_declaration;
    ast_mainclass main;
    ast_type type;
}

// ## [Tokens](http://www.gnu.org/software/bison/manual/html_node/Token-Decl.html)
// Tokens are passed from `tokens.cpp`, the generated lexical analyzer from our flex `tokens.l` file.  
// We need to declare a token type name with `%token` or `%left`, `%right`, `%nonassoc`, or `%precedence` if we need to specify precedence and associativity  

//  #### Keywords in Java
%token CLASS // class"
%token PUBLIC // public
%token STATIC // static
%token LENGTH // length
%token RETURN // return
%token IF // if
%token ELSE // else
%token WHILE // while
%token NEW // new
%token THIS // this
%token PRINT // System.out.println

//  #### Types in Java
%token VOID // void
%token INT // int
%token BOOL // boolean
%token STRING // String

//  #### Boolean values in Java
%token TRUE // true
%token FALSE // false

// #### Operators in Java
// `%left` specifies left-associativity (grouping x with y first)  
// [Java Order of precedence](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/operators.html)

//not used in the miniJava BNF
%left OR // ||

%left AND // &&
%left EQUAL NEQUAL // == !=
%left LESS GREATER LEQ GEQ // < > <= >=
%left PLUS MINUS // + -
%left MULT // *
%left NOT // !

//  #### Symbols in Java
%token LBLOCK // {
%token RBLOCK // }
%token LPAREN // (
%token RPAREN // )
%token LBRACK // [
%token RBRACK // ]
%token ASSIGN // =
%token SCOLON // ;
%token COMMA  // ,
%token PERIOD // .

// In `tokens.l` yylval.integer = int value of the token
// In `%union%` we define the type `int integer`
// By setting the type of the token as `<integer>`, yylval.integer is the value of our token

// Define **INTEGER LITERAL** which is an Integer 0, 19, 20, etc. It is of type integer
%token <integer> INTEGER

// In `tokens.l` yylval.id = string value of the token
// In `%union%` we define the type `char *id`
// By setting the type of the token as `<id>`, yylval.id is the value of our token

// Define token **id** and its type `char *id`. It is the name of a variable, class, method
%token <id> id

// ---

// Declare the value type (specified in `%union`) of each nonterminal symbol for which values are used. 
// Specifies what ast struct a BISON Rule maps to.
// Delimited by spaces. `Exp` is of type expr. `ExpList` is of type expr. And so.
%type <expr> Exp ExpList ExpRest ExpRestList NewIntArray Multidim
%type <statement> Statement StatementList
%type <declaration> VarDeclaration VarList MethodParamThis MethodParams MethodParamsRest
%type <type> Type
%type <method> MethodDeclaration MethodList
%type <class_declaration> ClassDeclaration ClassList
%type <main> MainClass

%start Program

%error-verbose

%%

// The ast_program is composed of a class with a
// `public static void main(String args[])` and another
// class with regular non static methods
Program: MainClass ClassList {
        AST_PROGRAM(program, $1, $2)
        program_ast = program;
    }

// ```
// Class ID {
//   public static void main(String[] args)
//   {
//      VarList
//      StatementList
//   }
// }
// ```
MainClass: CLASS id LBLOCK PUBLIC STATIC VOID id LPAREN STRING LBRACK RBRACK id RPAREN LBLOCK VarList StatementList RBLOCK RBLOCK {
        if(strcmp("main", $7))
            error_message(yylineno, "MiniJava only supports the static method 'main'.");

        // main method parameters
        ast_vardecl *main_params = new ast_vardecl[1];
        main_params->type.type = VAR_STRING_ARRAY;
        main_params->id = $12;
        main_params->lineno = yylineno;

        // main method
        ast_methoddecl *main_method = new ast_methoddecl[1];
        main_method->lineno = yylineno;
        main_method->params = main_params;
        main_method->type.type = VAR_VOID;
        main_method->id = $7;
        main_method->var_decl = $15;
        main_method->body = $16;

        // main class
        ast_mainclass main_class = {0};
        main_class.id = $2;
        main_class.method = main_method;
        main_class.lineno = yylineno;

        $$ = main_class;
    }

// Match a ClassDeclaration and define a recursive rule to match multiple ClassDeclaration
ClassList: ClassDeclaration ClassList { $1->next = $2; }
    | { $$ = NULL; } // empty

// Matches a Class with non static methods
ClassDeclaration: CLASS id LBLOCK VarList MethodList RBLOCK {
        CLASS_DECLARATION(class_declaration, $2, $4, $5);
        $$ = class_declaration;
    }

// List of variable declarations. Variable declarations can be in a class (fields) or in a method.
// ```
// int a;
// int[] b;
// bool c;
// ClassId d;
// ```
VarList: VarList VarDeclaration {
        if($1 == NULL)
            $$ = $2;
        else
        {
            ast_vardecl *declaration = $1;
            while(declaration->next != NULL)
                declaration = declaration->next;
            declaration->next = $2;
            $$ = $1;
        }
    }
    | { $$ = NULL; } // empty

// Rule to match a variable declaration. `Type id;`
VarDeclaration: Type id SCOLON {
        VAR_DECLARATION(declaration, $1, $2)
        $$ = declaration;
    }

// List of non static method declaration
MethodList: MethodDeclaration MethodList { $1->next = $2; $$ = $1; }
    | { $$ = NULL; } // empty

// Rule to match a method declaration
MethodDeclaration: PUBLIC Type id LPAREN MethodParamThis RPAREN LBLOCK VarList StatementList RETURN Exp SCOLON RBLOCK {
    METHOD_DECLARATION(method, $2, $3, $5, $8, $9, $11)
    $$ = method;
}

// All method params. method(arg1, arg2, ...)

// methods(this, arg1, arg2). Append `this` (parent class) to method parameters. Used for CodeGen
MethodParamThis: MethodParams {
    VAR_DECLARATION_THIS(declaration)
    declaration->next = $1;
    $$ = declaration;
}

MethodParams: Type id MethodParamsRest {
        VAR_DECLARATION(declaration, $1, $2)
        declaration->next = $3;
        $$ = declaration;
    }
    | { $$ = NULL; } // empty

MethodParamsRest: COMMA Type id MethodParamsRest{
        VAR_DECLARATION(declaration, $2, $3)
        declaration->next = $4;
        $$ = declaration;
    }
    | { $$ = NULL; } // empty

Type: INT LBRACK RBRACK { TYPE(type, VAR_INT_ARRAY); $$ = type; }
    | BOOL { TYPE(type, VAR_BOOL); $$ = type; }
    | INT { TYPE(type, VAR_INT); $$ = type; }
    | id { CLASS(type, $1); $$ = type; }

// List of statements found in a Method
StatementList: Statement StatementList { $$ = $1; $$->next = $2; }
    | { $$ = NULL; } // empty

// Rules to match different types of statements
Statement: LBLOCK StatementList RBLOCK {
        STATEMENT(statement, BLOCK, stmt_list = $2)
        $$ = statement;
    }
    | IF LPAREN Exp RPAREN Statement ELSE Statement {
        STATEMENT(statement, IF_ELSE, cond = $3)
        statement->true_branch = $5;
        statement->false_branch = $7;
        $$ = statement;
    }
    | WHILE LPAREN Exp RPAREN Statement {
        STATEMENT(statement, WHILE_STMT, cond = $3)
        statement->while_branch = $5;
        $$ = statement;
    }
    | PRINT LPAREN Exp RPAREN SCOLON {
        STATEMENT(statement, SYS_OUT, expr = $3)
        $$ = statement;
    }
    | id ASSIGN Exp SCOLON {
        STATEMENT(statement, VAR_ASSIGN, id = $1)
        statement->assign_expr = $3;
        $$ = statement;
    }
    | id LBRACK Exp RBRACK ASSIGN Exp SCOLON {
        STATEMENT(statement, ARRAY_ASSIGN, id = $1)
        statement->array_index = $3;
        statement->assign_expr = $6;
        $$ = statement;
    }

// Rules to match different expressions in a statement or return from a MethodDeclarationaration.
Exp: Exp AND Exp {
        EXPR_EMPTY(exp, BINOP)
        exp->lhs = $1;
        exp->oper = AND;
        exp->rhs = $3;
        $$ = exp;
    }
    | Exp LESS Exp {
        EXPR_EMPTY(exp, BINOP)
        exp->lhs = $1;
        exp->oper = LESS;
        exp->rhs = $3;
        $$ = exp;
    }
    | Exp PLUS Exp {
        EXPR_EMPTY(exp, BINOP)
        exp->lhs = $1;
        exp->oper = PLUS;
        exp->rhs = $3;
        $$ = exp;
    }
    | Exp MINUS Exp {
        EXPR_EMPTY(exp, BINOP)
        exp->lhs = $1;
        exp->oper = MINUS;
        exp->rhs = $3;
        $$ = exp;
    }
    | Exp MULT Exp {
        EXPR_EMPTY(exp, BINOP)
        exp->lhs = $1;
        exp->oper = MULT;
        exp->rhs = $3;
        $$ = exp;
    }
    | Exp LBRACK Exp RBRACK {
        EXPR(exp, ARRAY_INDEX, array = $1)
        exp->array_index = $3;
        $$ = exp;
    }
    | Exp PERIOD LENGTH {
        EXPR(exp, ARRAY_LENGTH, expr = $1)
        $$ = exp;
    }
    | Exp PERIOD id LPAREN ExpList RPAREN {
        EXPR_EMPTY(exp, METHOD_CALL)
        exp->object = $1;
        exp->method = $3;
        exp->exp_list = $5;
        $$ = exp;
    }
    | INTEGER {
        EXPR(exp, INT_CONST, int_const = $1);
        $$ = exp;
    }
    | TRUE {
        EXPR(exp, BOOL_CONST, bool_const = true)
        $$ = exp;
    }
    | FALSE {
        EXPR(exp, BOOL_CONST, bool_const = false)
        $$ = exp;
    }
    | id {
        EXPR(exp, VARNAME, id = $1);
        $$ = exp;
    }
    | THIS {
        EXPR_EMPTY(exp, THIS_PTR)
        $$ = exp;
    }
    // Non-terminal to disallow multidim arrays
    | NewIntArray { $$ = $1; }
    | NEW id LPAREN RPAREN {
        EXPR(exp, NEW_CLASS, id=$2)
        $$ = exp;
    }
    | NOT Exp {
        EXPR(exp, NOT_EXPR, expr=$2)
        $$ = exp;
    }
    | LPAREN Exp RPAREN { $$ = $2; }

// Rules matches exmaple: `new int[3]`
NewIntArray: NEW INT LBRACK Exp RBRACK Multidim {
        // `new int[3][2]` results in an error
        if($6 != NULL)
            error_message(yylineno, "MiniJava doesn't support multidimensional arrays.");
        EXPR(exp, NEW_INT_ARRAY, expr = $4)
        $$ = exp;
    }

// If this rule is matched that means `new int[3]` has another dimension `[2]` resulting in an error
Multidim: LBRACK Exp RBRACK Multidim { $$ = (ast_expr *) 1; }
    | { $$ = NULL; } // empty

ExpList: Exp ExpRestList {
        $$ = $1;
        $$->next = $2;
    }
    | { $$ = NULL; } // empty

ExpRestList: ExpRest ExpRestList {
        $$ = $1;
        $$->next = $2;
    }
    | { $$ = NULL; } // empty

ExpRest: COMMA Exp { $$ = $2; }
