#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

int main(int argc, char **argv) {
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);
    if (luaL_loadfile(L, "fibonacci.luac") || lua_pcall(L, 0, 0, 0)) {
        fprintf(stderr, "Error: %s\n", lua_tostring(L, -1));
        return 1;
    }
    lua_close(L);
    return 0;
}
