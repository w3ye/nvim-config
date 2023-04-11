require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua",
    "go",
    "javascript",
    "typescript",
    "css",
    "json",
    "yaml",
    "python",
    "fish",
    "bash",
    "markdown",
  },
  auto_install = true,
  sync_install = true,
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = false, -- set to `false` to disable one of the mappings
      node_incremental = "<c-d>",
      scope_incremental = "<c-s>",
      node_decremental = "<c-a>",
    },
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      javascript = {
        __default = "// %s",
        jsx_element = "{/* %s */}",
        jsx_fragment = "{/* %s */}",
        jsx_attribute = "// %s",
        comment = "// %s",
      },
    },
  },
})
