vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local coding = require("core.coding.init")
local ui = require("core.ui")
local editor = require("core.editor")
local lang = require("core.language")
local lsp = require("core.lsp")

require("lazy").setup({
	lsp,
	-- telescope
	{
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.1",
			dependencies = { "nvim-lua/plenary.nvim" },
			event = "VimEnter",
			config = require("core.coding.telescope").setup,
			keys = require("core.coding.telescope").keys,
		},
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			{ "nvim-telescope/telescope-project.nvim", enabled = false },
		},
	},
	-- coding
	coding,
	-- UI
	ui,
	-- editor
	editor,
	-- language
	lang,
	-- copilot
}, {})
