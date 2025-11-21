function get_visual_selection()
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

function create_temp_buffer()
    vim.cmd("botright vnew")
    local buf = vim.api.nvim_get_current_buf()

    vim.bo[buf].buftype = "nofile" -- no associated file
    vim.bo[buf].bufhidden = "wipe" -- auto delete when hidden
    vim.bo[buf].swapfile = false -- do not create a swap file
    vim.bo[buf].filetype = "text" -- set file type

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
        "This is a temporary buffer...",
        "You can write anything here...",
        "",
    })

    return buf
end

function close_other_buffers()
    local current_buf = vim.api.nvim_get_current_buf()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
            vim.api.nvim_buf_delete(buf, {})
        end
    end
end

function parse_error_report()
    local selection = get_visual_selection()
    local patterns = {
        "(.-):(%d+):(%d+)",                 -- main.c:1:1
        "(.-)%((%d+),(%d+)%)",              -- main.c(1,1)
        "(.-):(%d+)",                       -- main.java:1
        'File%s*"([^"]+)",%s*line%s*(%d+)', -- File "main.py", line 1
        'syntax error at (.-) line (%d+)',  -- syntax error at main.pl line 3
    }
    for _, pattern in ipairs(patterns) do
        local matches = {selection:match(pattern)}
        if matches[1] then
            local result = {
                file = matches[1],
                row  = tonumber(matches[2]) or 1,
                col  = tonumber(matches[3]) or 1
            }
            return true, result
        end
    end
    return false, "no matching error format found"
end

function open_file_in_bottom_split(back, file_path, row, col)
    -- remove some extra useless characters
    file_path = file_path:gsub("^%s*(.-)%s*$", "%1"):gsub("[\r\n]+", "")

    -- check if file exists
    if vim.fn.filereadable(file_path) == 0 then
        print("file: '" .. file_path .. "' not exists (pwd: " .. vim.fn.getcwd() .. ")")
        return false
    end

    vim.cmd("bot split " .. vim.fn.fnameescape(file_path))
    if row then vim.api.nvim_win_set_cursor(0, {row, (col or 1) - 1}) end
    if back then vim.cmd("wincmd p") end

    return true
end
