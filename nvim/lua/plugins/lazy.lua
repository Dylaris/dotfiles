local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Colorscheme
    {
        'olivercederborg/poimandres.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('poimandres').setup{
                disable_italics = true
            }
        end,
        init = function()
            vim.cmd.colorscheme('poimandres')
            vim.api.nvim_set_hl(0, "Comment", {
                fg = "#c0ff85",
            })
            vim.api.nvim_set_hl(0, "Keyword", {
                fg = "#bb9af7",
            })
            vim.api.nvim_set_hl(0, "@keyword.return", {
                link = "Keyword"
            })
            vim.api.nvim_set_hl(0, "@keyword.function", {
                link = "Keyword"
            })
            vim.api.nvim_set_hl(0, "Function", {
                fg = vim.api.nvim_get_hl_by_name("@function.call", true).foreground
            })
            vim.api.nvim_set_hl(0, "Type", {
                fg = "#5fd7ff",
            })
        end
    },

    -- Fuzzy search
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    -- Check keymap
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },

    -- Exacyly jump
    {
        "ggandor/leap.nvim",
        config = function()
            require('leap').add_default_mappings()
    vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-forward)')
    vim.keymap.set({'n', 'x', 'o'}, 'S', '<Plug>(leap-backward)')
    vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')
        end,
    },

    -- Lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-mini/mini.icons" },
    },

    -- Edit file like buffer
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        lazy = false,
    },

    -- Quickly comment
    {
        "terrortylor/nvim-comment",
        config = function()
            require("nvim_comment").setup({create_mappings = false})
        end
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master', lazy = false, build = ":TSUpdate"
    },

    -- Alignment
    {
        'Vonr/align.nvim',
        branch = "v2",
        lazy = true,
        init = function()
            local NS = { noremap = true, silent = true }
            -- Aligns to 1 character
            vim.keymap.set('x', 'aa',
                function()
                    require'align'.align_to_char({
                        length = 1,
                    })
                end, NS)

            -- Aligns to a string with previews
            vim.keymap.set('x', 'aw',
                function()
                    require'align'.align_to_string({
                        preview = true,
                        regex = false,
                    })
                end, NS)
        end
    },

    -- Smooth scroll
    {
        "karb94/neoscroll.nvim",
        opts = {}
    },
}, {
    git = {
        url_format = "https://gh.bugdey.us.kg/https://github.com/%s.git"
    }
})

