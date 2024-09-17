// https://tronche.com/gui/x/xlib/

const std = @import("std");
const xlib = @cImport({
    @cInclude("X11/Xlib.h");

    // This should work and pull in header with all the mappings
    // making xlib.XK_Escape available but it doesn't.
    @cInclude("X11/keysymdef.h");
});

// Defining key symbols by hand from keysymdef.h file.
const KeySym = enum(u32) {
    ESCAPE = 0xFF1B,
    LEFT = 0xff51,
    UP = 0xff52,
    RIGHT = 0xff53,
    DOWN = 0xff54,
};

const Box = struct {
    x: i32,
    y: i32,
};

const StepSize = 30;

pub fn main() !void {
    const display = xlib.XOpenDisplay(null);
    if (display == null) {
        return error.DisplayOpenFailed;
    }

    const root_window = xlib.XDefaultRootWindow(display);

    const main_window = xlib.XCreateSimpleWindow(
        display,
        root_window,
        0,
        0,
        400,
        800,
        0,
        0,
        0xFFFFFF,
    );

    _ = xlib.XMapWindow(display, main_window);
    _ = xlib.XFlush(display);

    _ = xlib.XSelectInput(display, main_window, xlib.KeyPressMask);
    _ = xlib.XMapWindow(display, main_window);

    _ = xlib.XStoreName(display, main_window, "Moving boxes");

    var gc = xlib.XCreateGC(display, main_window, 0, null) orelse {
        std.debug.print("Failed to create graphics context\n", .{});
        return error.CreateGCFailed;
    };
    defer {
        _ = xlib.XFreeGC(display, gc);
    }

    var box = Box{ .x = 0, .y = 0 };

    var event: xlib.XEvent = undefined;
    while (true) {
        _ = xlib.XNextEvent(display, &event);
        if (event.type == xlib.KeyPress) {
            var keysym = xlib.XLookupKeysym(&event.xkey, 0);

            // NOTE: There probably is a better way of matching key presses
            //       without casting. I tried creating enum with type
            //       c_ulong without luck. More described in link below.
            //       https://ziglang.org/documentation/0.9.1/#Primitive-Types

            if (keysym == @intFromEnum(KeySym.ESCAPE)) {
                std.debug.print("Exiting game\n", .{});
                break;
            }

            if (keysym == @intFromEnum(KeySym.LEFT)) {
                box.x -= StepSize;
            }

            if (keysym == @intFromEnum(KeySym.RIGHT)) {
                box.x += StepSize;
            }

            if (keysym == @intFromEnum(KeySym.UP)) {
                box.y -= StepSize;
            }

            if (keysym == @intFromEnum(KeySym.DOWN)) {
                box.y += StepSize;
            }
        }

        _ = xlib.XClearWindow(display, main_window);
        _ = xlib.XDrawString(display, main_window, gc, 150, 150, "Use arrow keys.", 15);
        _ = xlib.XFillRectangle(display, main_window, gc, box.x, box.y, 100, 100);
    }
}
