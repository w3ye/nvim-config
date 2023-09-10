local routes = {
	{
		filter = {
			event = "msg_show",
			kind = "",
			find = "written",
		},
		opts = { skip = true },
	},
	{
		filter = {
			event = "msg_show",
			kind = "",
			find = "lines",
		},
		opts = { skip = true },
	},
	{
		filter = {
			event = "msg_show",
			kind = "",
			find = "seconds ago",
		},
		opts = { skip = true },
	},
	{
		filter = {
			event = "msg_show",
			kind = "",
			find = "second ago",
		},
		opts = { skip = true },
	},
}

local M = {
	"folke/noice.nvim",
	lazy = false,
	config = function()
		require("noice").setup({
			views = {
				cmdline_popup = {
					border = {
						style = "none",
						padding = { 2, 3 },
					},
					filter_options = {},
					win_options = {
						winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
					},
				},
			},
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
			routes = routes,
		})
	end,
	enabled = _G.enabled.noice,
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
