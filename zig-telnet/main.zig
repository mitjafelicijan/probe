const std = @import("std");

// NOTE: Start Redis server with either `make redis` which requires
//       Docker to be installed or provide your own Redis instance.

pub fn main() !void {
    const peer = try std.net.Address.parseIp4("127.0.0.1", 6379);
    const stream = try std.net.tcpConnectToAddress(peer);
    defer stream.close();

    std.debug.print("Connecting to Redis server {}\n", .{peer});

    // https://redis.io/docs/latest/commands/set/
    var writer = stream.writer();
    const size = try writer.write("SET zig zag\n");

    std.debug.print("Sending to peer, total written: {d} bytes\n", .{size});

    // NOTE: Check if the key was created with:
    //       { echo "GET zig"; sleep 1; } | telnet localhost 6379
}
