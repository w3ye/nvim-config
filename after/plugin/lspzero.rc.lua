local lsp = require("lsp-zero")
local co = require("will.cmp-options")
local lsp_conf = require("will.lsp-config")
local lang_opt = lsp_conf.lang_options
local cmp = require("cmp")
require("neodev").setup({})

lsp.preset("recommended")
lsp.ensure_installed({
	"tsserver",
	"eslint",
	"sumneko_lua",
	"gopls",
})

lsp.on_attach(function(client, bufnr)
	lsp_conf.on_attach(client, bufnr)
end)

lsp.set_preferences = {
	sign_icons = {
		error = " ",
		warn = " ",
		hint = " ",
		info = " ",
	},
}

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

lsp.configure("gopls", lang_opt.go)

lsp.configure("sumneko_lua", lang_opt.lua)

lsp.setup_nvim_cmp({
	snippet = co.snippet,
	sources = co.sources,
	mapping = co.mapping,
	formatting = co.formatting,
	enabled = co.enabled,
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
