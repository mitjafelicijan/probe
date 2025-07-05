all: data.h main

data.h: data.db
	xxd -n data -i data.db > data.h

main: main.c
	clang -Wall -Werror -Wpedantic -o main main.c sqlite3.c

clean:
	-rm main
