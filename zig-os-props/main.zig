const std = @import("std");
const builtin = @import("builtin");

pub fn main() void {
    std.debug.print("os: {any}\n", .{builtin.target.os.tag});
    std.debug.print("arch: {any}\n", .{builtin.target.cpu.arch});
    std.debug.print("gnu: {any}\n", .{builtin.target.isGnu()});
    std.debug.print("musl: {any}\n", .{builtin.target.isMusl()});
    std.debug.print("mingw: {any}\n", .{builtin.target.isMinGW()});
}
