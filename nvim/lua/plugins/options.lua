-- oil
require("oil").setup({
    -- set 'oil' as default file explorer when using like 'vim .'
    default_file_explorer = true,

    -- show hidden file
    view_options = {
      show_hidden = false,
    },

    -- display column info
    columns = {
      "icon",
      "permissions",
      "size",
      "mtime",
    },

    -- internal key map
    keymaps = {
      ["<C-h>"] = false,
      ["<C-l>"] = false,
      ["<C-p>"] = "actions.preview",      -- preview file content
      ["J"] = "actions.select",        -- open file or enter directory
      ["K"] = "actions.parent",           -- go back to parent directory
      ["H"] = "actions.open_cwd",         -- open the current working directory
      ["L"] = "actions.refresh",         -- open the current working directory
      ["g."] = { "actions.toggle_hidden", mode = "n" },   -- g. switch to show hidden file
      ["gs"] = { "actions.change_sort", mode = "n" },
    },
})

-- bufferline
require("bufferline").setup{
    options = {
        themable = false,
        separator_style = 'slope',
        show_buffer_icons = true,
        show_buffer_close_icons = true,
    }
}

-- treesitter
for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
  config.install_info.url = config.install_info.url:gsub("https://github.com/", "https://gh.llkk.cc/https://github.com/")
end
require("nvim-treesitter.configs").setup {
  ensure_installed = {
      "c", "lua", "cpp", "markdown", "make", "bash", "go",
      "javascript", "html", "css", "php", "python",
  },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    disable = function(lang, buf)
      local max_filesize = 100 * 1024
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    additional_vim_regex_highlighting = false,
  },
  -- Needed because treesitter highlight turns off autoindent for php files
  indent = {
    enable = true,
  },
}

-- lualine
require('lualine').setup{
	options = {
		icons_enabled = true,
		theme = 'ayu',
	},
}

-- neoscroll
require('neoscroll').setup({
    mappings = {
        '<C-u>', '<C-d>',
        '<C-b>', '<C-f>',
        'zt', 'zz', 'zb',
    },
})

-- ayu
require('ayu').setup({
    mirage = false,
    terminal = true,
    overrides = {
    	Normal = { bg = "#14141F" },
        Comment = { italic = false },
        ['@property'] = { fg = "#D0D0D0" },
        ['@type.builtin'] = { fg = "#F28779" }
    },
})
