// PPM image format -  https://netpbm.sourceforge.net/doc/ppm.html

const std = @import("std");
const debug = @import("std").debug;

const ImageSize = 600;

const Color = struct {
    r: u8,
    g: u8,
    b: u8,

    pub fn initRandom() Color {
        const rand = std.crypto.random;
        return Color{
            .r = rand.int(u8),
            .g = rand.int(u8),
            .b = rand.int(u8),
        };
    }

    pub fn toString(self: Color) []const u8 {
        return std.fmt.allocPrint(std.heap.page_allocator, "{d} {d} {d} ", .{ self.r, self.g, self.b }) catch unreachable;
    }
};

pub fn main() !void {
    const imageFile = try std.fs.cwd().createFile("image.ppm", .{});
    defer imageFile.close();

    // NOTE: This should be done at compile time instead since the data is
    //       known in advance. I am leaving this here as a reference.
    // const header: []const u8 = std.fmt.allocPrint(std.heap.page_allocator, "P3\n{d} {d}\n255\n", .{ ImageSize, ImageSize }) catch unreachable;

    // NOTE: This is done at compile time instead. It does look a bit ugly
    //       and there must be a better way of doing this. Good enough!
    const header = "P3\n" ++ std.fmt.comptimePrint("{d}", .{ImageSize}) ++ " " ++ std.fmt.comptimePrint("{d}", .{ImageSize}) ++ "\n255\n";

    _ = try imageFile.write(header);

    for (0..(ImageSize * ImageSize)) |_| {
        const color = Color.initRandom();
        _ = try imageFile.write(color.toString());
    }
}
