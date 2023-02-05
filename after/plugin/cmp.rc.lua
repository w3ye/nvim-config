local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
local cmp_keymaps = require("will.keymaps.cmp-keymaps")
local types = require("cmp.types")

cmp.setup({
	sources = cmp.config.sources({
		{ name = "luasnip" }, -- For luasnip users.
		{
			name = "nvim_lsp",
			entry_filter = function(entry, ctx)
				return types.lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
			end,
		},
		{ name = "buffer", keyword_length = 3 },
		{ name = "path" },
	}),
	mapping = cmp_keymaps,
	snippet = {
		cmp.config.sources({
			{ name = "luasnip" }, -- For luasnip users.
			{
				name = "nvim_lsp",
				entry_filter = function(entry, ctx)
					return types.lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
				end,
			},
			{ name = "buffer", keyword_length = 3 },
			{ name = "path" },
		}),
	},
	enabled = function()
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
	end,
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
	enabled = true,
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
