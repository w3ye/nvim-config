local M = {
	"mfussenegger/nvim-dap",
	config = require("core.coding.debugger").setup,
	enabled = require("core.enabled").dap,
	keys = {
		{ "<leader>bt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle breakpoint" },
		{ "<leader>bc", "<cmd>lua require'dap'.continue()<cr>", desc = "Debug continue" },
		{ "<F7>", "<cmd>lua require'dap'.step_into()<cr>", desc = "Debug step into" },
		{ "<F8>", "<cmd>lua require'dap'.step_over()<cr>", desc = "Debug step over" },
		{ "<leader>br", "<cmd>lua require'dap'.repl.open()<cr>", desc = "Dap open" },
	},
}

return M
