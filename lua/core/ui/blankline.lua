local M = {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("indent_blankline").setup({
			show_trailing_blankline_indent = false,
			show_current_context = false,
			filetype_exclude = {
				"startify",
				"help",
				"dashboard",
			},
		})
	end,
	enabled = require("core.enabled").blankline,
}

return M
