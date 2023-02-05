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
				desc = " Telescope",
				group = "DiagnosticHint",
				action = "Telescope app",
				key = "t",
			},
			{
				desc = "Projects",
				group = "DiagnosticHint",
				action = "Telescope projects",
				key = "p",
			},
		},
		pacakges = { enable = true },
	},
})
