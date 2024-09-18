// https://github.com/memcached/memcached/wiki/Commands
// https://ziglang.org/documentation/master/std/#std.hash_map.HashMap

const std = @import("std");

const Error = error{
    Failed,
    KeyNotFound,
};

const Store = struct {
    data: std.StringHashMap([]const u8),

    pub fn set(self: *Store, key: []const u8, value: []const u8) !void {
        self.data.put(key, value) catch |err| {
            std.log.err("Failed adding key `{s}` with error {}", .{ key, err });
            return error.Failed;
        };
    }

    pub fn get(self: *Store, key: []const u8) ![]const u8 {
        if (self.data.get(key)) |value| {
            return value;
        }
        return error.KeyNotFound;
    }

    pub fn del(self: *Store, key: []const u8) !void {
        if (!self.data.remove(key)) {
            std.log.err("Failed deleting key `{s}`", .{key});
            return error.KeyNotFound;
        }
    }
};

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    var allocator = arena.allocator();

    var store = Store{ .data = std.StringHashMap([]const u8).init(allocator) };
    defer store.data.deinit();

    // Setting new key.
    {
        const key = "johhny";
        try store.set(key, "blaze");
    }

    // Retrieving back existing key if we know it will never return an error.
    {
        const key = "johhny";
        const result = store.get(key) catch unreachable;
        std.log.info("Value: {s}", .{result});
    }

    // Retrieving back the value and handling errors.
    {
        const key = "unknown";
        if (store.get(key)) |val| {
            std.log.info("Value: {s}", .{val});
        } else |err| {
            std.log.err("Error: {any}", .{err});
        }
    }

    // Retrieving back key that does not exist and handling specific errors.
    {
        const key = "unknown";
        if (store.get(key)) |val| {
            std.log.info("Value: {s}", .{val});
        } else |err| switch (err) {
            error.KeyNotFound => {
                std.log.err("Key `{s}` was not found", .{key});
            },
        }
    }

    // Deleting existing key.
    {
        const key = "johhny";
        try store.del(key);
    }

    // Retrieving back the value and handling errors.
    {
        const key = "johnny";
        if (store.get(key)) |val| {
            std.log.info("Value: {s}", .{val});
        } else |err| {
            std.log.err("Error: {any}", .{err});
        }
    }
}
