const std = @import("std");
const player = @import("player.zig");

pub fn main() !void {
    const p = player.Player{
        .name = "Johnny Blaze",
        .age = 34,
    };

    std.debug.print("Writting player with data: {{ Name: {s}, Age: {d} }}\n", .{ p.name, p.age });

    var playerJSON = try std.json.stringifyAlloc(std.heap.page_allocator, p, .{});
    defer std.heap.page_allocator.free(playerJSON);

    var file = try std.fs.cwd().createFile("player.json", .{});
    defer file.close();

    _ = try file.writeAll(playerJSON);
}
