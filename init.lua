require("plugins")
-- require("autocomplete")
require("lsp.treesitter")

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
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

vim.cmd([[colorscheme nightfox]])
vim.g.mapleader = " "
vim.cmd([[set updatetime=100]])
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
-- vim.cmd [[autocmd BufWritePre *.tsx, *.ts, *.jsx, *.js EslintFixAll]]
vim.cmd([[syntax enable]])

vim.keymap.set("n", "<C-f>", "<cmd>Telescope find_files theme=dropdown hidden=true<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>FHT", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>T", "<cmd>Neotree toggle<cr>")
vim.keymap.set("n", "Y", "yy")
vim.keymap.set("n", "<F3>", "<cmd>:set hlsearch!<cr>")
vim.keymap.set("n", "<F2>", "<cmd>:set relativenumber!<cr>")
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
