-- space bar leader key
vim.g.mapleader = " "

-- file tree
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>")

-- nvim-comment
vim.keymap.set({"n", "v"}, "gc", ":CommentToggle<cr>")

-- luasnip
local ls = require("luasnip")
vim.keymap.set("i", "<C-k>", function() ls.expand() end, {silent = true})
vim.keymap.set("i", "<C-l>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set("i", "<C-j>", function() ls.jump(-1) end, {silent = true})
