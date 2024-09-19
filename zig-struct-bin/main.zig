const std = @import("std");

const Sample = packed struct {
    type: u16,
    machine: u16,
    version: u32,
};

test "write" {
    const s = Sample{
        .type = 54,
        .machine = 72,
        .version = 132,
    };

    std.debug.print("{}\n", .{s});

    var file = try std.fs.cwd().createFile("out.bin", .{});
    defer file.close();

    try file.writeAll(std.mem.asBytes(&s));
}

test "read" {
    var file = try std.fs.cwd().openFile("./out.bin", .{});
    defer file.close();

    var buffer: [8]u8 = undefined;
    _ = try file.read(buffer[0..]);

    const s: *Sample = @ptrCast(@alignCast(&buffer));
    std.debug.print("{}\n", .{s});
}

pub fn main() void {}
