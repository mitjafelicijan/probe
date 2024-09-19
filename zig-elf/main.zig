// $ readelf -h ./elf
// https://github.com/bminor/binutils-gdb/blob/master/binutils/readelf.c

// There is still a problem with packed structs and aligment padding
// better referenced in these two threads (sometime struct is not aligned
// properly or even has 1 byte more than its C alternative):
//  - https://ziggit.dev/t/mapping-64-u8-buffer-to-a-struct/6052/19
//  - https://ziggit.dev/t/wrong-sizes-of-extern-packed-structs/6053/6

const std = @import("std");

const Elf64ExecutionHeader = packed struct {
    ident: u128,
    type: u16,
    machine: u16,
    version: u32,
    entry: u64,
    phoff: u64,
    shoff: u64,
    flags: u32,
    ehsize: u16,
    phentsize: u16,
    phnum: u16,
    shentsize: u16,
    shnum: u16,
    shstrndx: u16,
};

pub fn main() !void {
    var file = try std.fs.cwd().openFile("./elf", .{});
    defer file.close();

    var buffer: [64]u8 = undefined;
    _ = try file.read(buffer[0..]);

    const header: *Elf64ExecutionHeader = @ptrCast(@alignCast(&buffer));

    std.debug.print("Object file type: {}\n", .{header.type});
    std.debug.print("Architecture: {}\n", .{header.machine});
    std.debug.print("Object file version: 0x{X:0>2}\n", .{header.version});
    std.debug.print("Entry point virtual address: 0x{X:0>2}\n", .{header.entry});
    std.debug.print("Program header table file offset: {}\n", .{header.phoff});
    std.debug.print("Section header table file offset: {}\n", .{header.shoff});
    std.debug.print("Processor-specific flags: 0x{X:0>2}\n", .{header.flags});
    std.debug.print("ELF header size in bytes: {}\n", .{header.ehsize});
    std.debug.print("Program header table entry size: {}\n", .{header.phentsize});
    // std.debug.print("Program header table entry count: {}\n", .{header.phnum});
    // std.debug.print("Section header table entry size: {}\n", .{header.shentsize});
    // std.debug.print("Section header table entry count: {}\n", .{header.shnum});
    // std.debug.print("Section header string table index: {}\n", .{header.shstrndx});
}
