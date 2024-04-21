if _G.env == nil then
	print("env is nil")
	return
end

local M = {
	dap = {
		"mxsdev/nvim-dap-vscode-js",
		enabled = _G.enabled.dap,
		build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
		config = function()
			require("dap-vscode-js").setup({
				node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
				debugger_path = _G.env.js_debugger_path, -- Path to vscode-js-debug installation.
				debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
				adapters = {
					"chrome",
					"pwa-node",
					"pwa-chrome",
					"pwa-msedge",
					"node-terminal",
					"pwa-extensionHost",
					"node",
					"chrome",
				}, -- which adapters to register in nvim-dap
				-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
				-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
				-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
			})
		end,
	},

	adapter = function()
		require("dap").adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				-- 💀 Make sure to update this path to point to your installation
				args = { "~/.config/nvim/vscode-js-debug-1.82.0/src/dapDebugServer.ts", "${port}" },
			},
		}
	end,

	configurations = function()
		local js_based_languages = { "typescript", "javascript", "typescriptreact" }

		for _, language in ipairs(js_based_languages) do
			require("dap").configurations[language] = {
				{
					name = "Debug Platform Model",
					type = "pwa-node",
					request = "attach",
					remoteRoot = "/usr/src/app",
					localRoot = "${workspaceFolder}/platform-components",
					protocol = "inspector",
					port = 9229,
					restart = true,
					address = "0.0.0.0",
					skipFiles = { "<node_internals>/**" },
					sourceMaps = true,
				},
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-chrome",
					request = "launch",
					name = 'Start Chrome with "localhost"',
					url = "http://localhost:3000",
					webRoot = "${workspaceFolder}",
					userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
				},
			}
		end
	end,
}

return M
