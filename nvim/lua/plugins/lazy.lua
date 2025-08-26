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
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        "vague2k/vague.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other plugins
    },   
    { 
        "sainnhe/sonokai",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.sonokai_enable_italic = false
            -- 'default', 'atlantis', 'andromeda', 'shusia', 'maia'
            vim.g.sonokai_style = 'andromeda'
            vim.g.sonokai_better_performance = 1
            vim.g.sonokai_disable_italic_comment = 1
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    -- Buffer management
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
    },

    -- File tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup{}
        end,
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

    -- Lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- No-Neck-Pain
    { "shortcuts/no-neck-pain.nvim", version = "*" },

    -- Lua Snippets
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("snippets.c_snippet")
            require("snippets.lua_snippet")
        end,
    },

    -- Cursor style
    {
        "sphamba/smear-cursor.nvim",
        -- opts = {},
    },
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

            -- Aligns to 2 characters with previews
            vim.keymap.set('x', 'ad',
                function()
                    require'align'.align_to_char({
                        preview = true,
                        length = 2,
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

            -- Aligns to a Vim regex with previews
            vim.keymap.set('x', 'ar',
                function()
                    require'align'.align_to_string({
                        preview = true,
                        regex = true,
                    })
                end, NS)

            -- Example gawip to align a paragraph to a string with previews
            vim.keymap.set( 'n', 'gaw',
                function()
                    local a = require'align'
                    a.operator(
                        a.align_to_string,
                        {
                            regex = false,
                            preview = true,
                        }
                    )
                end, NS)

            -- Example gaaip to align a paragraph to 1 character
            vim.keymap.set('n', 'gaa',
                function()
                    local a = require'align'
                    a.operator(a.align_to_char)
                end, NS)
		end
	},

    -- Rainbow paren
    -- { "hiphish/rainbow-delimiters.nvim" },
})

