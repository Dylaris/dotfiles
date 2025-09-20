-- luasnip
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

ls.add_snippets("html", {
    s('skeleton', {
        t({
            "<!DOCTYPE html>",
            "<html>",
            "<head>",
            "    <meta charset=\"utf-8\">",
            "    <title></title>",
            "</head>",
            "<body>",
            "</body>",
            "</html>"
        })
    })
})
