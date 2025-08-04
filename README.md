**Just testing things.**

![true](https://github.com/user-attachments/assets/cbac220e-57a6-4299-8a1d-f5faf8994ce3)

Nothing crazy here. I put little experiments and tests I do here so I can
reference them later if I need to.

> [!NOTE]  
> Check `shell.nix` to see the software and dependencies that are used
> in these examples. If you use Nix just do `nix-shell shell.nix`.

Every test has it's own `Makefile` so please check that before you try
running it.

> [!IMPORTANT]  
> Some of the examples are specific to certain operating systems and
> they will not work everywhere. Take this into account. This code is
> also written in the most explicit way and lacks massively when it
> comes to checking of errors etc.

|                                          | Compiler    | What does it do?                                               |
|------------------------------------------|-------------|----------------------------------------------------------------|
| [c-asm](./c-asm)                         | clang-17    | Calls a function written in ASM from C code.                   |
| [c-embed](./c-embed)                     | clang-17    | Embedding external resources in compiled binary.               |
| [c-signals](./c-signals)                 | clang-17    | Uses SIGUSR1 and SIGUSR2 as IPC mechanism.                     |
| [c-structs](./c-structs)                 | clang-17    | Saves and reads structs in/from binary files.                  |
| [c-httpd](./c-httpd)                     | clang-17    | Simple HTTP server with route handling primer in C.            |
| [zig-c-interop](./zig-c-interop)         | zig-0.11.0  | Uses functions written in C from Zig code.                     |
| [zig-ppm](./zig-ppm)                     | zig-0.11.0  | Creates an image with random pixels in PPM image format.       |
| [zig-struct-json](./zig-struct-json)     | zig-0.11.0  | Serialization of a struct into JSON and then reading it back.  |
| [zig-telnet](./zig-telnet)               | zig-0.11.0  | Connects to Redis server like it is a basic telnet server.     |
| [zig-x11](./zig-x11)                     | zig-0.11.0  | Uses X11 to create a basic window without any bindings needed. |
| [zig-http](./zig-http)                   | zig-0.11.0  | Basic example of a HTTP 1.1 server without any routing etc.    |
| [zig-x11-box](./zig-x11-box)             | zig-0.11.0  | Move a box around with arrow keys with Xlib and Zig.           |
| [zig-kv-store](./zig-kv-store)           | zig-0.11.0  | Simple Key-value store that mimics memcached written in Zig.   |
| [zig-wad](./zig-wad)                     | zig-0.11.0  | Reads doom.wad and extracts the identification header.         |
| [zig-os-props](./zig-os-props)           | zig-0.11.0  | Detects properties of the target operating system.             |
| [zig-tlv-encoding](./zig-tlv-encoding)   | zig-0.13.0  | Naive implementation of TLV encoding in Zig.                   |
| [zig-embed](./zig-embed)                 | zig-0.13.0  | Embedding external resources in compiled binary.               |
| [zig-struct-bin](./zig-struct-bin)       | zig-0.13.0  | Save a struct into binary file and then reading it back.       |
| [zig-elf](./zig-elf)                     | zig-0.14.0  | Read execution header of Elf64 format in Zig.                  |
| [c-bluetooth](./c-bluetooth)             | clang-17    | Scans for all Bluetooth devices.                               |
| [d-x11](./d-x11)                         | dmd-2.110   | Uses X11 to create a basic window without any bindings needed. |
| [d-bmp-header](./d-bmp-header)           | dmd-2.110   | Reads BMP image header and prints the information out.         |
| [c-luajit](./c-luajit)                   | clang-19    | Testing execution speed of Lua vs Luajit vs embedded Luajit.   |
| [c-embedding-data](./c-embedding-data)   | clang-19    | Embedding game assets to executable binary (with raylib).      |
| [c-sqlite-embed-db](./c-sqlite-embed-db) | clang-17    | Embeds SQLite and SQLite database into executable.             |
| [c-embed-lua](./c-embed-lua)             | clang-17    | Embeds Lua interpreter and Lua script into executable.         |
| [odin-rl-window](./odin-rl-window)       | dev-2025-07 | Simple Raylib window with Odin.                                |

## License

[probe](https://github.com/mitjafelicijan/probe) was written by [Mitja
Felicijan](https://mitjafelicijan.com) and is released under the BSD
zero-clause license, see the LICENSE file for more information.
