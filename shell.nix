{ pkgs ? import <nixpkgs> {} }:
	pkgs.mkShell {
	nativeBuildInputs = with pkgs.buildPackages; [
		# Compilers and tools.
		binutils
		gnumake
		nasm
		tinycc
		clang
		zig_0_11
		zls

		# Debuggers.
		gdb
		lldb

		# Dev libraries and deps.
		xorg.libX11
		xorg.libX11.dev
	];
}
