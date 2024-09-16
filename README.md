**Just testing things.**

Nothing crazy here. I put little experiments and tests I do here so I can
reference them later if I need to.

> [!NOTE]  
> Check `shell.nix` to see the software and dependencies that are used
> in these examples. If you use Nix just do `nix-shell shell.nix`.

| Example                          | What does it do?                                               |
|----------------------------------|----------------------------------------------------------------|
| [c-asm](./c-asm)                 | Calls a function written in ASM from C code.                   |
| [c-embed](./c-embed)             | Embedding external resources in compiled binary.               |
| [c-signals](./c-signals)         | Uses SIGUSR1 and SIGUSR2 as IPC mechanism.                     |
| [c-structs](./c-structs)         | Saves and reads structs in/from binary files.                  |
| [zig-c-interop](./zig-c-interop) | Uses functions written in C from Zig code.                     |
| [zig-ppm](./zig-ppm)             | Creates an image with random pixels in PPM image format.       |
| [zig-structs](./zig-structs)     | Serialization of a struct into JSON and then reading it back.  |
| [zig-telnet](./zig-telnet)       | Connects to Redis server like it is a basic telnet server.     |
| [zig-x11](./zig-x11)             | Uses X11 to create a basic window without any bindings needed. |
| [zig-http](./zig-http)           | Basic example of a HTTP 1.1 server without any routing etc.    |
