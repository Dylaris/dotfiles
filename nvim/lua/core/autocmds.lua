-- Format options for specific file types
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
})

-- Set fasm assembler syntax as default
vim.api.nvim_create_autocmd("BufReadPre", {
    pattern = "*.asm",
    callback = function()
        vim.g.asmsyntax = "fasm"
    end,
})

-- Set indent width
vim.api.nvim_create_autocmd("FileType", {
    pattern = "this_pattern_will_never_match",
    command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab"
})

-- Set filetype=c for C header file
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.h",
    command = "set filetype=c"
})

-- Set php indent
vim.api.nvim_create_autocmd("FileType", {
    pattern = "php",
    -- opt: global opt
    -- bo: buffer opt
    -- wo: window opt
    callback = function()
        vim.bo.indentexpr = ""
        vim.bo.autoindent = true
        vim.bo.cindent = true
    end
})

-- Automatically remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local cursor_pos = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[%s/\s\+$//e]])
        vim.api.nvim_win_set_cursor(0, cursor_pos)
    end
})
