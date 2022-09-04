require("plugins")
require("lsp.treesitter")

vim.opt.expandtab = true
-- vim.opt.tabstop =4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
vim.opt.smarttab = true

vim.opt.nu = true

vim.opt.hidden = true
vim.opt.hlsearch = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.scrolloff = 8
vim.opt.wrap = true
vim.opt.signcolumn = "yes"
vim.opt.fixendofline = true
vim.opt.clipboard = "unnamedplus"

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hlsearch = false
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- code folding
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.api.nvim_create_autocmd('BufRead', {
  callback = function()
    vim.api.nvim_create_autocmd('BufWinEnter', {
      once = true,
      command = 'normal! zx'
    })
  end
})

vim.cmd([[colorscheme everblush]])
vim.cmd([[
hi linenr guifg=#59666b
hi cursorlinenr guifg=#59666b
]])

vim.g.mapleader = " "
vim.cmd([[set updatetime=100]])
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
-- vim.cmd [[autocmd BufWritePre *.tsx, *.ts, *.jsx, *.js EslintFixAll]]
vim.cmd([[syntax enable]])
vim.cmd([[
let g:blamer_template = '<committer> • <summary>, <committer-time>'
let g:blamer_relative_time = 1
]])

vim.keymap.set("n", "<C-f>", "<cmd>Telescope find_files theme=dropdown hidden=true<cr>")
vim.keymap.set("n", "<leader>lg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope grep_string<cr>")
vim.keymap.set("n", "<leader>ts", "<cmd>Telescope treesitter<cr>")
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>FHT", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>t", "<cmd>Neotree toggle<cr>")
vim.keymap.set("n", "Y", "yy")
vim.keymap.set("n", "<F3>", "<cmd>set hlsearch!<cr>")
vim.keymap.set("n", "<F2>", "<cmd>set relativenumber!<cr>")
vim.keymap.set("n", "<F4>", "<cmd>BlamerToggle<cr>")
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-w>C", "<cmd>qa<cr>")
vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.code_action()<cr>")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "<C-e>", "<Nop>")

-- LSP disagnostic icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- diagnostic settings
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
