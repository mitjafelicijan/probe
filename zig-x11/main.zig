const std = @import("std");
const xlib = @cImport({
    @cInclude("X11/Xlib.h");
});

pub fn main() !void {
    const display = xlib.XOpenDisplay(null);
    if (display == null) {
        return error.DisplayOpenFailed;
    }

    const rootWindow = xlib.XDefaultRootWindow(display);

    const mainWindow = xlib.XCreateSimpleWindow(
        display,
        rootWindow,
        0,
        0,
        800,
        600,
        0,
        0,
        0xFF0000,
    );

    _ = xlib.XMapWindow(display, mainWindow);
    _ = xlib.XFlush(display);

    while (true) {
        std.time.sleep(1 * std.time.ns_per_s);
    }
}
