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
	{ "Shatur/neovim-ayu" },
    { "EdenEast/nightfox.nvim" },

    -- Edit file like buffer
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        lazy = false,
    },

    -- Async run command
    {
        "skywind3000/asyncrun.vim",
        config = function()
            vim.g.asyncrun_open = math.floor(vim.fn.winheight(0) / 2)
        end
    },

    -- Buffer management
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = "nvim-mini/mini.icons"
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
        dependencies = { "nvim-mini/mini.icons" },
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
            require("snippets.php_snippet")
            require("snippets.html_snippet")
        end,
    },

    -- Cursor style
    {
        "sphamba/smear-cursor.nvim",
        -- opts = {},
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

