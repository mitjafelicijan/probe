// NOTE: This is still WIP and not finished yet.

// https://github.com/mikolajgucki/lua-tutorial/blob/master/00-lua-state/lua-state.md
// https://github.com/natecraddock/ziglua/

const std = @import("std");
const lua = @cImport({
    @cInclude("lua.h");
    @cInclude("lauxlib.h");
    @cInclude("lualib.h");
});

pub const Lua = opaque {};

pub fn main() !void {
    const L = lua.luaL_newstate();
    defer lua.lua_close(L);

    lua.luaL_openlibs(L);

    _ = lua.luaL_dostring(L, "print('Hello world!')");
}
