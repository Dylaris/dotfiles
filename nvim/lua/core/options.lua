-- Basic settings configuration
local function set_basic_config()
    vim.opt.compatible = false                  -- Disable Vi compatibility mode
    vim.opt.syntax = "on"                       -- Enable syntax highlighting
    vim.cmd("filetype on")                      -- Enable filetype detection
    vim.cmd("filetype indent on")               -- Enable auto indentation
    vim.opt.fileformats = { "unix", "dos" }     -- Set file formats to Unix and DOS
end

-- Appearance and interface settings
local function set_appearance()
    vim.opt.background = "dark"                 -- Set background to dark
    vim.opt.termguicolors = true                -- Enable true color support
    vim.opt.laststatus = 2                      -- Always show the status line
    vim.cmd("highlight CursorLine guibg=NONE")  -- Set background of cursorline
end

-- Clipboard and autocompletion settings
local function set_clipboard_and_completion()
    vim.opt.clipboard = "unnamedplus"           -- Set clipboard to use the system clipboard
    vim.opt.complete:append("d")                -- Enable auto completion for C/C++ macros
end

-- Tab and indentation settings
local function set_indent_and_tab()
    vim.opt.tabstop = 4                         -- Set tabstop to 4 spaces
    vim.opt.softtabstop = 4                     -- Set softtabstop to 4 spaces
    vim.opt.expandtab = true                    -- Use spaces instead of tabs
    vim.opt.smarttab = true                     -- Enable smart tabbing
    vim.opt.shiftwidth = 4                      -- Set the width for auto-indentation to 4 spaces
    vim.opt.autoindent = true                   -- Enable auto indentation
    vim.opt.cindent = true                      -- Enable C style auto indentation
end

-- Search settings
local function set_search_settings()
    vim.opt.hlsearch = true                     -- Highlight search matches
    vim.opt.ignorecase = true                   -- Ignore case while searching
    vim.opt.smartcase = true                    -- Enable smart case search (case-sensitive if uppercase is used)
    vim.opt.showmatch = true                    -- Highlight matching parentheses
end

-- File management settings
local function set_file_management()
    vim.opt.backup = false                      -- Disable backup files
    vim.opt.swapfile = false                    -- Disable swap files
    vim.opt.writebackup = false                 -- Disable write backup files
    vim.opt.undofile = false                    -- Disable undo files
end

-- Search path for builtin-command find
local function set_find_path()
    local paths = {
        "~/.config/nvim/**",
        "~/project/personal/aris/**",
        "~/project/personal/json/**",
        "~/project/personal/cini/**"
    }

    local path_str = ""
    for i, path in ipairs(paths) do
        if i > 1 then path_str = path_str .. "," end
        path_str = path_str .. path
    end

    vim.cmd("set path=" .. path_str)
end

-- Line
local function set_line()
    vim.opt.cursorline = true                  -- Disable cursor line highlighting
    vim.opt.number = true                      -- No show line numbers
    vim.opt.relativenumber = true              -- No show relative line numbers
end

-- Other settings
local function set_other_settings()
    vim.opt.belloff = "all"                     -- Disable bell
    vim.opt.updatetime = 300                    -- Set the update time for CursorHold events
    vim.opt.mouse = "a"                         -- Enable mouse support in all modes
    vim.opt.showmode = false                    -- Disable mode display (useful with lualine)
end

-- Call all configuration functions
local function apply_configurations()
    set_basic_config()
    set_appearance()
    set_clipboard_and_completion()
    set_indent_and_tab()
    set_search_settings()
    set_file_management()
    set_find_path()
    set_line()
    set_other_settings()
end

-- Execute the configuration
apply_configurations()
