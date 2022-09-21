local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")
local telescopeConfig = require("telescope.config")
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
telescope.load_extension("projects")
telescope.load_extension("fzf")
telescope.load_extension("hop")

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
				["<C-p>"] = telescope.extensions.hop.hop,
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
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			case_mode = "smart_case",
		},
		hop = {
			-- the shown `keys` are the defaults, no need to set `keys` if defaults work for you ;)
			keys = {
				"a",
				"s",
				"d",
				"f",
				"g",
				"h",
				"j",
				"k",
				"l",
				";",
				"q",
				"w",
				"e",
				"r",
				"t",
				"y",
				"u",
				"i",
				"o",
				"p",
				"A",
				"S",
				"D",
				"F",
				"G",
				"H",
				"J",
				"K",
				"L",
				":",
				"Q",
				"W",
				"E",
				"R",
				"T",
				"Y",
				"U",
				"I",
				"O",
				"P",
			},
			-- Highlight groups to link to signs and lines; the below configuration refers to demo
			-- sign_hl typically only defines foreground to possibly be combined with line_hl
			sign_hl = { "WarningMsg", "Title" },
			-- optional, typically a table of two highlight groups that are alternated between

			line_hl = { "CursorLine", "Normal" },

			-- options specific to `hop_loop`
			-- true temporarily disables Telescope selection highlighting
			clear_selection_hl = false,
			-- highlight hopped to entry with telescope selection highlight
			-- note: mutually exclusive with `clear_selection_hl`
			trace_entry = true,
			-- jump to entry where hoop loop was started from
			reset_selection = true,
		},
	},
})
