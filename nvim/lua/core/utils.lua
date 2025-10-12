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
