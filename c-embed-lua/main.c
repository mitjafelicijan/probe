#include "lua-5.4.8/src/lua.h"
#include "lua-5.4.8/src/lualib.h"
#include "lua-5.4.8/src/lauxlib.h"

#include "hi.h"

static int l_sum(lua_State *L) {
	double a = luaL_checknumber(L, 1);
	double b = luaL_checknumber(L, 2);
	lua_pushnumber(L, a + b);
	return 1;
}

int main(void) {
	lua_State *L = luaL_newstate();
	luaL_openlibs(L);

	// You do not need to prefix name of the function with `c_`. I did it to
	// make it clear in the lua script code that this is a custom function.
	lua_register(L, "c_sum", l_sum);

	// Not wise since this is not a null-terminated string.
	/* luaL_dostring(L, (const char*)hi); */

	// https://www.lua.org/manual/5.4/manual.html#luaL_loadbuffer
	// Load Lua chunk from `hi` buffer.
	if (luaL_loadbuffer(L, (const char*)hi, hi_len, "hi_chunk") != LUA_OK) {
		fprintf(stderr, "Load error: %s\n", lua_tostring(L, -1));
		lua_pop(L, 1);
	} else {
		// Execute the chunk.
		if (lua_pcall(L, 0, 0, 0) != LUA_OK) {
			fprintf(stderr, "Runtime error: %s\n", lua_tostring(L, -1));
			lua_pop(L, 1);
		}
	}

	lua_close(L);
	return 0;
}
