local themes = require("core.ui.themes")
local blankline = require("core.ui.blankline")
local mini = require("core.ui.mini")
local lualine = require("core.ui.lualine")
local focus = require("core.ui.focus")
local dashboard = require("core.ui.dashboard")
local noice = require("core.ui.noice")
local notify = require("core.ui.notify")
local barbar = require("core.ui.barbar")

local M = {
	themes,
	"mrjones2014/nvim-ts-rainbow",
	blankline,
	mini,
	lualine,
	"nvim-tree/nvim-web-devicons",
	{
		"s1n7ax/nvim-window-picker",
		version = "v1.*",
		config = function()
			require("window-picker").setup({})
		end,
	},
	focus,
	dashboard,
	noice,
	notify,
	barbar,
}

return M
