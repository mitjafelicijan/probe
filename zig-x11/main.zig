const std = @import("std");
const xlib = @cImport({
    @cInclude("X11/Xlib.h");
});

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
        800,
        600,
        0,
        0,
        0xFF0000,
    );

    _ = xlib.XMapWindow(display, main_window);
    _ = xlib.XFlush(display);

    while (true) {
        std.time.sleep(1 * std.time.ns_per_s);
    }
}
