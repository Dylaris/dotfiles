-- bufferline
require("bufferline").setup{
    options = {
        show_buffer_close_icons = false,
    }
}

-- treesitter
for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
  config.install_info.url = config.install_info.url:gsub("https://github.com/", "https://gh.llkk.cc/https://github.com/")
end
require("nvim-treesitter.configs").setup {
  ensure_installed = { 
      "c", "lua", "cpp", "markdown", "make", "bash", "go",
      "javascript", "html", "css",
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
}

-- lualine
require('lualine').setup{
	options = {
		-- icons_enabled = false,
		theme = 'everforest',
	},
}

-- tokyonight
require("tokyonight").setup{
    styles = {
        comments = { italic = false },
        keywords = { italic = false },
    }
}
