{ pkgs ? import <nixpkgs> {} }:
	pkgs.mkShell {
	nativeBuildInputs = with pkgs.buildPackages; [
		binutils
		gnumake
		nasm
		tinycc
    zig
    zls
	];
}
