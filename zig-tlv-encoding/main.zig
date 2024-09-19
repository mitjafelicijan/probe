// TLV format: https://devopedia.org/tlv-format
// Real world example: https://www.rfc-editor.org/rfc/rfc8609
// Cool article: https://www.huy.rocks/everyday/12-11-2022-zig-using-zig-for-advent-of-code

// Dummy TLV spec for encoding Linux device information
//
// Packet specification
//   1 byte   ... Tag
//   1 bytes  ... Length
//   variable ... Value
//
// Available tags: { 0x00 = vendor_name, 0x01 = model_name }
// Packet presented as a struct: Packet{ .vendor_name, .model_name }
// This assumes that the max value length can be 255.
//
// Test data from `lsusb` (`lscpu`):
// Bus 002 Device 003: ID 046d:086b Logitech, Inc. BRIO 4K Stream Edition
// Bus 001 Device 009: ID 3434:0350 Keychron Keychron V5
// Bus 001 Device 006: ID 2433:b200 ASETEK [NZXT Kraken X60]
// Bus 001 Device 005: ID 046d:c548 Logitech, Inc. Logi Bolt Receiver

const std = @import("std");

const TLVTag = enum(u8) {
    VENDOR_NAME = 0x00,
    MODEL_NAME = 0x01,
};

const TLVPacket = struct {
    tag: TLVTag,
    length: u8,
    value: std.ArrayList(u8),

    pub fn printHexEncoded(self: *TLVPacket) void {
        std.debug.print("\t", .{});
        std.debug.print("{X:0>2}-", .{@intFromEnum(self.tag)});
        std.debug.print("{X:0>2}-", .{self.length});

        for (self.value.items) |val| {
            std.debug.print("{X:0>2}", .{val});
        }

        std.debug.print("\n", .{});
    }
};

const TLVPayload = struct {
    packets: std.ArrayList(TLVPacket),
    allocator: std.mem.Allocator,

    pub fn init(allocator: std.mem.Allocator) TLVPayload {
        return TLVPayload{
            .packets = std.ArrayList(TLVPacket).init(allocator),
            .allocator = allocator,
        };
    }

    pub fn deinit(self: *TLVPayload) void {
        for (self.packets.items) |*packet| {
            packet.value.deinit();
        }
        self.packets.deinit();
    }

    pub fn append(self: *TLVPayload, tag: TLVTag, message: []const u8) !void {
        var value = try std.ArrayList(u8).initCapacity(self.allocator, message.len);
        try value.appendSlice(message);

        try self.packets.append(.{
            .tag = tag,
            .length = @intCast(message.len),
            .value = value,
        });
    }
};

test "Create TLV payload manually" {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();

    var payload = TLVPayload.init(gpa.allocator());
    defer payload.deinit();

    try payload.append(.VENDOR_NAME, "Logitech, Inc.");
    try payload.append(.MODEL_NAME, "BRIO 4K Stream Edition");

    std.debug.print("Capacity: {d}\n", .{payload.packets.capacity});

    for (payload.packets.items) |*packet| {
        std.debug.print("Tag: {}, Length: {d}\n", .{ packet.tag, packet.length });
        packet.printHexEncoded();
    }
}

pub fn main() void {
    std.debug.print("Use `make test` or `zig test main.zig` instead.\n", .{});
}
