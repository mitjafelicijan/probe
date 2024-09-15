{ pkgs ? import <nixpkgs> {} }:
	pkgs.mkShell {
	nativeBuildInputs = with pkgs.buildPackages; [
		# Compilers and tools.
		binutils
		gnumake
		nasm
		tinycc
		clang
		zig
		zls

		# Dev libraries and deps.
		xorg.libX11
		xorg.libX11.dev
	];
}
