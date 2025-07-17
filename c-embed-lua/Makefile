all: lua hi.h main

lua:
	cd lua-5.4.8 && make

hi.h: hi.lua
	xxd -n hi -i hi.lua > hi.h

main: main.c hi.h
	clang -I./lua-5.4.8/src -Wall -Werror -Wpedantic -o main main.c -lm ./lua-5.4.8/src/liblua.a

clean:
	-rm main
	cd lua-5.4.8 && make clean
