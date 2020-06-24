local lm = require 'luamake'
local platform = require "bee.platform"

lm.arch = 'x64'

lm:shared_library 'lua51' {
    rootdir = 'D:/Github/lua-debug/3rd/lua/lua51',
    sources = {
        "*.c",
        "!lua.c",
        "!luac.c",
    },
    includes = {
        '..',
    },
    defines = {
        "LUA_BUILD_AS_DLL",
        "_CRT_SECURE_NO_WARNINGS",
    }
}

lm:shared_library 'lpack' {
    deps = {
        'lua51',
    },
    sources = {
        'lpack.c',
    },
    defines = {
        'STRUCT_INT="long long"',
    },
    ldflags = '/EXPORT:luaopen_lpack'
}
