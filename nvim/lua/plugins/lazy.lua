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
      "dgox16/oldworld.nvim",
      lazy = false,
      priority = 1000,
  },
  { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000
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
      require("nvim-tree").setup {}
    end,
  },

  -- Visualize buffers as tabs
  {
    "akinsho/bufferline.nvim", version = "*", 
    dependencies = "nvim-tree/nvim-web-devicons"
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
    opts = {},
  },

  -- Alignment
  {
    'Vonr/align.nvim',
    branch = "v2",
    lazy = true,
    init = function()
      -- Aligns to a string with previews
      vim.keymap.set(
        'x',
        'aw',
        function()
          require'align'.align_to_string({
            preview = true,
            regex = false,
          })
        end,
        NS)
    end
  }
})
