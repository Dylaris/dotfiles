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

vim.api.nvim_create_user_command("RunWithStatus", function(cmd)
    local current_win = vim.api.nvim_get_current_win()
    local start_time = vim.fn.reltime()

    vim.cmd("bot split")
    vim.cmd("vsplit")
    local left_win = vim.api.nvim_get_current_win()
    vim.cmd("wincmd l")
    local right_win = vim.api.nvim_get_current_win()

    local info_buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_win_set_buf(left_win, info_buf)

    local term_buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_win_set_buf(right_win, term_buf)
    vim.api.nvim_buf_set_option(term_buf, 'modifiable', false)

    local info_lines = {
        "[INFO]",
        "> Timestamp: " .. os.date("%Y-%m-%d %H:%M:%S"),
        "> Work Dir:  " .. vim.fn.getcwd(),
        "> Command:   " .. cmd.args,
        ""
    }

    vim.fn.termopen(cmd.args, {
        cwd = vim.fn.getcwd(),
        on_exit = function(_, exit_code, _)
            vim.schedule(function()
                if not vim.api.nvim_buf_is_valid(info_buf) then return end

                local end_time = vim.fn.reltime(start_time)
                local execution_time = tonumber(vim.fn.reltimestr(end_time))

                local status_text = exit_code == 0 and "success" or "failed"

                local summary = {
                    "",
                    "[RESULT]",
                    "> Status:    " .. status_text,
                    "> Exit Code: " .. exit_code,
                    "> Duration:  " .. tostring(execution_time) .. "s"
                }

                -- reset all lines in info_buf
                vim.api.nvim_buf_set_lines(info_buf, 0, -1, false, info_lines)
                vim.api.nvim_buf_set_lines(info_buf, -1, -1, false, summary)
            end)
        end
    })

    vim.api.nvim_set_current_win(current_win)
end, { nargs = '+' })
