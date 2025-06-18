-- bufferline
vim.opt.termguicolors = true
require("bufferline").setup{}

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
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
}

-- kanagawa
require('kanagawa').setup({
    commentStyle = { italic = false },
    keywordStyle = { italic = false },
    theme = "wave",
    overrides = function()
        return {
            ["@variable.builtin"] = { italic = false },
        }
    end,
})

require("tokyonight").setup({
    styles = {
        comments = { italic = false },
        keywords = { italic = false },
    }
})

-- catppuccin
require("catppuccin").setup({
    no_italic = true
})

vim.cmd("colorscheme tokyonight-night")
