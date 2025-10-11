-- use space as leader key
vim.g.mapleader = " "

-- nvim-comment
vim.keymap.set({"n", "v"}, "gc", ":CommentToggle<cr>")

-- oil
vim.keymap.set("n", "<leader>e", ":Oil --float<cr>")

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
