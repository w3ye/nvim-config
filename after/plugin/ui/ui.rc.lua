-- indent
vim.opt.termguicolors = true
vim.opt.list = true

require("indent_blankline").setup({
	show_trailing_blankline_indent = false,
	show_current_context = false,
	filetype_exclude = {
		"startify",
		"help",
		"dashboard",
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
	callback = function()
		vim.b.miniindentscope_disable = true
	end,
})
require("mini.indentscope").setup({
	symbol = "│",
	options = { try_as_border = true },
})
