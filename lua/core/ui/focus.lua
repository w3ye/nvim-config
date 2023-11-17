local M = {
	"nvim-focus/focus.nvim",
	version = false,
	enable = _G.enabled.focus,
	lazy = false,
	config = function()
		require("focus").setup({
			enable = true,
			autoresize = {
				height_quickfix = 10, -- Set the height of quickfix panel
			},
			ui = {
				cursorline = false, -- Display a cursorline in the focussed window only
				signcolumn = false, -- Display signcolumn in the focussed window only
			},
		})
		-- require("focus").setup({ autoresize = { enable = false } })
		-- local ignore_filetypes = { "neo-tree" }
		-- local ignore_buftypes = { "nofile", "prompt", "popup", "diffview" }
		-- local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })
		--
		-- vim.api.nvim_create_autocmd("WinEnter", {
		-- 	group = augroup,
		-- 	callback = function(_)
		-- 		if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
		-- 			vim.b.focus_disable = true
		-- 		end
		-- 	end,
		-- 	desc = "Disable focus autoresize for BufType",
		-- })
		--
		-- vim.api.nvim_create_autocmd("FileType", {
		-- 	group = augroup,
		-- 	callback = function(_)
		-- 		if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
		-- 			vim.b.focus_disable = true
		-- 		end
		-- 	end,
		-- 	desc = "Disable focus autoresize for FileType",
		-- })
	end,

	keys = {
		{ "<c-h>", "<cmd>FocusSplitLeft<CR>" },
		{ "<c-j>", "<cmd>FocusSplitDown<CR>" },
		{ "<c-k>", "<cmd>FocusSplitUp<CR>" },
		{ "<c-l>", "<cmd>FocusSplitRight<CR>" },
		{
			"<leader>l",
			function()
				require("focus").split_nicely()
			end,
			desc = "split nicely",
		},
		{ "<leader>mn", "<cmd>FocusToggle<cr>" },
		{ "<leader>mm", "<cmd>FocusMaximise<cr>" },
		{ "<leader>me", "<cmd>FocusEqualise<cr>" },
	},
}

return M
