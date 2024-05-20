local js = require("core.coding.debugger.js")
local ui = require("core.coding.debugger.ui")
local enabled = _G.enabled.dap

function conditional_breakpoint()
	local condition = vim.fn.input("Condition: ")
	require("dap").set_breakpoint(condition, nil, nil)
end

local M = {
	{
		"microsoft/vscode-js-debug",
		build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	},
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		config = function()
			js.adapter_setup()
		end,
		enabled = enabled,
		keys = {
			{ "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle breakpoint" },
			{ "<leader>bc", conditional_breakpoint, desc = "Conditional breakpoint" },
			{ "<F5>", "<cmd>lua require'dap'.continue()<cr>", desc = "Debug continue" },
			{ "<F7>", "<cmd>lua require'dap'.step_into()<cr>", desc = "Debug step into" },
			{ "<F8>", "<cmd>lua require'dap'.step_over()<cr>", desc = "Debug step over" },
		},
	},
	ui,
}

return M
