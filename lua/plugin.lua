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

require("lazy").setup({
	-- lsp cmp
	{
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	-- snippets
	{
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
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
		{ "abecodes/tabout.nvim" },
		"folke/todo-comments.nvim",
		"mg979/vim-visual-multi",
		"AckslD/nvim-trevJ.lua",
		"folke/trouble.nvim",
	},
	-- git
	{
		"tpope/vim-fugitive",
		{ "lewis6991/gitsigns.nvim" },
		{ "TimUntersberger/neogit", dependencies = "nvim-lua/plenary.nvim" },
		{ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" },
	},
	-- UI
	{
		-- themes
		{
			{ "catppuccin/nvim", name = "catppuccin" },
		},
		"mrjones2014/nvim-ts-rainbow",
		"lukas-reineke/indent-blankline.nvim",
		"echasnovski/mini.nvim",
		"nvim-lualine/lualine.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	-- editor
	{
		"ethanholz/nvim-lastplace",
		"ggandor/flit.nvim",
		"ggandor/leap.nvim",
	},
	-- language
	{
		-- go
		{
			"ray-x/go.nvim",
		},
	},
}, {})
