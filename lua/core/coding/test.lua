local M = {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-jest",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-jest")({
						jestCommand = "yarn test -- --",
						jestConfigFile = "custom.jest.config.ts",
						env = { CI = true },
						cwd = function(path)
							return vim.fn.getcwd()
						end,
					}),
				},
			})
		end,
		keys = {
			{
				"<leader>nts",
				'<cmd>lua require("neotest").summary.toggle()<cr>',
				desc = "Toggle neotest summary",
			},
			{ "<leader>nr", '<cmd>lua require("neotest").run.run()', desc = "Run closest test" },
			{
				"<leader>nra",
				'<cmd>lua require("neotest").run.attach()',
				desc = "Attach closest test",
			},
			{
				"<leader>nrr",
				'<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>',
				desc = "Run the whole file",
			},
		},
	},
}

return M
