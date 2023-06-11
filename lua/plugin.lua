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
        {
            "L3MON4D3/LuaSnip",
            dependencies = {
                "rafamadriz/friendly-snippets",
                "saadparwaiz1/cmp_luasnip",
            },
        },
    },
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
            build =
            "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        },
        {
            "nvim-telescope/telescope-live-grep-args.nvim",
            "nvim-telescope/telescope-project.nvim",
        },
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
        event = "LspAttach",
    },
    -- coding
    {
        "windwp/nvim-autopairs",
        "numToStr/Comment.nvim",
        "tpope/vim-surround",
        { "abecodes/tabout.nvim" },
        {
            {
                "folke/todo-comments.nvim",
                config = require("core.coding.todo").setup,
            },
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        "mg979/vim-visual-multi",
        "AckslD/nvim-trevJ.lua",
        "folke/trouble.nvim",
        {
            "glepnir/lspsaga.nvim",
            event = "LspAttach",
            dependencies = {
                { "nvim-tree/nvim-web-devicons" },
                --Please make sure you install markdown and markdown_inline parser
                { "nvim-treesitter/nvim-treesitter" },
            },
        },
        { "windwp/nvim-spectre", dependencies = "nvim-lua/plenary.nvim" },
        {
            "mfussenegger/nvim-dap",
            keys = {
                { "<leader>bt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>" },
                { "<leader>bc", "<cmd>lua require'dap'.continue()<cr>" },
                { "<leader>bi", "<cmd>lua require'dap'.step_into()<cr>" },
                { "<leader>bo", "<cmd>lua require'dap'.step_over()<cr>" },
                { "<leader>br", "<cmd>lua require'dap'.repl.open()<cr>" },
            },
        },
    },
    -- git
    {
        "tpope/vim-fugitive",
        { "lewis6991/gitsigns.nvim" },
        { "TimUntersberger/neogit", dependencies = "nvim-lua/plenary.nvim" },
        { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" },
        { "kdheepak/lazygit.nvim" },
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
        {
            "nvim-neo-tree/neo-tree.nvim",
            version = "v2.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim",
            },
            config = require("core.ui.neotree").setup,
            keys = require("core.ui.neotree").keys,
        },
        {
            "s1n7ax/nvim-window-picker",
            version = "v1.*",
        },
        "beauwilliams/focus.nvim",
        {
            "glepnir/dashboard-nvim",
            event = "VimEnter",
            dependencies = { { "nvim-tree/nvim-web-devicons" } },
        },
        {
            "folke/noice.nvim",
            keys = require("keymaps.noice").keys,
        },
        {
            "rcarriga/nvim-notify",
            config = function()
                require("core.notify").setup()
            end,
        },
    },
    {
        "romgrk/barbar.nvim",
        event = "VimEnter",
        dependencies = "nvim-tree/nvim-web-devicons",
        version = "^1.0.0", -- optional: only update when a new 1.x version is released
        keys = require("core.ui.barbar").keys,
    },
    -- editor
    {
        "ethanholz/nvim-lastplace",
        "ggandor/flit.nvim",
        "ggandor/leap.nvim",
        "gpanders/editorconfig.nvim",
        {
            "folke/which-key.nvim",
            event = "VeryLazy",
            init = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 500
            end,
            config = require("core.editor.which_key").setup,
        },
        {
            "ThePrimeagen/harpoon",
            keys = {
                { "<leader>hm", '<cmd>lua require("harpoon.mark").add_file()<cr>',        desc = "harpoon mark" },
                { "<leader>ht", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', desc = "harpoon toggle" },
            },
        },
        {
            -- bookmark
            "tomasky/bookmarks.nvim",
            event = "VimEnter",
            config = function()
                require("bookmarks").setup({
                    -- sign_priority = 8,  --set bookmark sign priority to cover other sign
                    save_file = vim.fn.expand("$HOME/.bookmarks"), -- bookmarks save file path
                    keywords = {
                            ["@t"] = "☑️ ",     -- mark annotation startswith @t ,signs this icon as `Todo`
                            ["@w"] = "⚠️ ",     -- mark annotation startswith @w ,signs this icon as `Warn`
                            ["@f"] = "⛏ ",        -- mark annotation startswith @f ,signs this icon as `Fix`
                            ["@n"] = " ",        -- mark annotation startswith @n ,signs this icon as `Note`
                    },
                    on_attach = function(bufnr)
                        local bm = require("bookmarks")
                        local map = vim.keymap.set
                        map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
                        map("n", "mi", bm.bookmark_ann) -- add or edit mark annotation at current line
                        map("n", "mc", bm.bookmark_clean) -- clean all marks in local buffer
                        map("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
                        map("n", "mp", bm.bookmark_prev) -- jump to previous mark in local buffer
                    end,
                })
            end,
        },
    },
    -- language
    {
        -- go
        {
            "ray-x/go.nvim",
            dependencies = { -- optional packages
                "ray-x/guihua.lua",
                "neovim/nvim-lspconfig",
                "nvim-treesitter/nvim-treesitter",
            },
            config = function()
                require("go").setup()
            end,
            keys = {
                { "<leader>tf", "<cmd>GoTestFile<cr>" },
                { "<leader>tF", "<cmd>GoTestFunc<cr>" },
            },
            event = { "CmdlineEnter" },
            ft = { "go", "gomod" },
            build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
        },
        -- testing framework
        {
            "nvim-neotest/neotest",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-treesitter/nvim-treesitter",
                "antoinemadec/FixCursorHold.nvim",
                "thenbe/neotest-playwright",
            },
            keys = require("core.neotest").keys,
            config = function()
                require("core.neotest").neotest_setup()
            end,
            event = "BufEnter *.spec.ts",
        },
    },
    -- copilot
    {
        {
            "zbirenbaum/copilot.lua",
            dependencies = "zbirenbaum/copilot-cmp",
            cmd = "Copilot",
            event = "InsertEnter",
        },
        "zbirenbaum/copilot-cmp",
    },
}, {})
