-- luasnip
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

ls.add_snippets('c', {
    s('stb', {
        -- #ifndef NAME_H
        t('#ifndef '), i(1, 'lib_name'), t({'_H', ''}),
        -- #define NAME_H
        t('#define '), f(function(args) return args[1][1] end, {1}), t({'_H', ''}),
        -- #endif // NAME_H
        t('#endif // '), f(function(args) return args[1][1] end, {1}), t({'_H', '', ''}),

        -- #ifdef NAME_IMPLEMENTATION
        t('#ifdef '), f(function(args) return args[1][1] end, {1}), t({'_IMPLEMENTATION', ''}),
        -- #endif // NAME_IMPLEMENTATION
        t('#endif // '), f(function(args) return args[1][1] end, {1}), t({'_IMPLEMENTATION', '', ''}),

        -- #ifdef NAME_STRIP_PREFIX
        t('#ifdef '), f(function(args) return args[1][1] end, {1}), t({'_STRIP_PREFIX', ''}),
        -- #endif // NAME_STRIP_PREFIX
        t('#endif // '), f(function(args) return args[1][1] end, {1}), t('_STRIP_PREFIX')
    }),
    s('head_guard', {
        -- #ifndef NAME_H
        t('#ifndef '), i(1, 'lib_name'), t({'_H', ''}),
        -- #define NAME_H
        t('#define '), f(function(args) return args[1][1] end, {1}), t({'_H', ''}),
        -- #endif // NAME_H
        t('#endif // '), f(function(args) return args[1][1] end, {1}), t('_H')
    }),
})

