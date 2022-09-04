-- vim.cmd [[packadd packer.vim]]

require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use({
    "neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
  })
  use({
    {
      "L3MON4D3/LuaSnip",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  })
  use("editorconfig/editorconfig-vim")
  use("kyazdani42/nvim-web-devicons")
  use("tpope/vim-surround")
  -- use 'prettier/vim-prettier'
  use("safv12/andromeda.vim")
  use("nvim-treesitter/nvim-treesitter")
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  })
  use("EdenEast/nightfox.nvim")
  use("olivercederborg/poimandres.nvim")
  use("folke/tokyonight.nvim")
  use("Everblush/everblush.nvim")
  use({
    "windwp/nvim-autopairs",
    config = function()
      require('nvim-autopairs').setup()
    end
  })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require('lualine').setup()
    end,
  })
  use({
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup()
    end,
  })
  use("tpope/vim-fugitive")
  use({
    "nvim-neo-tree/neo-tree.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
    },
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
  use 'arkav/lualine-lsp-progress'
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'onsails/lspkind.nvim'
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use "natecraddock/workspaces.nvim"
  use "natecraddock/sessions.nvim"
  -- Lua tab out
  use {
    'abecodes/tabout.nvim',
    config = function()
      require('tabout').setup {
        tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = '<C-d>', -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = true, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = '`', close = '`' },
          { open = '(', close = ')' },
          { open = '[', close = ']' },
          { open = '{', close = '}' }
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {} -- tabout will ignore these filetypes
      }
    end,
    wants = { 'nvim-treesitter' }, -- or require if not used so far
    after = { 'nvim-cmp' } -- if a completion plugin is using tabs load it before
  }
end
)
