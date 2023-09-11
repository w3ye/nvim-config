_G.enabled = require("enabled")
local envOk, env = pcall(require, "env")
if not envOk then
	print("env.lua not found, please copy env.example.lua to env.lua and set your environment variables")
	_G.enabled.dap = false
end
_G.env = env

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

require("plugin")
