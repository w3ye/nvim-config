require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "go", "javascript", "typescript", "css", "json", "yaml", "python" },
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	context_commentstring = {
		enable = true,
		config = {
			javascript = {
				__default = "// %s",
				jsx_element = "{/* %s */}",
				jsx_fragment = "{/* %s */}",
				jsx_attribute = "// %s",
				comment = "// %s",
			},
		},
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-space>", -- set to `false` to disable one of the mappings
			node_incremental = "<C-space>",
			scope_incremental = "<C-s>",
			node_decremental = "<C-z>",
		},
	},
	indent = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["<leader>mn"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["<leader>mN"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["<leader>mp"] = "@function.outer",
				["[["] = "@class.outer",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},
	textsubjects = {
		enable = true,
		prev_selection = ",", -- (Optional) keymap to select the previous selection
		keymaps = {
			["<cr>"] = "textsubjects-smart",
			["."] = "textsubjects-container-outer",
			["i;"] = "textsubjects-container-inner",
		},
	},
})
