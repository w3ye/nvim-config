local M = {
	"nvim-focus/focus.nvim",
	enable = require("core.enabled").focus,
	config = function()
		require("focus").setup({
			enable = true,
			autoresize = {
				enable = false, -- Enable or disable auto-resizing of splits
				height_quickfix = 10, -- Set the height of quickfix panel
			},
			ui = {
				cursorline = false, -- Display a cursorline in the focussed window only
				signcolumn = false, -- Display signcolumn in the focussed window only
			},
			split = {
				bufnew = false, -- Create blank buffer for new split windows
			},
		})
		require("focus").setup({ autoresize = { enable = false } })
		local ignore_filetypes = { "neo-tree" }
		local ignore_buftypes = { "nofile", "prompt", "popup", "diffview" }
		local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

		vim.api.nvim_create_autocmd("WinEnter", {
			group = augroup,
			callback = function(_)
				if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
					vim.b.focus_disable = true
				end
			end,
			desc = "Disable focus autoresize for BufType",
		})

		vim.api.nvim_create_autocmd("FileType", {
			group = augroup,
			callback = function(_)
				if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
					vim.b.focus_disable = true
				end
			end,
			desc = "Disable focus autoresize for FileType",
		})
	end,

	keys = {
		{ "<c-h>", "<cmd>FocusSplitLeft<CR>" },
		{ "<c-j>", "<cmd>FocusSplitDown<CR>" },
		{ "<c-k>", "<cmd>FocusSplitUp<CR>" },
		{ "<c-l>", "<cmd>FocusSplitRight<CR>" },
		{ "<leader>mn", "<cmd>FocusToggle<cr>" },
		{ "<leader>mm", "<cmd>FocusMaximise<cr>" },
		{ "<leader>me", "<cmd>FocusEqualise<cr>" },
	},
}

return M
