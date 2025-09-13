-- space bar leader key
vim.g.mapleader = " "

-- buffers
vim.keymap.set("n", "<A-n>", ":bn<cr>")
vim.keymap.set("n", "<A-p>", ":bp<cr>")
vim.keymap.set("n", "<leader>bd", ":bd<cr>")
vim.keymap.set("n", "<leader>bv", ":b#<cr>")
vim.keymap.set("n", "<leader>bs", ":ls<cr>:b ")

-- move between windows
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-l>", "<C-w>l")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")

-- move cursor
vim.keymap.set({"n", "v"}, "<C-h>", "^")
vim.keymap.set("n", "<C-l>", "$")
vim.keymap.set("v", "<C-l>", "$h")
vim.keymap.set({"n", "v"}, "<C-k>", "{")
vim.keymap.set({"n", "v"}, "<C-j>", "}")

-- save/quitfile
vim.keymap.set("n", "<leader>w", ":w<cr>")
vim.keymap.set("n", "<leader>q", ":q<cr>")

-- break line
vim.keymap.set("n", "<enter>", "i<cr><esc>")

-- find the selected text
vim.keymap.set("v", "<leader>f", [[y/<C-r>"]])

-- switch mode
vim.keymap.set({"i", "c"}, "jk", "<esc>")
vim.keymap.set("c", "jj", "<C-c>")
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

-- cancle search highlight
vim.keymap.set("n", "<leader>nh", ":nohl<cr>")

-- macro
vim.keymap.set("v", "<tab>", ":normal @a<cr>");

-- delete line content before curson
vim.keymap.set("n", "du", "d^");
