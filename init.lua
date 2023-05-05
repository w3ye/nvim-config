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

vim.opt.scrolloff = 4

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 20
vim.api.nvim_create_autocmd("BufRead", {
	callback = function()
		vim.api.nvim_create_autocmd("BufWinEnter", {
			once = true,
			command = "normal! zx",
		})
		vim.api.nvim_create_autocmd("BufWrite", {
			once = true,
			command = "normal! zx",
		})
	end,
})

-- disable set nu for filetype lazy
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		vim.opt_local.nu = false
	end,
	pattern = "lazy",
})

-- autocommand to stop insert mode when opening a file
vim.api.nvim_create_autocmd("BufRead", {
	callback = function()
		vim.api.nvim_create_autocmd("BufWinEnter", {
			once = true,
			command = "stopinsert",
		})
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*.handlebars",
	command = "set filetype=handlebars syntax=mustache",
})
