OUT      = tcc
TESTFILE = test.c
SCANNER  = scanner.l
PARSER   = parser.y

CC       = g++
OBJ      = lex.yy.o y.tab.o symbol_stack.o
CFLAGS   = -std=c++11
TESTOUT  = $(basename $(TESTFILE)).asm
OUTFILES = lex.yy.c y.tab.c y.tab.h y.output $(OUT)

SYMBOL_STACK_SRC = symbol_stack.cpp
SYMBOL_STACK_OUT = symbol_stack

.PHONY: build test simulate clean

build: $(OUT)

test: $(TESTOUT)

simulate: $(TESTOUT)
	python pysim.py $< -a

clean:
	rm -f *.o $(OUTFILES)

$(TESTOUT): $(TESTFILE) $(OUT)
	./$(OUT) < $< > $@

$(OUT): $(OBJ)
	$(CC) $(CFLAGS) -o $(OUT) $(OBJ)

lex.yy.c: $(SCANNER) y.tab.c
	flex $<

y.tab.c: $(PARSER)
	bison -vdty $<


symbol_stack: $(SYMBOL_STACK_SRC)
	$(CC) $(CFLAGS) -o $(SYMBOL_STACK_OUT) $(SYMBOL_STACK_SRC)