require("lspsaga").setup({
	request_timeout = 3000,
	diagnostic = {
		max_height = 0.8,
		keys = {
			quit = { "q", "<ESC>" },
		},
	},
	preview = {
		lines_above = 0,
		lines_below = 10,
	},
	scroll_preview = {
		scroll_down = "<c-j>",
		scroll_up = "<c-k>",
	},
	lightbulb = {
		enable = false,
		enable_in_insert = false,
		virtual_text = false,
	},
})
