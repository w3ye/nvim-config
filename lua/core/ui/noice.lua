local M = {
	"folke/noice.nvim",
	enabled = require("core.enabled").noice,
	keys = {
		{
			"<leader>nl",
			function()
				require("noice").cmd("last")
			end,
		},
		{
			"<leader>nh",
			function()
				require("noice").cmd("history")
			end,
		},
		{
			"<leader>na",
			function()
				require("noice").cmd("all")
			end,
		},
	},
}

-- vim.keymap.set("c", "<leader>nc", function()
--     require("noice").redirect(vim.fn.getcmdline())
-- end)

-- vim.keymap.set("n", "<leader>u", function()
--   require("notify").dismiss({ silent = true, pending = true })
-- end)
return M
