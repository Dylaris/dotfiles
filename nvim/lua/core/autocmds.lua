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
--[[
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "html", "css", "javsscript", "typescript" },
    command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab"
})
--]]

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
        vim.bo.smartindent = true
    end
})
