**Just testing things.**

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

|                                        | Compiler   | What does it do?                                               |
|----------------------------------------|------------|----------------------------------------------------------------|
| [c-asm](./c-asm)                       | clang-17   | Calls a function written in ASM from C code.                   |
| [c-embed](./c-embed)                   | clang-17   | Embedding external resources in compiled binary.               |
| [c-signals](./c-signals)               | clang-17   | Uses SIGUSR1 and SIGUSR2 as IPC mechanism.                     |
| [c-structs](./c-structs)               | clang-17   | Saves and reads structs in/from binary files.                  |
| [c-httpd](./c-httpd)                   | clang-17   | Simple HTTP server written in C.                               |
| [zig-c-interop](./zig-c-interop)       | zig-0.11.0 | Uses functions written in C from Zig code.                     |
| [zig-ppm](./zig-ppm)                   | zig-0.11.0 | Creates an image with random pixels in PPM image format.       |
| [zig-struct-json](./zig-struct-json)   | zig-0.11.0 | Serialization of a struct into JSON and then reading it back.  |
| [zig-telnet](./zig-telnet)             | zig-0.11.0 | Connects to Redis server like it is a basic telnet server.     |
| [zig-x11](./zig-x11)                   | zig-0.11.0 | Uses X11 to create a basic window without any bindings needed. |
| [zig-http](./zig-http)                 | zig-0.11.0 | Basic example of a HTTP 1.1 server without any routing etc.    |
| [zig-x11-box](./zig-x11-box)           | zig-0.11.0 | Move a box around with arrow keys with Xlib and Zig.           |
| [zig-kv-store](./zig-kv-store)         | zig-0.11.0 | Simple Key-value store that mimics memcached written in Zig.   |
| [zig-wad](./zig-wad)                   | zig-0.11.0 | Reads doom.wad and extracts the identification header.         |
| [zig-os-props](./zig-os-props)         | zig-0.11.0 | Detects properties of the target operating system.             |
| [zig-tlv-encoding](./zig-tlv-encoding) | zig-0.13.0 | Naive implementation of TLV encoding in Zig.                   |
| [zig-embed](./zig-embed)               | zig-0.13.0 | Embedding external resources in compiled binary.               |
| [zig-struct-bin](./zig-struct-bin)     | zig-0.13.0 | Save a struct into binary file and then reading it back.       |
| [zig-elf](./zig-elf)                   | zig-0.14.0 | Read execution header of Elf64 format in Zig.                  |
| [c-bluetooth](./c-bluetooth)           | clang-17   | Scans for all Bluetooth devices.                               |

## License

[probe](https://github.com/mitjafelicijan/probe) was written by [Mitja
Felicijan](https://mitjafelicijan.com) and is released under the BSD
zero-clause license, see the LICENSE file for more information.

