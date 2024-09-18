const std = @import("std");

const WADHeader = struct { identification: [4]u8 };

pub fn main() !void {
    var file = try std.fs.cwd().openFile("doom.wad", .{});
    defer file.close();

    var buffer = try std.heap.page_allocator.alignedAlloc(u8, @alignOf(WADHeader), @sizeOf(WADHeader));
    defer std.heap.page_allocator.free(buffer);

    _ = try file.read(buffer);

    var header: *const WADHeader = @as(*const WADHeader, @ptrCast(buffer.ptr));
    std.debug.print("WAD Type: {s}\n", .{header.identification});
}
