-- space bar leader key
vim.g.mapleader = " "

-- buffers
vim.keymap.set("n", "<A-n>", ":bn<cr>")
vim.keymap.set("n", "<A-p>", ":bp<cr>")
vim.keymap.set("n", "<leader>bd", ":bd<cr>")
vim.keymap.set("n", "<leader>bv", ":b#<cr>")
vim.keymap.set("n", "<leader>bs", ":ls<cr>:b ")

-- yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y"]])

-- move between windows
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-l>", "<C-w>l")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")

-- move cursor
vim.keymap.set({"n", "v"}, "<C-h>", "^")
vim.keymap.set("n", "<C-l>", "$")
vim.keymap.set("v", "<C-l>", "$h")

-- save/quitfile 
vim.keymap.set("n", "<leader>w", ":w<cr>")
vim.keymap.set("n", "<leader>q", ":q<cr>")

-- line operaiotn
vim.keymap.set("n", "<C-j>", "o<esc>")
vim.keymap.set("n", "<C-k>", "O<esc>")
vim.keymap.set("n", "<C-n>", "i<cr><esc>")

-- find the selected text
vim.keymap.set("v", "<leader>f", [[y/<C-r>"]])

-- switch mode
vim.keymap.set({"i", "c"}, "jk", "<esc>")
vim.keymap.set("c", "jj", "<C-c>")
vim.keymap.set("t", "jk", "<C-\\><C-n>")

-- cancle search highlight
vim.keymap.set("n", "<leader>nh", ":nohl<cr>")
