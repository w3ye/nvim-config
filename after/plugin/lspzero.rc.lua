local lsp = require("lsp-zero")
local cmp_options = require("will.cmp-options")
local lsp_config = require("will.lsp-config")
local lang_options = lsp_config.lang_options
require("neodev").setup({})

lsp.preset("recommended")
lsp.ensure_installed({
	"tsserver",
	"eslint",
	"sumneko_lua",
	"gopls",
})

lsp.on_attach(function(client, bufnr)
	lsp_config.on_attach(client, bufnr)
end)

lsp.set_preferences = {
	sign_icons = {
		error = " ",
		warn = " ",
		hint = " ",
		info = " ",
	},
}

lsp.configure("gopls", {
	lang_options.go,
})

lsp.configure("sumneko_lua", {
	lang_options.lua,
})

lsp.setup_nvim_cmp({
	snippet = cmp_options.snippet,
	sources = cmp_options.options,
	mapping = cmp_options.mapping,
	formatting = cmp_options.formatting,
	enabled = cmp_options.enabled,
})

-- diagnostic settings
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

lsp.setup()
