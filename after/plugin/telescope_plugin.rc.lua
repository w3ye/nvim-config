local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")
local actions = require("telescope.actions")
telescope.load_extension("file_browser")
telescope.load_extension("live_grep_args")

telescope.setup({
	extensions = {
		live_grep_args = {
			auto_quoting = true, -- enable/disable auto-quoting
			-- override default mappings
			-- default_mappings = {},
			mappings = { -- extend mappings
				i = {
					["<C-l>"] = lga_actions.quote_prompt(),
					["<C-k>"] = actions.move_selection_previous,
				},
			},
		},

		file_browser = {
			theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
	},
})
