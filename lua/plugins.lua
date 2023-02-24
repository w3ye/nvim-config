-- vim.cmd [[packadd packer.vim]]

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})
	use("editorconfig/editorconfig-vim")
	use("kyazdani42/nvim-web-devicons")
	use("tpope/vim-surround")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			"nvim-treesitter/playground",
		},
	})
	use("RRethy/nvim-treesitter-textsubjects")
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
	})
	use({
		"lewis6991/gitsigns.nvim",
	})
	use({ "EdenEast/nightfox.nvim" })
	use({
		"rose-pine/neovim",
	})
	use("olivercederborg/poimandres.nvim")
	use("Everblush/everblush.nvim")
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({})
		end,
	})
	use({
		"numToStr/Comment.nvim",
		requires = {
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
		},
	})
	use("tpope/vim-fugitive")
	use({
		"kyazdani42/nvim-tree.lua",
	})
	use({
		"ldelossa/gh.nvim",
		requires = { { "ldelossa/litee.nvim" } },
		config = {
			function()
				require("litee.lib").setup()
				require("litee.gh").setup()
			end,
		},
	})
	use("APZelos/blamer.nvim")
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use("arkav/lualine-lsp-progress")
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("onsails/lspkind.nvim")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use("ahmedkhalf/project.nvim")
	-- Lua tab out
	use({
		"abecodes/tabout.nvim",
		wants = { "nvim-treesitter" }, -- or require if not used so far
		after = { "nvim-cmp" }, -- if a completion plugin is using tabs load it before
	})
	-- use("glepnir/dashboard-nvim")
	use("MattesGroeger/vim-bookmarks")
	use("folke/trouble.nvim")
	use("folke/todo-comments.nvim")
	use("beauwilliams/focus.nvim")
	use("mg979/vim-visual-multi")
	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})
	use("xiyaowong/nvim-cursorword")
	use("p00f/nvim-ts-rainbow")
	use({
		"ggandor/leap.nvim",
		requires = "tpope/vim-repeat",
	})
	use({
		"ggandor/flit.nvim",
		config = function()
			require("flit").setup({
				keys = { f = "f", F = "F", t = "t", T = "T" },
				-- A string like "nv", "nvo", "o", etc.
				labeled_modes = "v",
				multiline = true,
				-- Like `leap`s similar argument (call-specific overrides).
				-- E.g.: opts = { equivalence_classes = {} }
				opts = {},
			})
		end,
	})
	use({ "AckslD/nvim-trevJ.lua" })
	use({
		"junegunn/fzf.vim",
		requires = { "junegunn/fzf" },
	})
	use({
		"ethanholz/nvim-lastplace",
		config = function()
			require("nvim-lastplace").setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
				lastplace_open_folds = true,
			})
		end,
	})
	use({
		"ray-x/go.nvim",
		config = function()
			require("go").setup()
		end,
	})
	use("ray-x/guihua.lua")
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = { { "nvim-tree/nvim-web-devicons" } },
	})
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use("romgrk/barbar.nvim")
	use("SmiteshP/nvim-navic")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-hop.nvim" })
	use("akinsho/toggleterm.nvim")
	use({ "kdheepak/lazygit.nvim" })
	use("lukas-reineke/indent-blankline.nvim")
	use("MunifTanjim/prettier.nvim")
	use("folke/neodev.nvim")
	use("lewis6991/impatient.nvim")
	use({
		"glepnir/dashboard-nvim",

		event = "VimEnter",
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "mfussenegger/nvim-dap" })
	-- rest client
	use({
		"rest-nvim/rest.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("rest-nvim").setup({
				-- Open request results in a horizontal split
				result_split_horizontal = false,
				-- Keep the http file buffer above|left when split horizontal|vertical
				result_split_in_place = false,
				-- Skip SSL verification, useful for unknown certificates
				skip_ssl_verification = false,
				-- Encode URL before making request
				encode_url = true,
				-- Highlight request on run
				highlight = {
					enabled = true,
					timeout = 150,
				},
				result = {
					-- toggle showing URL, HTTP info, headers at top the of result window
					show_url = true,
					show_http_info = true,
					show_headers = true,
					-- executables or functions for formatting response body [optional]
					-- set them to false if you want to disable them
					formatters = {
						json = "jq",
						html = function(body)
							return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
						end,
					},
				},
				-- Jump to request line on run
				jump_to_request = false,
				env_file = ".env",
				custom_dynamic_variables = {},
				yank_dry_run = true,
			})
		end,
	})
	use({ "tomarrell/vim-npr" })
end)
