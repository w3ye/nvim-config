local enabled = require("core.enabled").cmp
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
	},
}
return M
