-- luasnip
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

ls.add_snippets("html", {
    s('tag', {
        -- <body> ... </body>
        t('<'), i(1, 'tag_name'), t('>'),
        t('</'), f(function(args) return args[1][1] end, {1}), t('>')
    }),
    s('skeleton', {
        t({
            "<!DOCTYPE html>",
            "<html>",
            "    <head>",
            "        <meta charset=\"utf-8\">",
            "        <title></title>",
            "    </head>",
            "    <body>",
            "    </body>",
            "</html>"
        })      
    })
})
