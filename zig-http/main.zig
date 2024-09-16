// https://www.rfc-editor.org/rfc/rfc2616

// NOTE: This is just a barebones example and it has a bunch of bugs there
//       so do not use this for anything seriously.

const std = @import("std");

pub fn main() anyerror!void {
    const self_addr = try std.net.Address.resolveIp("127.0.0.1", 6969);
    var listener = std.net.StreamServer.init(.{});
    try (&listener).listen(self_addr);

    std.log.info("Listening on {}; press Ctrl-C to exit...", .{self_addr});

    while ((&listener).accept()) |conn| {
        std.log.info("Accepted Connection from: {}", .{conn.address});

        // Basic HTTP 1.1 header.
        _ = try conn.stream.write("HTTP/1.1 200 OK\r\n");
        _ = try conn.stream.write("Connection: close\r\n");
        _ = try conn.stream.write("Content-Type: text/html; charset=utf-8\r\n");
        _ = try conn.stream.write("\r\n");

        // Actual response.
        _ = try conn.stream.write("<h1>Oh, hi Mark!</h1><p>It’s not true! It’s bullshit! I did not hit her! I did not!</p>\r\n");

        conn.stream.close();
    } else |err| {
        return err;
    }
}
