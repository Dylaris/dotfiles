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
