#ifndef CODEGEN_H
#define CODEGEN_H

#include <llvm/ADT/ArrayRef.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/PassManager.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/IRBuilder.h>
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/raw_os_ostream.h"

#include <string>
#include <iostream>
#include <fstream> 
#include <map>
#include "main.h"

using namespace llvm;

void makeProgram(ast_program ast);
void makeClassHeader(Module* mod,ast_classdecl *classDecl,std::map<std::string,ConstantInt*> &classFields);
void makeClassBody(Module* mod,ast_classdecl *classDecl,std::map<std::string,Value*> &varScope,std::map<std::string,ConstantInt*> &classFields);
void makeMethodHeaders(Module* mod, ast_methoddecl* methodDecl);
void makeMethodBody(Module* mod, ast_methoddecl* methodDecl,std::map<std::string,Value*> &varScope,std::map<std::string,ConstantInt*> &classFields);
BasicBlock* makeVarDeclaration(Module* mod, ast_vardecl* varDecl,std::map<std::string,Value*> &varScope, Function* parentFunc = nullptr, BasicBlock* parentBB = nullptr);
BasicBlock* makeStatement(Module* mod,ast_stmt* stmt, std::map<std::string,Value*> &varScope, Function* parentFunc=nullptr, BasicBlock* parentBB=nullptr,std::map<std::string,ConstantInt*> *classFields = nullptr);
std::tuple<Value*,BasicBlock*> makeExpression(Module* mod, ast_expr* expr,std::map<std::string,Value*> &varScope, Function* parentFunc = nullptr, BasicBlock* parentBB = nullptr,std::map<std::string,ConstantInt*> *classFields = nullptr);
Type* makeType(Module* mod, ast_type typeToMake);
void attachNewBasicBlock(Module* mod, BasicBlock* parentBB, BasicBlock* &bbToAttach);

#endif