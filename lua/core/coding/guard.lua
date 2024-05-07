local M = {
	{
		"stevearc/conform.nvim",
		enabled = _G.enabled.conform_formatter,
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					typescriptreact = { "prettier" },
					go = { "gofmt" },
					rust = { "rustfmt" },
				},
				format_on_save = function(bufnr)
					vim.lsp.buf.format({ bufnr = bufnr })
					return { timeout_ms = 5000, lsp_fallback = false }
				end,
			})
		end,
		opts = {},
	},
}

return M
