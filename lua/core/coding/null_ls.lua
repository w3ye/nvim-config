local null_ls = require("null-ls")

local M = {
	"jose-elias-alvarez/null-ls.nvim",
	event = "LspAttach",
	lazy = false,
	enable = _G.enabled.null_ls,
	config = function()
		local formatting = null_ls.builtins.formatting
		-- local diagnostics = null_ls.builtins.diagnostics
		local cmp = null_ls.builtins.completion

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = {
				formatting.stylua,
				formatting.prettier.with({
					extra_params = { "--single-quote", "--jsx-single-quote", "--semi" },
				}),
				formatting.gofmt,
				formatting.rustfmt,
				-- diagnostics.eslint,
				cmp.spell,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}

return M
