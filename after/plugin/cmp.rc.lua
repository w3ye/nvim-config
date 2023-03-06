local cmp = require("cmp")
local cmp_keymaps = require("will.keymaps.cmp-keymaps")
local types = require("cmp.types")
local lspkind = require("lspkind")

cmp.setup({
	sources = cmp.config.sources({
		{ name = "luasnip" }, -- For luasnip users.
		{ name = "nvim_lua" },
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
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			maxwidth = 50,
			menu = {
				buffer = "[buffer]",
				nvim_lsp = "[lsp]",
				nvim_lua = "[lua api]",
				luasnip = "[snip]",
			},
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
	experimental = {
		ghost_text = true,
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline({
		["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<C-o>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
	}),
	sources = {
		{ name = "buffer" },
	},
})
