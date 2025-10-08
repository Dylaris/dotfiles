local function get_visual_selection()
    -- store v register
    local saved_register = vim.fn.getreg('v')
    local saved_register_type = vim.fn.getregtype('v')

    -- copy selected text to v register
    vim.cmd('silent normal! "vy')
    local selection = vim.fn.getreg('v')

    -- restore v register
    vim.fn.setreg('v', saved_register, saved_register_type)

    return selection
end

-- open the selected file path in new window
vim.api.nvim_create_user_command("LocateFile", function()
    local current_buf = vim.api.nvim_get_current_buf()
    local is_terminal = vim.bo[current_buf].buftype == "terminal"

    local dir_path = is_terminal and vim.fn.getcwd() or vim.fn.expand("%:p:h")
    local relative_file_path = get_visual_selection()
    -- remove some extra useless characters
    relative_file_path = relative_file_path:gsub("^%s*(.-)%s*$", "%1")
    relative_file_path = relative_file_path:gsub("[\r\n]+", "")

    if relative_file_path then
        local file_path = dir_path .. "/" .. relative_file_path
        -- check if file exists
        if vim.fn.filereadable(file_path) == 0 then
            print("file: '" .. file_path .. "' not exists")
            return
        end
        vim.cmd("bot split " .. vim.fn.fnameescape(file_path))
        vim.cmd("wincmd p")
    end
end, {})
