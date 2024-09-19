const std = @import("std");

pub fn main() !void {
    const data: []const u8 = @embedFile("max.txt");

    // Print the whole file out.
    std.debug.print("{s}\n", .{data});

    // Loop over each byte.
    for (data) |c| {
        std.debug.print("0x{X:0>2} ", .{c});
    }
    std.debug.print("\n", .{});
}
