local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")
local telescopeConfig = require("telescope.config")
local lga_actions = require("telescope-live-grep-args.actions")
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
telescope.load_extension("projects")
telescope.load_extension("live_grep_args")

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.git/*")
table.insert(vimgrep_arguments, "--no-ignore")

telescope.setup({
	defaults = {
		vimgrep_arguments = vimgrep_arguments,
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-t>"] = trouble.open_with_trouble,
				["<C-d>"] = actions.delete_buffer,
				["<C-u>"] = false,
			},
			n = {
				["<C-t>"] = trouble.open_with_trouble,
				["<C-d>"] = actions.delete_buffer,
			},
		},
		file_ignore_patterns = {
			"node_modules",
		},
	},

	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "--no-ignore", "--glob", "!.git/*" },
		},
	},
	extensions = {
		live_grep_args = {
			auto_quoting = true, -- enable/disable auto-quoting
			-- override default mappings
			-- default_mappings = {},
			mappings = { -- extend mappings
				i = {
					["<C-l>"] = lga_actions.quote_prompt(),
				},
			},
		},
	},
})
