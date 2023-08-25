local M = {
	"numToStr/Comment.nvim",
	enabled = require("core.enabled").comment,
	config = function()
		require("Comment").setup({
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end,
}

return M
