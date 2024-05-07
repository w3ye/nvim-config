local js = require("core.coding.dap.js")
-- local js_adapter = require("core.coding.dap.js").adapter
-- local js_configurations = require("core.coding.dap.js").configurations
local enabled = _G.enabled.dap

local M = {
	{
		"microsoft/vscode-js-debug",
		build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	},
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		-- config = require("core.coding.debugger").setup(),
		config = function()
			-- require("core.coding.debugger").setup()
			require("dap").adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "js-debug-adapter", -- As I'm using mason, this will be in the path
					args = { "${port}" },
				},
			}

			for _, language in ipairs({ "typescript", "javascript" }) do
				require("dap").configurations[language] = {
					{
						name = "Debug Platform Model",
						type = "pwa-node",
						request = "attach",
						remoteRoot = "/usr/src/app",
						localRoot = "${workspaceFolder}",
						-- protocol = "inspector",
						port = 9229,
						restart = true,
						address = "0.0.0.0",
						skipFiles = { "<node_internals>/**" },
						sourceMaps = true,
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach to node",
						processId = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
					},
				}
			end
		end,

		enabled = enabled,
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
					widgets.sidebar(widgets.scopes).open()
				end,
			},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		-- lazy = true,
		lazy = false,
		enabled = enabled,
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("dapui").setup({
				controls = {
					element = "repl",
					enabled = true,
					icons = {
						disconnect = "",
						pause = "",
						play = "",
						run_last = "",
						step_back = "",
						step_into = "",
						step_out = "",
						step_over = "",
						terminate = "",
					},
				},
				element_mappings = {},
				expand_lines = true,
				floating = {
					border = "single",
					mappings = {
						close = { "q", "<Esc>" },
					},
				},
				force_buffers = true,
				icons = {
					collapsed = "",
					current_frame = "",
					expanded = "",
				},
				layouts = {
					{
						elements = {
							{
								id = "scopes",
								size = 0.25,
							},
							{
								id = "watches",
								size = 0.25,
							},
							{
								id = "breakpoints",
								size = 0.25,
							},
							{
								id = "stacks",
								size = 0.25,
							},
						},
						position = "left",
						size = 60,
					},
					{
						elements = {
							{
								id = "repl",
								size = 0.25,
							},
							{
								id = "console",
								size = 0.25,
							},
						},
						position = "bottom",
						size = 10,
					},
				},
				mappings = {
					edit = "e",
					expand = { "<CR>", "<2-LeftMouse>" },
					open = "o",
					remove = "d",
					repl = "r",
					toggle = "t",
				},
				render = {
					indent = 1,
					max_value_lines = 100,
				},
			})

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
	-- js,
}

return M
