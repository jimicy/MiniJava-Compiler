#include "CodeGen.h"

//Global scope tracking dictionaries
std::map<std::string,StructType*> classScope = {};
std::map<std::string,Value*> methodScope = {};

// Takes an ast as a paramater and emits an LLVM IR version of the represented program.
void makeProgram(ast_program ast){	
	//Creating a global llvm ir module to store the program in
	std::string filename(ast.main_class.id);
	filename = filename + ".ll";
	Module* mod = new Module(filename, getGlobalContext());

	// Creating header for the main function, it takes no arguments and returns a void type
	// Note that the string array parameter normally passed to a java main function does not exist in minijava, and is syntactic sugar
	FunctionType* funcType = FunctionType::get(ArrayType::getVoidTy(getGlobalContext()), false);
	Function* main = Function::Create(funcType, Function::ExternalLinkage, "main", mod);
	BasicBlock* entry = BasicBlock::Create(mod->getContext(), "entry", main);
	
	//We use varScope to store references to declared variables in any given scope
	std::map<std::string,Value*> varScope = {};

	//Here we publically exposing the c printf function for use in our code
	std::vector<Type*>FuncTy_5_args;
	FuncTy_5_args.push_back(PointerType::get(IntegerType::get(mod->getContext(), 8), 0));
	Function* func_printf = mod->getFunction("printf");
	if (!func_printf) {
		func_printf = Function::Create(FunctionType::get(IntegerType::get(mod->getContext(), 32),FuncTy_5_args,true),GlobalValue::ExternalLinkage,"printf", mod);
		func_printf->setCallingConv(CallingConv::C);
	}
	AttributeSet func_printf_PAL;
	{
	 SmallVector<AttributeSet, 4> Attrs;
	 AttributeSet PAS;
	  {
	   AttrBuilder B;
	   PAS = AttributeSet::get(mod->getContext(), ~0U, B);
	  }
	 Attrs.push_back(PAS);
	 func_printf_PAL = AttributeSet::get(mod->getContext(), Attrs);
	}
	func_printf->setAttributes(func_printf_PAL);


	//Here we publically exposing the c znam/new int[] function for use in our code
	std::vector<Type*>znmArgs;
	znmArgs.push_back(IntegerType::get(mod->getContext(), 64));
	FunctionType* znmHeader = FunctionType::get(PointerType::get(IntegerType::get(mod->getContext(), 8), 0),znmArgs,false);

	Function* func__Znam = mod->getFunction("_Znam");
	if (!func__Znam) {
	func__Znam = Function::Create(znmHeader,GlobalValue::ExternalLinkage,"_Znam", mod);
	func__Znam->setCallingConv(CallingConv::C);
	}
	AttributeSet func__Znam_PAL;
	{
	 SmallVector<AttributeSet, 4> Attrs;
	 AttributeSet PAS;
	  {
	   AttrBuilder B;
	   B.addAttribute(Attribute::NoAlias);
	   PAS = AttributeSet::get(mod->getContext(), 0U, B);
	  }
	 
	 Attrs.push_back(PAS);
	 {
	  AttrBuilder B;
	  PAS = AttributeSet::get(mod->getContext(), ~0U, B);
	 }
	
	Attrs.push_back(PAS);
	func__Znam_PAL = AttributeSet::get(mod->getContext(), Attrs);
	
	}
	func__Znam->setAttributes(func__Znam_PAL);

	//Here we publically exposing the c znam/new object function for use in our code
	Function* func__Znwm = mod->getFunction("_Znwm");
	if (!func__Znwm) {
	func__Znwm = Function::Create(znmHeader,GlobalValue::ExternalLinkage,"_Znwm", mod); // (external, no body)
	func__Znwm->setCallingConv(CallingConv::C);
	}
	AttributeSet func__Znwm_PAL;
	{
	 SmallVector<AttributeSet, 4> Attrs;
	 AttributeSet PAS;
	  {
	   AttrBuilder B;
	   B.addAttribute(Attribute::NoAlias);
	   PAS = AttributeSet::get(mod->getContext(), 0U, B);
	  }
	 
	 Attrs.push_back(PAS);
	 {
	  AttrBuilder B;
	  PAS = AttributeSet::get(mod->getContext(), ~0U, B);
	 }
	
	Attrs.push_back(PAS);
	func__Znwm_PAL = AttributeSet::get(mod->getContext(), Attrs);
	
	}
	func__Znwm->setAttributes(func__Znwm_PAL);


	//Exposing llvms memory management function for use with znwm
	Function* func_memset = mod->getFunction("llvm.memset.p0i8.i64");
	std::vector<Type*>memsetTypeArgs;
	memsetTypeArgs.push_back(PointerType::get(IntegerType::get(mod->getContext(), 8), 0));
	memsetTypeArgs.push_back(IntegerType::get(mod->getContext(), 8));
	memsetTypeArgs.push_back(IntegerType::get(mod->getContext(), 64));
	memsetTypeArgs.push_back(IntegerType::get(mod->getContext(), 32));
	memsetTypeArgs.push_back(IntegerType::get(mod->getContext(), 1));
	FunctionType* memsetType = FunctionType::get(Type::getVoidTy(mod->getContext()),memsetTypeArgs,false);
	if (!func_memset) {
	func_memset = Function::Create(memsetType,GlobalValue::ExternalLinkage,"llvm.memset.p0i8.i64", mod); // (external, no body)
	func_memset->setCallingConv(CallingConv::C);
	}
	AttributeSet func_memset_PAL;
	{
	 SmallVector<AttributeSet, 4> Attrs;
	 AttributeSet PAS;
	  {
	   AttrBuilder B;
	   B.addAttribute(Attribute::NoCapture);
	   PAS = AttributeSet::get(mod->getContext(), 1U, B);
	  }
	 
	 Attrs.push_back(PAS);
	 {
	  AttrBuilder B;
	  B.addAttribute(Attribute::NoUnwind);
	  PAS = AttributeSet::get(mod->getContext(), ~0U, B);
	 }

	Attrs.push_back(PAS);
	func_memset_PAL = AttributeSet::get(mod->getContext(), Attrs);

	}
	func_memset->setAttributes(func_memset_PAL);

	//Saving references to exposed functions
	methodScope["C:: printf"] = func_printf;
	methodScope["C:: znam"] = func__Znam;
	methodScope["C:: znwm"] = func__Znwm;
	methodScope["llvm:: memset"] = func_memset;

	//--- Begin calls to delegate functions for parsing of AST ---


	std::map<std::string,ConstantInt*> classFields = {};

	//Calling delegate functions to construct code for the classes that follow the main class
	ast_classdecl* classToDeclare = ast.class_list;
	while (classToDeclare!=nullptr){
		makeClassHeader(mod,classToDeclare,classFields);
		classToDeclare = classToDeclare->next;
	}

	classToDeclare = ast.class_list;
	while (classToDeclare!=nullptr){
		std::map<std::string,Value*> newScope = varScope;
		makeClassBody(mod,classToDeclare,newScope,classFields);
		classToDeclare = classToDeclare->next;
	}

	// Calling delegate functions to construct main method of main class
	ast_vardecl* varDecl = ast.main_class.method->var_decl;
	BasicBlock* insertPoint = entry;
	while (varDecl != nullptr){
		insertPoint = makeVarDeclaration(mod,varDecl,varScope,main,insertPoint);
		varDecl = varDecl->next;
	}

	ast_stmt* stmt = ast.main_class.method->body;
	
	while (stmt != nullptr){
		insertPoint = makeStatement(mod,stmt,varScope,main,insertPoint);
		stmt = stmt->next;
	}

	//Returning void pointer
	ReturnInst::Create(mod->getContext(), insertPoint);

	//Now we dump the constructed ir code into a file
	std::ofstream outFile(filename);
	raw_os_ostream rawoutFile(outFile);
	mod->print(rawoutFile, nullptr);
}

// Takes an ast for a class and declares it's header properties
// This is separated from makeClassBody so that each class can be referenced from within any class body
void makeClassHeader(Module* mod,ast_classdecl *classDecl,std::map<std::string,ConstantInt*> &classFields){
	std::string classname(classDecl->id);
	classname = "class." +classname;

	//Creating struct for class field storage
	StructType *classStruct = mod->getTypeByName(classname);
	if (!classStruct) {
	classStruct = StructType::create(mod->getContext(), classname);
	}
	classScope[classname] = classStruct;

	//Declaring fields of class
	//In classFields we store the index of the field relative to the class struct
	//Later we can use this in a calculation to retireve the field from the struct

	std::vector<Type*>classStruct_fields;
	int fieldNum = 0;
	ast_vardecl* varDecl = classDecl->fields;
	while (varDecl != nullptr){
		classStruct_fields.push_back(makeType(mod,varDecl->type));
		std::string fieldName(varDecl->id);
		classFields[fieldName] = ConstantInt::get(mod->getContext(), APInt(32, StringRef(std::to_string(fieldNum++)), 10));
		varDecl = varDecl->next;
	}
	if (classStruct->isOpaque()) {
		classStruct->setBody(classStruct_fields,false);
	}

	// Declaring all the method headers, so they may be accessed immediately
	ast_methoddecl* method = classDecl->methods;
	while (method!=nullptr){
		makeMethodHeaders(mod,method);
		method = method->next;
	}
	method = classDecl->methods;
}

// Takes an ast for a class and declares it's methods
void makeClassBody(Module* mod,ast_classdecl *classDecl,std::map<std::string,Value*> &varScope,std::map<std::string,ConstantInt*> &classFields){		
	// Calling delegate functions to declare each method
	ast_methoddecl* method = classDecl->methods;
	while (method!=nullptr){
		makeMethodBody(mod,method,varScope,classFields);
		method = method->next;
	}
}

// Takes an ast for a method and declares it's header properties
// This is separated from makeMethodBody so that each method can be referenced from within any method body
void makeMethodHeaders(Module* mod, ast_methoddecl* methodDecl){		
	
	// Declaring the arguments that this method takes
	std::vector<Type*> args;
	ast_vardecl* param = methodDecl->params;
	while (param!=nullptr){
		args.push_back(makeType(mod,param->type));
		param = param->next;
	}
	FunctionType* funcType = FunctionType::get(makeType(mod,methodDecl->type),args,false);

	// Setting up calling convention for this method
	std::string funcName(methodDecl->id);
	Function* func = mod->getFunction(funcName);
	if (!func) {
		func = Function::Create(funcType,GlobalValue::LinkOnceODRLinkage,funcName, mod); 
		func->setCallingConv(CallingConv::C);
		func->setAlignment(2);
	}
	AttributeSet funcPAL;
	func->setAttributes(funcPAL);

	// Saving a reference to this function so it may be called later
	methodScope[funcName] = func;
}

// Takes an ast_methodDecl and constructs the methods body.
void makeMethodBody(Module* mod, ast_methoddecl* methodDecl,std::map<std::string,Value*> &varScope,std::map<std::string,ConstantInt*> &classFields){		

	//Getting references needed to start attatching to the methods body
	std::string funcName(methodDecl->id);
	Function* func = dynamic_cast<Function*>(methodScope[funcName]);
	BasicBlock* entry = BasicBlock::Create(mod->getContext(), "",func,0);

	//Constructing code for retrieving method params and storing them in a local variable
	ast_vardecl* param = methodDecl->params;
	Function::arg_iterator passedArgs = func->arg_begin();
	while (param!=nullptr){
		Value* paramVal = passedArgs++;
		std::string paramName(param->id);
		paramVal->setName("arg_" + paramName);
		//Delegating the declaration of a local variable for the parameter
		entry = makeVarDeclaration(mod,param,varScope,func,entry);

		// Customized variable assignment, essentially equivelant to the VAR_ASSIGN handler in makeStatemnt
		int numOfBits = paramVal->getType()->getPrimitiveSizeInBits();
		numOfBits = (numOfBits==0)? 64 : numOfBits;//A fix to get the correct number of bits for arrays
		StoreInst* varVal = new StoreInst(paramVal, varScope[paramName], false, entry);
		varVal->setAlignment(numOfBits/8);

		param = param->next;
	}

	// Delegating the construction of variable delarations within the method
	ast_vardecl* varDecl = methodDecl->var_decl;
	BasicBlock* insertPoint = entry;
	while (varDecl != nullptr){
		insertPoint = makeVarDeclaration(mod,varDecl,varScope,func,insertPoint);
		varDecl = varDecl->next;
	}

	// Delegating the construction of statments within the method
	ast_stmt* stmt = methodDecl->body;
	while (stmt != nullptr){
		insertPoint = makeStatement(mod,stmt,varScope,func,insertPoint,&classFields);
		stmt = stmt->next;
	}

	// Retrieving a reference to the return value and constructing code to return it
	Value* retVal;
	std::tie(retVal,insertPoint) = makeExpression(mod,methodDecl->return_expr,varScope,func,insertPoint,&classFields);
	ReturnInst::Create(mod->getContext(), retVal, insertPoint);	
}

// Takes an ast_vardecl and constructs it
BasicBlock* makeVarDeclaration(Module* mod, ast_vardecl* varDecl,std::map<std::string,Value*> &varScope, Function* parentFunc, BasicBlock* parentBB ){			

	// First we attach a new basicblock that we can append our instructions to
	BasicBlock* declaration = BasicBlock::Create(mod->getContext(), "", parentFunc);
	attachNewBasicBlock(mod,parentBB,declaration);

	// Getting the variable type that needs to be declared
	Type* declType = makeType(mod,varDecl->type);
	int numOfBits = declType->getPrimitiveSizeInBits();

	// Allocating space for our new variable and storing a reference to it in the scope
	std::string varNameToDeclare(varDecl->id);
	AllocaInst* ptr_var = new AllocaInst(declType, varNameToDeclare, declaration);
	ptr_var->setAlignment(numOfBits/8);
	varScope[varNameToDeclare] = ptr_var;

	return declaration;
}

// Takes an ast_stmt and consturcts it
// Returns a reference to a basicblock that subsequent code can be attatched to
BasicBlock* makeStatement(Module* mod,ast_stmt* stmt, std::map<std::string,Value*> &varScope, Function* parentFunc, BasicBlock* parentBB,std::map<std::string,ConstantInt*> *classFields){			
	
	// First we attach a new basicblock that we can append our instructions to
	BasicBlock* statement;
	statement = BasicBlock::Create(mod->getContext(), "", parentFunc);
	attachNewBasicBlock(mod,parentBB,statement);

	// Based on the type of the statement, we will construct that kind of statement
	ast_stmt_type stmtType = stmt->type;
	switch(stmtType){
		// Statement of form {stmt*}
		case BLOCK:{
			// Constructs a new scope and recursively makes statements under that scope	
			// We invoke the copy constructor to create a new scope that may be modified
			std::map<std::string,Value*> newScope = varScope;
			ast_stmt* subStmt = stmt->stmt_list;
			BasicBlock* tmpBlock = statement;
			while (subStmt!=nullptr){
				tmpBlock = makeStatement(mod,subStmt,newScope,parentFunc,tmpBlock,classFields);
				subStmt = subStmt->next;
			}	
			return tmpBlock;
			break;
		}
		// Statement of form if (expr) stmt else stmt
		case IF_ELSE:{		
			// First we construct code to retireve the condition	
			Value* cond;
			std::tie(cond,statement) = makeExpression(mod,stmt->cond,varScope,parentFunc,statement,classFields);

			// We evaluate the condition, and decide which block to branch to
			CastInst* condAsI1 = new TruncInst(cond, IntegerType::get(mod->getContext(), 1), "", statement);
			BasicBlock* thenBlock = BasicBlock::Create(mod->getContext(), "",parentFunc);
			BasicBlock* elseBlock = BasicBlock::Create(mod->getContext(), "",parentFunc);
			BranchInst::Create(thenBlock, elseBlock, condAsI1, statement);
			
			// Constructing the statements inside of each respective branch
			BasicBlock* endOfThen = makeStatement(mod,stmt->true_branch,varScope,parentFunc,thenBlock,classFields);
			BasicBlock* endOfElse = makeStatement(mod,stmt->false_branch,varScope,parentFunc,elseBlock,classFields);

			//Returning control flow to after if statement
			BasicBlock* stmtExit = BasicBlock::Create(mod->getContext(),"",parentFunc);
			attachNewBasicBlock(mod,endOfElse,stmtExit);
			attachNewBasicBlock(mod,endOfThen,stmtExit);		
			return stmtExit;
			break;
		}
		//Statement of form while (Expr) statement
		case WHILE_STMT:{	
			// First we construct code to retireve the condition		
			BasicBlock* condBlock = BasicBlock::Create(mod->getContext(), "",parentFunc);
			attachNewBasicBlock(mod,statement,condBlock);
			Value* cond;
			BasicBlock* tempBlock;
			std::tie(cond,tempBlock) = makeExpression(mod,stmt->cond,varScope,parentFunc,condBlock,classFields);

			// We evaluate the condition, and decide which block to branch to
			CastInst* condAsI1 = new TruncInst(cond, IntegerType::get(mod->getContext(), 1), "", tempBlock);
			BasicBlock* trueBlock = BasicBlock::Create(mod->getContext(), "",parentFunc);
			// The false block is where we go if the cond evaluates to false and the loop is exited
			BasicBlock* falseBlock = BasicBlock::Create(mod->getContext(), "",parentFunc);
			BranchInst::Create(trueBlock, falseBlock, condAsI1, tempBlock);
			
			//Constructing statements within the while loop
			BasicBlock* endOfTrue = makeStatement(mod,stmt->true_branch,varScope,parentFunc,trueBlock,classFields);
			//Sending control flow back to the condition
			attachNewBasicBlock(mod,endOfTrue,condBlock);
			
			return falseBlock;
			break;
		}
		//Statement of form System.out.println(expr)
		case SYS_OUT:{	
			//Constructing code to retrieve value to be printed		
			Value* valToPrint;
			std::tie(valToPrint,statement) = makeExpression(mod,stmt->expr,varScope,parentFunc,statement,classFields);

			// Setting up code to call native printf
			GlobalVariable* globalString = new GlobalVariable(*mod,ArrayType::get(IntegerType::get(mod->getContext(), 8), 4),true,GlobalValue::PrivateLinkage,0,".str");
			globalString->setAlignment(1);
			Constant *formatStringArray = ConstantDataArray::getString(mod->getContext(), "%d\x0A", true);
			std::vector<Constant*> indices;
			ConstantInt* zeroInt = ConstantInt::get(mod->getContext(), APInt(32, StringRef("0"), 10));
			indices.push_back(zeroInt);
			indices.push_back(zeroInt);
			// Retrieving the already declared format string used for printing ints
			Constant* formatString = ConstantExpr::getGetElementPtr(globalString, indices);			
			globalString->setInitializer(formatStringArray);			
			std::vector<Value*> printfParams;
			printfParams.push_back(formatString);
			//Inserting the val to be printed
			printfParams.push_back(valToPrint);
			//Performing printf call
			CallInst* printFCall = CallInst::Create(methodScope["C:: printf"], printfParams, "", statement);
			printFCall->setCallingConv(CallingConv::C);
			printFCall->setTailCall(false);
			AttributeSet callAttrs;
			printFCall->setAttributes(callAttrs);				
			return statement;
			break;
		}
		//Statement of form identifier = expression;	
		case VAR_ASSIGN:{	
			//Retrieving the value to be assigned	
			std::string varName(stmt->id);
			Value* valToStore;
			std::tie(valToStore,statement) = makeExpression(mod,stmt->assign_expr,varScope,parentFunc,statement,classFields);

			int numOfBits = valToStore->getType()->getPrimitiveSizeInBits();
			numOfBits = (numOfBits==0)? 64 : numOfBits;//A fix to get the correct number of bits for arrays
			// Here he search for the identifier in the variable scope, then the class fields, and finally if that fails we produce an error
			Value* varRef = nullptr;
			if (varScope.find(varName)==varScope.end()){
				if ((*classFields)[varName]!=nullptr){
					//Using this and the offset stored in classfields to retrieve a reference to the field
					LoadInst* ptr_this = new LoadInst(varScope["this"], "", false, statement);
					std::vector<Value*> indices;
					indices.push_back(ConstantInt::get(mod->getContext(), APInt(32, StringRef("0"), 10)));
					indices.push_back((*classFields)[varName]);
					varRef = GetElementPtrInst::Create(ptr_this, indices, "", statement);
				}else{
					error_message(stmt->lineno,"cannot find symbol: %s",stmt->id);
				}
			}else{
				varRef = varScope[varName];
			}
			// Instructions to actually store the value in the memory pointed to by the variable
			StoreInst* varVal = new StoreInst(valToStore, varRef, false, statement);
			varVal->setAlignment(numOfBits/8);			
			return statement;
			break;
		}
		//Statement of form id[expr] = expression	
		case ARRAY_ASSIGN:{
			//Evaluating the expressions to be used in assignment		
			std::string varName(stmt->id);
			Value* indice;
			std::tie(indice,statement) = makeExpression(mod,stmt->array_index,varScope,parentFunc,statement,classFields);
			Value* valToStore;
			std::tie(valToStore,statement) = makeExpression(mod,stmt->assign_expr,varScope,parentFunc,statement,classFields);

			//In our implementation of arrays the first index is the length of the array and all other elements are offset
			//Therefore we always add 1 to the requested index
			indice = BinaryOperator::Create(Instruction::Add, indice, ConstantInt::get(mod->getContext(), APInt(32, StringRef("1"), 10)), "", statement);
			// Here he search for the identifier in the variable scope, then the class fields, and finally if that fails we produce an error
			Value* varRef = nullptr;
			if (varScope.find(varName)==varScope.end()){
				if ((*classFields)[varName]!=nullptr){
					//Using this and the offset stored in classfields to retrieve a reference to the field
					LoadInst* ptr_this = new LoadInst(varScope["this"], "", false, statement);
					std::vector<Value*> indices;
					indices.push_back(ConstantInt::get(mod->getContext(), APInt(32, StringRef("0"), 10)));
					indices.push_back((*classFields)[varName]);
					varRef = GetElementPtrInst::Create(ptr_this, indices, "", statement);
				}else{
					error_message(stmt->lineno,"cannot find symbol: %s",stmt->id);
				}
			}else{
				varRef = varScope[varName];
			}

			//Getting reference to element that needs to be assigned to
			LoadInst* arrPointer = new LoadInst(varRef, "", false, statement);
			arrPointer->setAlignment(8);
			GetElementPtrInst* elementPointer = GetElementPtrInst::Create(arrPointer, indice, "", statement);

			// Instructions to actually store the value in the memory pointed to by the element
			StoreInst* storedElement = new StoreInst(valToStore, elementPointer, false, statement);
			storedElement->setAlignment(4);			
			return statement;
			break;
		}
		default:{
			break;
		}
	}
	//In any other case we return an empty statement
	return statement;
}

//Takes an ast_expr and returns a Value corresponding to the expressions evaluation
std::tuple<Value*,BasicBlock*> makeExpression(Module* mod, ast_expr* expr,std::map<std::string,Value*> &varScope, Function* parentFunc, BasicBlock* parentBB,std::map<std::string,ConstantInt*> *classFields){		
	// First we attach a new basicblock that we can append our instructions to
	BasicBlock* expression;
	if (parentFunc!=nullptr && parentBB!=nullptr){
		expression = BasicBlock::Create(mod->getContext(), "", parentFunc);
		attachNewBasicBlock(mod,parentBB,expression);
	}

	// Based on the expression type, we will evaluate that kind of expression
	Value* exprToReturn = nullptr;
	ast_expr_type exprType = expr->type;
	switch(exprType){
		//integer_literal
		case INT_CONST:{		
			//Creating an int constant value	
			std::string valToMake = std::to_string((int)expr->int_const);
			exprToReturn = ConstantInt::get(mod->getContext(), APInt(32, StringRef(valToMake), 10));			
			break;
		}
		//boolean_literal
		case BOOL_CONST:{	
			//Creating an bool constant value		
			std::string valToMake = expr->bool_const ? "1" : "0";
			exprToReturn = ConstantInt::get(mod->getContext(), APInt(8, StringRef(valToMake), 10));			
			break;
		}
		// expr  ( "&&" | "<" | "+" | "-" | "*" ) expr
		case BINOP:{				
			// First we figure out which binop this will be	
			Instruction::BinaryOps opType;
			switch(expr->oper){
				case PLUS://+
					opType = Instruction::Add;
					break;
				case MINUS://-
					opType = Instruction::Sub;
					break;
				case MULT://*
					opType = Instruction::Mul;
					break;
				case AND://&&
					opType = Instruction::And;
					break;
				case LESS://<
					// This case is handled below
					break;

			}

			//Now we get the left and right operand expressions
			Value* leftExpr;
			std::tie(leftExpr,expression) = makeExpression(mod,expr->lhs,varScope,parentFunc,expression,classFields);
			Value* rightExpr;
			std::tie(rightExpr,expression) = makeExpression(mod,expr->rhs,varScope,parentFunc,expression,classFields);
			
			//Finally we create teh instruction for the operation
			if (expr->oper!=LESS){				
				exprToReturn = BinaryOperator::Create(opType, leftExpr, rightExpr, "", expression);
			}else{				
				ICmpInst* comparison = new ICmpInst(*expression, ICmpInst::ICMP_SLT, leftExpr, rightExpr, "");
  				exprToReturn = new ZExtInst(comparison, IntegerType::get(mod->getContext(), 8), "", expression);
			}			
			break;
		}
		//!expr
		case NOT_EXPR:{
			//Retrieving the bool expr to be not-ed
			Value* boolExpr;
			std::tie(boolExpr,expression) = makeExpression(mod,expr->expr,varScope,parentFunc,expression,classFields);

			//Performing negate instruction using an xor
			CastInst* truncdBool = new TruncInst(boolExpr, IntegerType::get(mod->getContext(), 1), "", expression);
			BinaryOperator* negatedBool = BinaryOperator::Create(Instruction::Xor, truncdBool, ConstantInt::get(mod->getContext(), APInt(1, StringRef("-1"), 10)), "", expression);
			exprToReturn = new ZExtInst(negatedBool, IntegerType::get(mod->getContext(), 8), "", expression);			
			break;
		}
		//new int[expr]
		case NEW_INT_ARRAY:{
			//First we get the requested array size
			Value* arrSize;
			std::tie(arrSize,expression) = makeExpression(mod,expr->expr,varScope,parentFunc,expression,classFields);

			//In our implementation the length of an array is stored as its first element, with the others ofset by 1
			//Therefore, we will increase the array size by 1
			Value* arrSizePlusOne = BinaryOperator::Create(Instruction::Add, arrSize, ConstantInt::get(mod->getContext(), APInt(32, StringRef("1"), 10)), "", expression);
			//To allocate the space for the array, we must multiply the size number by 4.
			Value* arrSizePlusOneTimeFour = BinaryOperator::Create(Instruction::Mul, arrSizePlusOne, ConstantInt::get(mod->getContext(), APInt(32, StringRef("4"), 10)), "", expression);
			arrSizePlusOneTimeFour = new SExtInst(arrSizePlusOneTimeFour, IntegerType::get(mod->getContext(), 64), "", expression);
			//Now we ask znam to allocate our new int array
			CallInst* znamCall = CallInst::Create(methodScope["C:: znam"], arrSizePlusOneTimeFour, "", expression);
			znamCall->setCallingConv(CallingConv::C);
			znamCall->setTailCall(false);
			AttributeSet znamCallPAL;
			{
			 SmallVector<AttributeSet, 4> Attrs;
			 AttributeSet PAS;
			  {
			   AttrBuilder B;
			   B.addAttribute(Attribute::NoAlias);
			   PAS = AttributeSet::get(mod->getContext(), 0U, B);
			  }
			 
			 Attrs.push_back(PAS);
			 {
			  AttrBuilder B;
			  PAS = AttributeSet::get(mod->getContext(), ~0U, B);
			 }

			Attrs.push_back(PAS);
			znamCallPAL = AttributeSet::get(mod->getContext(), Attrs);

			}
			znamCall->setAttributes(znamCallPAL);

			//Getting a pointer to the new array
			exprToReturn = new BitCastInst(znamCall, PointerType::get(IntegerType::get(mod->getContext(), 32), 0), "newint", expression);
			
			//Storing the array index in the zeroith element
			Value* zeroIndex = ConstantInt::get(mod->getContext(), APInt(32, StringRef("0"), 10));
			GetElementPtrInst* elementPointer = GetElementPtrInst::Create(exprToReturn, zeroIndex, "", expression);
			StoreInst* storedElement = new StoreInst(arrSize, elementPointer, false, expression);
			storedElement->setAlignment(4);			
			break;
		}
		//new id()
		case NEW_CLASS:{
			//First we ask znwm to allocate space for a new object of type class
			std::string typeName(expr->id);			
			Constant* sizeToAllocate = ConstantExpr::getSizeOf(classScope["class." + typeName]);			
			CallInst* newCall = CallInst::Create(methodScope["C:: znwm"], sizeToAllocate, "", expression);
			newCall->setCallingConv(CallingConv::C);
			newCall->setTailCall(false);
			AttributeSet newCall_PAL;
			{
			 SmallVector<AttributeSet, 4> Attrs;
			 AttributeSet PAS;
			  {
			   AttrBuilder B;
			   B.addAttribute(Attribute::NoAlias);
			   PAS = AttributeSet::get(mod->getContext(), 0U, B);
			  }
			 
			 Attrs.push_back(PAS);
			 {
			  AttrBuilder B;
			  PAS = AttributeSet::get(mod->getContext(), ~0U, B);
			 }
			
			Attrs.push_back(PAS);
			newCall_PAL = AttributeSet::get(mod->getContext(), Attrs);
			
			}
			newCall->setAttributes(newCall_PAL);	

			// Saving a pointer to the new object
			exprToReturn = new BitCastInst(newCall, PointerType::get(classScope["class." + typeName], 0), "", expression);

			//Calling llvm.memset for the new memory the object will be using
			std::vector<Value*> memsetParams;
			memsetParams.push_back(newCall);
			memsetParams.push_back(ConstantInt::get(mod->getContext(), APInt(8, StringRef("0"), 10)));
			memsetParams.push_back(sizeToAllocate);
			memsetParams.push_back(ConstantInt::get(mod->getContext(), APInt(32, StringRef("8"), 10)));
			memsetParams.push_back(ConstantInt::get(mod->getContext(), APInt(1, StringRef("0"), 10)));
			CallInst* memsetCall = CallInst::Create(methodScope["llvm:: memset"], memsetParams, "", expression);
			memsetCall->setCallingConv(CallingConv::C);
			memsetCall->setTailCall(false);
			AttributeSet memsetCall_PAL;
			memsetCall->setAttributes(memsetCall_PAL);			
			break;
		}
		//expr.length
		case ARRAY_LENGTH:{
			//First we get a pointer to the zeroith element of the array	
			Value* arrToAccess;
			std::tie(arrToAccess,expression) = makeExpression(mod,expr->expr,varScope,parentFunc,expression,classFields);
			Value* zeroIndex = ConstantInt::get(mod->getContext(), APInt(32, StringRef("0"), 10));
			GetElementPtrInst* elementPointer = GetElementPtrInst::Create(arrToAccess, zeroIndex, "", expression);
			//Then we retrieve the size value that is stored at the elemenet, as per the NEW_INT_ARRAY case
			LoadInst* elementAccessed = new LoadInst(elementPointer, "", false, expression);
			elementAccessed->setAlignment(4);
			exprToReturn = elementAccessed;			
			break;
		}
		//expr[expr]
		case ARRAY_INDEX:{
			//First we get the relevent expressions	
			Value* arrToAccess;
			std::tie(arrToAccess,expression) = makeExpression(mod,expr->array,varScope,parentFunc,expression,classFields);
			Value* indexToAccess;
			std::tie(indexToAccess,expression) = makeExpression(mod,expr->array_index,varScope,parentFunc,expression,classFields);
			
			//As the first element is the size of the array, we offset all accesses by 1 so they access the correct element.
			indexToAccess = BinaryOperator::Create(Instruction::Add, indexToAccess, ConstantInt::get(mod->getContext(), APInt(32, StringRef("1"), 10)), "", expression);

			//Retrieving the value at the index
			GetElementPtrInst* elementPointer = GetElementPtrInst::Create(arrToAccess, indexToAccess, "", expression);
			LoadInst* elementAccessed = new LoadInst(elementPointer, "", false, expression);
			elementAccessed->setAlignment(4);
			exprToReturn = elementAccessed;			
			break;
		}
		//'this'
		case THIS_PTR:		
			//We simply treate this like any other varname, but first we must set the identifier	
			expr->id = "this";
		//ident
		case VARNAME:{			
			std::string varName(expr->id);
			// Here he search for the identifier in the variable scope, then the class fields, and finally if that fails we produce an error
			Value* varRef = nullptr;
			if (varScope.find(varName)==varScope.end()){
				if ((*classFields)[varName]!=nullptr){ 
					//Using this and the offset stored in classfields to retrieve a reference to the field
					LoadInst* ptr_this = new LoadInst(varScope["this"], "", false, expression);
					std::vector<Value*> indices;
					indices.push_back(ConstantInt::get(mod->getContext(), APInt(32, StringRef("0"), 10)));
					indices.push_back((*classFields)[varName]);
					varRef = GetElementPtrInst::Create(ptr_this, indices, "", expression);
				}else{
					error_message(expr->lineno,"cannot find symbol: %s",expr->id);
				}
			}else{
				varRef = varScope[varName];
			}
			//Loading the value stored at varRef
			LoadInst* retrievedVal = new LoadInst(varRef, "", false, expression);
			retrievedVal->setAlignment(4);
			exprToReturn = retrievedVal;			
			break;
		}
		//expr.id(vardelcs)
		case METHOD_CALL:{			
			//First we get the object to be called
			std::string methodName(expr->method);
			std::vector<Value*> params;
			Value* objectVal;
			std::tie(objectVal,expression) = makeExpression(mod,expr->object,varScope,parentFunc,expression,classFields);
			//Pushing all of the parameters to be passed, starting with 'this'
			params.push_back(objectVal);
			ast_expr* param = expr->exp_list;
			while(param!=nullptr){
				Value* paramVal;
				std::tie(paramVal,expression) = makeExpression(mod,param,varScope,parentFunc,expression,classFields);
				params.push_back(paramVal);
				param = param->next;
			}
			//Making the method call
			exprToReturn = CallInst::Create(methodScope[methodName], params, "", expression);			
			break;
		}
		default:
			break;
	}
	return std::make_tuple(exprToReturn,expression);
}

// Takes an ast_type and returns a reference to that type
Type* makeType(Module* mod, ast_type typeToMake){		
	Type* typeObject;

	//We match and create an reference to the requested type
	switch(typeToMake.type){
		//int	
		case VAR_INT:{		
			typeObject = IntegerType::get(mod->getContext(), 32);
			break;
		}
		//boolean
		case VAR_BOOL:{			
			typeObject = IntegerType::get(mod->getContext(), 8);
			break;
		}
		//int[]
		case VAR_INT_ARRAY:{		
			typeObject = PointerType::get(IntegerType::get(mod->getContext(), 32), 0);
			break;
		}
		//identifier
		case VAR_CLASS:{
			//Retreiving the structtype associated with the requested classtype	
			std::string classname(typeToMake.classname);
			classname = "class." +classname;			
			typeObject = PointerType::get(classScope[classname], 0);
			break;
		}
		default:{
			typeObject = nullptr;
			break;
		}
	}
	return typeObject;
}

//Creates a brank from the parant block to the second block
void attachNewBasicBlock(Module* mod, BasicBlock* parentBB, BasicBlock* &bbToAttach){
	IRBuilder<> builder(getGlobalContext());
	builder.SetInsertPoint(parentBB);
	builder.CreateBr(bbToAttach);
}
