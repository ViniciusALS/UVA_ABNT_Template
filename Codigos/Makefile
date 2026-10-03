CC     = gcc
CFLAGS = -Wall

calc: lex.yy.o cal.tab.o
	$(CC) -o calc lex.yy.o cal.tab.o

cal.tab.c cal.tab.h: cal.y
	bison -d cal.y

lex.yy.c: cal.l cal.tab.h
	flex cal.l

lex.yy.o: lex.yy.c
	$(CC) $(CFLAGS) -c lex.yy.c

cal.tab.o: cal.tab.c
	$(CC) $(CFLAGS) -c cal.tab.c

debug: CFLAGS += -DDEBUG
debug: clean calc

clean:
	rm -f calc cal.output *.o cal.tab.c cal.tab.h lex.yy.c

.PHONY: clean debug
