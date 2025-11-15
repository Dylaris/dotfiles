-- open error position in new window
vim.api.nvim_create_user_command("JumpToError", function()
    local ok, report = parse_error_report()
    if ok then
        open_file_in_bottom_split(false, report.file, report.row, report.col)
    else
        print(report)
    end
end, {})
