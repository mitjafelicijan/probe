#!/usr/bin/env bash

ITERATIONS=120

# Just Lua interpreter
for i in $(seq 1 $ITERATIONS); do
	echo "> lua run #$i/$ITERATIONS"
	/usr/bin/time -f "%e,%U,%S" lua fibonacci.lua > /dev/null 2>> out.lua.txt
done

# Using Luajit
for i in $(seq 1 $ITERATIONS); do
	echo "> luajit run #$i/$ITERATIONS"
	/usr/bin/time -f "%e,%U,%S" luajit fibonacci.lua > /dev/null 2>> out.luajit.txt
done

# With C and Luajit
for i in $(seq 1 $ITERATIONS); do
	echo "> cluajit run #$i/$ITERATIONS"
	/usr/bin/time -f "%e,%U,%S" ./fibonacci > /dev/null 2>> out.cluajit.txt
done
