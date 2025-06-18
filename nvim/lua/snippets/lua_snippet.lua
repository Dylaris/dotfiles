-- luasnip
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

ls.add_snippets('lua', {
    s('rh', {
        t({
            '-- ======================================================',
            '--             public function implementation            ',
            '-- ======================================================',
        })
    })
})
