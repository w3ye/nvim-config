local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")
telescope.load_extension("projects")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-t>"] = trouble.open_with_trouble,
			},
			n = { ["<C-t>"] = trouble.open_with_trouble },
		},
	},
	file_ignore_patterns = {
		"node_modules",
		".git",
		".editorconfig",
	},
	extensions = {
		-- workspaces = {
		--   keep_insert = true,
		-- }
	},
})
