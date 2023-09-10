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
		enabled = _G.enabled.dap,
		keys = {
			{ "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle breakpoint" },
			{ "<F5>", "<cmd>lua require'dap'.continue()<cr>", desc = "Debug continue" },
			{ "<F7>", "<cmd>lua require'dap'.step_into()<cr>", desc = "Debug step into" },
			{ "<F8>", "<cmd>lua require'dap'.step_over()<cr>", desc = "Debug step over" },
			{ "<leader>bu", "<cmd>DapUiToggle<cr>", desc = "Dap ui toggle" },
			{
				"<Leader>bh",
				function()
					require("dap.ui.widgets").hover()
				end,
				desc = "widget hover",
				mode = { "n", "v" },
			},
			{

				"<Leader>bp",
				function()
					require("dap.ui.widgets").preview()
				end,
				desc = "widget preview",
				mode = { "n", "v" },
			},
			{
				"<Leader>bs",
				function()
					local widgets = require("dap.ui.widgets")
					widgets.centered_float(widgets.scopes)
				end,
			},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		enabled = _G.enabled.dap,
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
