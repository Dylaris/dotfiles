-- Auto create hidden terminal on startup
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        vim.cmd("Tnew")
        vim.cmd("wincmd j")
        local term_buf = vim.api.nvim_get_current_buf()
        vim.api.nvim_buf_set_option(term_buf, "buflisted", false)
        vim.api.nvim_buf_set_name(term_buf, "featme")
        vim.cmd("Tclose")
    end,
})

-- Set filetype=c for C header file
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.h",
    command = "set filetype=c"
})

-- Set filetype=fasm for asm/inc file
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = {"*.asm", "*.inc"},
    command = "set filetype=fasm"
})

-- Automatically remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local cursor_pos = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[%s/\s\+$//e]])
        vim.cmd([[%s/\r//e]])
        vim.api.nvim_win_set_cursor(0, cursor_pos)
    end
})

-- Disable auto comment
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt.formatoptions:remove({"c", "r", "o", "O"})
    end,
})
