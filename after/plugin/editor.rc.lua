require("nvim-lastplace").setup({
	lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
	lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
	lastplace_open_folds = true,
})

require("flit").setup({
	keys = { f = "f", F = "F", t = "t", T = "T" },
	-- A string like "nv", "nvo", "o", etc.
	labeled_modes = "nv",
	multiline = true,
	-- Like `leap`s similar argument (call-specific overrides).
	-- E.g.: opts = { equivalence_classes = {} }
	opts = {},
})

require("leap").set_default_keymaps()
