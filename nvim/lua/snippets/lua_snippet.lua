-- luasnip
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

ls.add_snippets('lua', {
    s('class', {
        -- local Person = {}
        t('local '), i(1, 'class_name'), t({' = {}', ''}),

        -- Person.__index = Person
        f(function(args) return args[1][1] end, {1}),
        t('.__index = '),
        f(function(args) return args[1][1] end, {1}),
        t({'', '', ''}),

        -- function Person:new() ... end
        t('function '),
        f(function(args) return args[1][1] end, {1}),
        t({':new()', ''}),
        t({
            '    local obj = {}',
            '    setmetatable(obj, self)',
            '    return obj',
            'end',
            '',
            ''
        }),

        -- return Person
        t('return '),
        f(function(args) return args[1][1] end, {1})
    })
})
