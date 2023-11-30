local enabled = _G.enabled.cmp
local M = {
	{ "rafamadriz/friendly-snippets", enabled = enabled },
	"saadparwaiz1/cmp_luasnip",
	{
		"L3MON4D3/LuaSnip",
		enabled = enabled,
		dependencies = {
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}

return M
