-- use space as leader key
vim.g.mapleader = " "

-- core
vim.keymap.set("i", "jk", "<esc>", {desc = "switch insert mode to normal mode"})
vim.keymap.set("c", "jk", "<cr>", {desc = "send current command"})
vim.keymap.set("t", "<esc>", "<C-\\><C-n>", {desc = "switch terminal mode to normal mode"})
vim.keymap.set("n", "<leader>s", ":w<cr>", {desc = "save file"})
vim.keymap.set("n", "<leader>q", ":q<cr>", {desc = "exit file"})
vim.keymap.set("n", "<leader>nh", ":nohl<cr>", {desc = "cancle highlight of searched text"})
vim.keymap.set("v", "<tab>", ":normal @a<cr>", {desc = "apply macro 'a'"})
vim.keymap.set("v", "<leader>lf", "<cmd>LocateFile<cr>", {desc = "open file (the selected text) in horizontal split window"})

-- line operations
vim.keymap.set("n", "<enter>", "i<cr><esc>", {desc = "break line"})
vim.keymap.set("n", "du", "d^", {desc = "delete line content before cursor"});

-- buffer operations
vim.keymap.set("n", "<leader>bd", ":bd<cr>", {desc = "delete buffer (remove from list)"})
vim.keymap.set("n", "<leader>bD", ":bd!<cr>", {desc = "force delete buffer (remove from list and discard changes)"})
vim.keymap.set("n", "<leader>bu", ":bun<cr>", {desc = "unload buffer (keep in list)"})
vim.keymap.set("n", "<leader>bv", ":b#<cr>", {desc = "switch to alternate buffer"})
vim.keymap.set("v", "<leader>bf", "y/<C-r>0<cr>", {desc = "search selected text"})
vim.keymap.set("n", "<leader>bp", ":echo expand('%:p:h')<cr>", {desc = "show buffer file path"})
vim.keymap.set("n", "<leader>bt", create_temp_buffer, {desc = "create a temporary buffer"})
vim.keymap.set("n", "<leader>bo", close_all_other_buffer, {desc = "close all other buffers (keep current)"})

-- window operations
vim.keymap.set("n", "<leader>wh", ":split<cr>", {desc = "horitontal split window"})
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", {desc = "vertical split window"})
vim.keymap.set("n", "<leader>wd", ":close<cr>", {desc = "close window"})
vim.keymap.set("n", "<leader>wo", ":only<cr>", {desc = "close all other windows (keep current)"})

-- navigation
vim.keymap.set("n", "<A-h>", "<C-w>h", {desc = "move to left window"})
vim.keymap.set("n", "<A-l>", "<C-w>l", {desc = "move to right window"})
vim.keymap.set("n", "<A-j>", "<C-w>j", {desc = "move to bottom window"})
vim.keymap.set("n", "<A-k>", "<C-w>k", {desc = "move to top window"})
vim.keymap.set({"n", "v"}, "<C-h>", "^", {desc = "move to start of line"})
vim.keymap.set("n", "<C-l>", "$", {desc = "move to end of line"})
vim.keymap.set("v", "<C-l>", "$h", {desc = "move to end of line (except tail newline)"})
