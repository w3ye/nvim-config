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
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build =
      "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
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
    { "folke/todo-comments.nvim", "JoosepAlviste/nvim-ts-context-commentstring" },
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
    "folke/noice.nvim",
    "rcarriga/nvim-notify",
  },
  {
    "romgrk/barbar.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
  },
  -- editor
  {
    "ethanholz/nvim-lastplace",
    "ggandor/flit.nvim",
    "ggandor/leap.nvim",
    "gpanders/editorconfig.nvim",
  },
  -- language
  {
    -- go
    {
      "ray-x/go.nvim",
      event = "LspAttach",
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
