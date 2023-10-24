local M = {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		require("ibl").setup({
			-- show_trailing_blankline_indent = false,
			-- show_current_context = false,
		})
		require("ibl").overwrite({
			exclude = {
				filetypes = {
					"startify",
					"help",
					"dashboard",
				},
			},
		})
	end,
	enabled = _G.enabled.blankline,
}

return M
