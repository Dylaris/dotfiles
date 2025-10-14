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
      ["<C-p>"] = "actions.preview",                -- preview file content
      ["J"] = { "actions.select", mode = "n" },     -- open file or enter directory
      ["K"] = { "actions.parent", mode = "n" },     -- go back to parent directory
      ["H"] = { "actions.open_cwd", mode = "n" },   -- open the current working directory
      ["L"] = { "actions.refresh", mode = "n" },    -- open the current working directory
      ["S"] = { "actions.cd", mode = "n" },         -- set current directory as working directory
      ["g."] = { "actions.toggle_hidden", mode = "n" },   -- switch to show hidden file
      ["gs"] = { "actions.change_sort", mode = "n" },     -- change sort method
    },
})

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

-- neoscroll
require('neoscroll').setup({
    mappings = {
        '<C-u>', '<C-d>',
        '<C-b>', '<C-f>',
        'zt', 'zz', 'zb',
    },
})

-- lualine
require('lualine').setup{
	options = {
		icons_enabled = true,
		theme = 'auto',
	},
}

