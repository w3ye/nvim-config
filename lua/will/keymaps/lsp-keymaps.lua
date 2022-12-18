return function(bufopts)
	vim.keymap.set("n", "gz", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gv", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", bufopts)
	vim.keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", bufopts)
	vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", bufopts)

	vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
	vim.keymap.set("n", "<space>cA", vim.lsp.buf.code_action, bufopts)

	vim.keymap.set("n", "<C-m>", vim.lsp.buf.signature_help, bufopts)

	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
end
