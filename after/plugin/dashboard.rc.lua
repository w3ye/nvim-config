require("dashboard").setup({
	config = {
		week_header = {
			enable = true,
		},
		shortcut = {
			{ desc = " Update", group = "@property", action = "PackerUpdate", key = "u" },
			{
				desc = " Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = "Search",
				group = "Label",
				action = "Telescope find_files",
				key = "s",
			},
			{
				desc = "🖿 Projects",
				group = "Label",
				action = "Telescope projects",
				key = "p",
			},
			{
				desc = " Telescope",
				group = "DiagnosticHint",
				action = "Telescope",
				key = "t",
			},
		},
		pacakges = { enable = true },
	},
})
