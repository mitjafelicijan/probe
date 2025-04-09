RAYLIB_VER  := 5.5_linux_amd64
CC          ?= cc
CFLAGS      := -Wall -Wextra -Wunused -Wno-unused-parameter -Wswitch-enum -Wpedantic -Wno-bitwise-instead-of-logical
LDFLAGS     := -I./libs -I./libs/raylib-$(RAYLIB_VER)/include ./libs/raylib-$(RAYLIB_VER)/lib/libraylib.a -lm

game: embed
	$(CC) $(CFLAGS) -o game main.c $(LDFLAGS)

embed:
	xxd -i data/armor.png > data/armor.h
	xxd -i data/dejavusans-mono.ttf > data/dejavusans-mono.h
