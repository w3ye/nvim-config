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

require("lazy").setup({
	-- lsp cmp
	{
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/playground",
		},
	},
	-- formatting
	{
		"jose-elias-alvarez/null-ls.nvim",
	},
	-- coding
	{
		"windwp/nvim-autopairs",
		"numToStr/Comment.nvim",
		"tpope/vim-surround",
		{ "abecodes/tabout.nvim", dependencies = { "nvim-treesitter" } },
		"folke/todo-comments.nvim",
		"mg979/vim-visual-multi",
	},
	-- git
	{
		"tpope/vim-fugitive",
		{ "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
		{ "lewis6991/gitsigns.nvim" },
	},
	-- themes
	{
		{ "catppuccin/nvim", name = "catppuccin" },
	},
	-- UI
	{
		"mrjones2014/nvim-ts-rainbow",
		"lukas-reineke/indent-blankline.nvim",
		"echasnovski/mini.nvim",
	},
	-- editor
	{
		"ethanholz/nvim-lastplace",
	},
	-- language
	{
		-- go
		{
			"ray-x/go.nvim",
		},
	},
}, {})
