const std = @import("std");
const player = @import("player.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer {
        _ = gpa.deinit();
    }

    const file = try std.fs.cwd().openFile("player.json", .{});
    defer file.close();

    const stat = try file.stat();
    const buffer = try file.readToEndAlloc(allocator, stat.size);
    defer allocator.free(buffer);

    const parsed = try std.json.parseFromSlice(player.Player, allocator, buffer, .{});
    defer parsed.deinit();

    const p: player.Player = parsed.value;
    std.debug.print("Reading player with data: {{ Name: {s}, Age: {d} }}\n", .{ p.name, p.age });
}
