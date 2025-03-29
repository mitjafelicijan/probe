# Requires: sudo dnf install lua-devel luajit-devel

all: normal jit embedded

normal:
	bash -c "time lua fibonacci.lua && echo"

jit:
	luajit -b fibonacci.lua fibonacci.luac
	bash -c "time luajit fibonacci.luac && echo"

embedded:
	cc -o fibonacci fibonacci.c `pkg-config --cflags --libs luajit`
	bash -c "time ./fibonacci && echo"

clean:
	@rm fibonacci fibonacci.luac
