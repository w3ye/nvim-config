local js = require("core.coding.dap.js").dap
local js_adapter = require("core.coding.dap.js").adapter
local js_configurations = require("core.coding.dap.js").configurations

local M = {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		-- config = require("core.coding.debugger").setup(),
		config = function()
			require("core.coding.debugger").setup()
			js_adapter()
			js_configurations()
		end,
		enabled = require("core.enabled").dap,
		keys = {
			{ "<leader>bt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle breakpoint" },
			{ "<leader>bc", "<cmd>lua require'dap'.continue()<cr>", desc = "Debug continue" },
			{ "<F7>", "<cmd>lua require'dap'.step_into()<cr>", desc = "Debug step into" },
			{ "<F8>", "<cmd>lua require'dap'.step_over()<cr>", desc = "Debug step over" },
			{ "<leader>br", "<cmd>lua require'dap'.repl.open()<cr>", desc = "Dap open" },
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		enabled = require("core.enabled").dap,
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("dapui").setup()

			local dap, dapui = require("dap"), require("dapui")

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end
		end,
		keys = {
			{ "<leader>ui", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle DAP UI" },
		},
	},
	js,
}

return M
