local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")
local telescopeConfig = require("telescope.config")
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
telescope.load_extension("projects")

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")

telescope.setup({
	defaults = {
		vimgrep_arguments = vimgrep_arguments,
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-t>"] = trouble.open_with_trouble,
				["<C-d>"] = actions.delete_buffer,
			},
			n = {
				["<C-t>"] = trouble.open_with_trouble,
				["<C-d>"] = actions.delete_buffer,
			},
		},
	},
	extensions = {
		-- workspaces = {
		--   keep_insert = true,
		-- }
	},
})
