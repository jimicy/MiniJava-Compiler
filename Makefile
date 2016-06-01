OBJS = ast.o \
	   parser.o  \
	   CodeGen.o \
	   main.o    \
	   tokens.o  \

LLVMCONFIG = llvm-config-3.6
CPPFLAGS = `$(LLVMCONFIG) --cppflags` -std=c++11 -Wall
LDFLAGS = `$(LLVMCONFIG) --ldflags` -lpthread -ldl -lz -lncurses -rdynamic
LIBS = `$(LLVMCONFIG) --libs`
BISON = /usr/local/Cellar/bison/3.0.4/bin/bison

all: run

parser.cpp: parser.y
	$(BISON) -d -o $@ $^

tokens.cpp: tokens.l parser.hpp
	flex -o $@ $^

%.o: %.cpp
	g++ -c $(CPPFLAGS) -o $@ $<

parser.hpp: parser.cpp

run: parser.cpp parser.hpp tokens.cpp main

main: $(OBJS)
	g++ -o $@ $(OBJS) $(LIBS) $(LDFLAGS)

clean:
	rm -f parser.cpp parser.hpp tokens.cpp main codegen tokens.cpp *.o *.ll \
	BinarySearch BinaryTree BubbleSort Factorial LinearSearch QuickSort

# docco:
# 	docco tokens.l parser.y main.cpp main.h ast.cpp ast.h CodeGen.cpp CodeGen.h