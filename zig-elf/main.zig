// $ readelf -h ./elf
// https://github.com/bminor/binutils-gdb/blob/master/binutils/readelf.c

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

    var buffer: [64]u8 align(@alignOf(Elf64ExecutionHeader)) = undefined;
    _ = try file.read(buffer[0..@sizeOf(Elf64ExecutionHeader)]);

    const header: *Elf64ExecutionHeader = @ptrCast(&buffer);

    std.debug.print("sizeOf(Elf64ExecutionHeader) = {}\n", .{@sizeOf(Elf64ExecutionHeader)});
    std.debug.print("bitSizeOf(Elf64ExecutionHeader) = {} ({}/8={d})\n", .{
        @bitSizeOf(Elf64ExecutionHeader),
        @bitSizeOf(Elf64ExecutionHeader),
        @bitSizeOf(Elf64ExecutionHeader) / 8,
    });

    std.debug.print("Object file type: {}\n", .{header.type});
    std.debug.print("Architecture: {}\n", .{header.machine});
    std.debug.print("Object file version: 0x{X:0>2}\n", .{header.version});
    std.debug.print("Entry point virtual address: 0x{X:0>2}\n", .{header.entry});
    std.debug.print("Program header table file offset: {}\n", .{header.phoff});
    std.debug.print("Section header table file offset: {}\n", .{header.shoff});
    std.debug.print("Processor-specific flags: 0x{X:0>2}\n", .{header.flags});
    std.debug.print("ELF header size in bytes: {}\n", .{header.ehsize});
    std.debug.print("Program header table entry size: {}\n", .{header.phentsize});
    std.debug.print("Program header table entry count: {}\n", .{header.phnum});
    std.debug.print("Section header table entry size: {}\n", .{header.shentsize});
    std.debug.print("Section header table entry count: {}\n", .{header.shnum});
    std.debug.print("Section header string table index: {}\n", .{header.shstrndx});
}
