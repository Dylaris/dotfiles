-- space bar leader key
vim.g.mapleader = " "

-- buffline
vim.keymap.set('n', '<leader>bo', '<cmd>BufferLineCloseLeft<CR><Cmd>BufferLineCloseRight<cr>', { desc = 'Close other buffers' })

-- nvim-comment
vim.keymap.set({"n", "v"}, "gc", ":CommentToggle<cr>")

-- luasnip
local ls = require("luasnip")
vim.keymap.set("i", "<C-k>", function() ls.expand() end, {silent = true})
vim.keymap.set("i", "<C-l>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set("i", "<C-j>", function() ls.jump(-1) end, {silent = true})

-- oil
vim.keymap.set("n", "<leader>e", ":Oil --float<cr>")

-- asyncrun
vim.keymap.set("n", "<leader>r", ":AsyncRun ")
