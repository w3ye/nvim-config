require("plugin")
require("keymaps.keymaps")
local vim = vim

vim.cmd.colorscheme("catppuccin")

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.hidden = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.autochdir = false

vim.opt.wrap = true
vim.opt.fixendofline = true
vim.opt.signcolumn = "yes"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 20
vim.api.nvim_create_autocmd("BufRead", {
	callback = function()
		vim.api.nvim_create_autocmd("BufWinEnter", {
			once = true,
			command = "normal! zx zR",
		})
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "lazy",
			command = "set nonu",
		})
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	command = "stopinsert",
})
