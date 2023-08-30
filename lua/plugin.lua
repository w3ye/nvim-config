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
	coding,
	ui,
	editor,
	lang,
}, {})
