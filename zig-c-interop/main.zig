const print = @import("std").debug.print;

const billy = @cImport({
    @cInclude("billy.c");
});

pub fn main() void {
    print("Billy says 2+4={d}\n", .{billy.sum(2, 4)});
}
