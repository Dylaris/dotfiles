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
      "javascript", "html", "css", "php",
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
    mirage = true,
    terminal = true,
    overrides = {
        Comment = { italic = false },
        ['@property'] = { fg = "#FFFFFF" },
        ['@type.builtin'] = { fg = "#F28779" }
    },
})
