-- open error position in new window
vim.api.nvim_create_user_command("JumpToError", function()
    local ok, report = parse_error_report()
    if ok then
        open_file_in_bottom_split(false, report.file, report.row, report.col)
    else
        print(report)
    end
end, {})

vim.api.nvim_create_user_command("TermRun", function(opts)
    local cmd = opts.args
    if cmd and cmd ~= "" then
        vim.cmd("1T " .. cmd)
        vim.cmd("bot split")
        vim.cmd("b featme")
    end
end, { nargs = "+" })
