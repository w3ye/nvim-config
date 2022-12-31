local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
local cmp_keymaps = require("will.keymaps.cmp-keymaps")
local types = require("cmp.types")

local snippet = {
	expand = function(args)
		require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
	end,
}

local sources = cmp.config.sources({
	{ name = "luasnip" }, -- For luasnip users.
	{
		name = "nvim_lsp",
		entry_filter = function(entry, ctx)
			return types.lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
		end,
	},
	{ name = "buffer", keyword_length = 3 },
	{ name = "path" },
})

local formatting = {
	format = lspkind.cmp_format({
		mode = "symbol_text",
		maxwidth = 50,
		menu = {
			buffer = "[buffer]",
			nvim_lsp = "[lsp]",
			luasnip = "[lua_snip]",
		},
	}),
}

local enabled = function()
	local context = require("cmp.config.context")
	if
		vim.api.nvim_get_mode().mode == "c"
		or vim.api.nvim_buf_get_option(0, "buftype") == ("prompt" or "nofile")
		or vim.bo.filetype == "gitcommit"
	then
		return false
	else
		return not context.in_treesitter_capture("comment") and not context.in_syntax_group("comment")
	end
end

return {
	snippet = snippet,
	mapping = cmp_keymaps,
	sources = sources,
	formatting = formatting,
	enabled = enabled,
}
