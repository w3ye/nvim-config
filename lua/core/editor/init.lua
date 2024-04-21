local enabled = _G.enabled
local bookmarks = require("core.editor.bookmarks")
local oil = require("core.editor.oil")
local undotree = require("core.editor.undotree")

local minor_setup = {
	"gpanders/editorconfig.nvim",
	{
		"ethanholz/nvim-lastplace",
		enabled = enabled.lastplace,
		config = function()
			require("nvim-lastplace").setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
				lastplace_open_folds = true,
			})
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		enabled = _G.enabled.flash,
		opts = {
			modes = {
				search = {
					enabled = false,
				},
			},
		},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            {
                "<leader>S",
                mode = { "n", "x", "o" },
                function() require("flash").treesitter() end,
                desc =
                "Flash Treesitter"
            },
            {
                "r",
                mode = "o",
                function() require("flash").remote() end,
                desc =
                "Remote Flash"
            },
            {
                "R",
                mode = { "o", "x" },
                function() require("flash").treesitter_search() end,
                desc =
                "Treesitter Search"
            },
            {
                "<c-s>",
                mode = { "c" },
                function() require("flash").toggle() end,
                desc =
                "Toggle Flash Search"
            },
        },
	},
	{
		"folke/which-key.nvim",
		enabled = enabled.which_key,
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		config = function()
			local wk = require("which-key")
			wk.register({
				t = {
					name = "Tree & test",
				},
			}, { prefix = "<leader>" })
		end,
	},
	{
		"ThePrimeagen/harpoon",
		enabled = enabled.harpoon,
		keys = {
			{ "<leader>hm", '<cmd>lua require("harpoon.mark").add_file()<cr>', desc = "harpoon mark" },
			{ "<leader>ht", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', desc = "harpoon toggle" },
		},
	},
	{
		"kevinhwang91/nvim-bqf",
		enabled = enabled.bqf,
	},
	{
		"junegunn/fzf",
		build = function()
			vim.fn["fzf#install"]()
		end,
	},
	{ "duane9/nvim-rg" },
}
local M = {
	minor_setup,
	bookmarks,
	oil,
	undotree,
}

return M
