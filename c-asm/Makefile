all: a.out

sum.o:
	as sum.s -o sum.o

a.out: sum.o
	gcc main.c sum.o

clean:
	-rm a.out *.o

tags:
	ctags -R *
