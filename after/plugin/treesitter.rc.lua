require 'nvim-treesitter.configs'.setup {
  ensure_installed = { 'lua', 'go', 'javascript', 'typescript', 'css', 'json', 'yaml', 'python' },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}
