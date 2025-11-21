-- use space as leader key
vim.g.mapleader = " "

-- core
vim.keymap.set("i", "jk", "<esc>", {desc = "Exit insert mode"})
vim.keymap.set("c", "jk", "<cr>", {desc = "Run command"})
vim.keymap.set("t", "<esc>", "<C-\\><C-n>", {desc = "Exit terminal mode"})
vim.keymap.set("n", "<leader>s", ":w<cr>", {desc = "Save file"})
vim.keymap.set("n", "<leader>q", ":q<cr>", {desc = "Quit file"})
vim.keymap.set("n", "<leader>r", ":TermRun ", {desc = "Run command in terminal"})
vim.keymap.set("n", "<leader>nh", ":nohl<cr>", {desc = "Clear search highlight"})
vim.keymap.set("v", "<tab>", ":normal @a<cr>", {desc = "Run macro 'a'"})

-- line operations
vim.keymap.set("n", "<enter>", "i<cr><esc>", {desc = "Split line"})
vim.keymap.set("n", "du", "d^", {desc = "Delete to line start"})

-- buffer operations
vim.keymap.set("n", "<leader>bd", ":bd<cr>", {desc = "Close buffer"})
vim.keymap.set("n", "<leader>bD", ":bd!<cr>", {desc = "Force close buffer"})
vim.keymap.set("n", "<leader>bu", ":bun<cr>", {desc = "Unload buffer"})
vim.keymap.set("n", "<leader>bv", ":b#<cr>", {desc = "Switch to last visited buffer"})
vim.keymap.set("v", "<leader>bf", "y/<C-r>0<cr>", {desc = "Search selected text"})
vim.keymap.set("n", "<leader>bp", ":echo expand('%:p:h')<cr>", {desc = "Show buffer path"})
vim.keymap.set("n", "<leader>bt", create_temp_buffer, {desc = "Create temp buffer"})
vim.keymap.set("n", "<leader>bo", close_other_buffers, {desc = "Close other buffers"})

-- window operations
vim.keymap.set("n", "<leader>wh", ":split<cr>", {desc = "Horizontal split window"})
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", {desc = "Vertical split window"})
vim.keymap.set("n", "<leader>wd", ":close<cr>", {desc = "Close window"})
vim.keymap.set("n", "<leader>wo", ":only<cr>", {desc = "Close other windows"})

-- navigation
vim.keymap.set("n", "<A-h>", "<C-w>h", {desc = "Go to left window"})
vim.keymap.set("n", "<A-l>", "<C-w>l", {desc = "Go to right window"})
vim.keymap.set("n", "<A-j>", "<C-w>j", {desc = "Go to bottom window"})
vim.keymap.set("n", "<A-k>", "<C-w>k", {desc = "Go to top window"})
vim.keymap.set({"n", "v"}, "<C-h>", "^", {desc = "Go to line start"})
vim.keymap.set("n", "<C-l>", "$", {desc = "Go to line end"})
vim.keymap.set("v", "<C-l>", "$h", {desc = "Go to line end (no newline)"})
vim.keymap.set("v", "<cr>", "<cmd>JumpToError<cr>", {desc = "Open error position in split window"})
