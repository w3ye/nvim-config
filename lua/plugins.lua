-- vim.cmd [[packadd packer.vim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
  }
  use {
    {
      'L3MON4D3/LuaSnip',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end
    },
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
  }
  use 'editorconfig/editorconfig-vim'
  use 'kyazdani42/nvim-web-devicons'
  use 'tpope/vim-surround'
  -- use 'prettier/vim-prettier'
  use 'safv12/andromeda.vim'
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  use 'EdenEast/nightfox.nvim'
  use 'jiangmiao/auto-pairs'
  use {
    'feline-nvim/feline.nvim',
    config = function()
      vim.opt.termguicolors = true
      require("feline").setup()
    end
  }
  use {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup()
    end
  }
  use 'tpope/vim-fugitive'
  use {
    'nvim-neo-tree/neo-tree.nvim',
    requires = {
      'MunifTanjim/nui.nvim'
    }
  }
  use {
    'ldelossa/gh.nvim',
    requires = { { 'ldelossa/litee.nvim' } },
    config = {
      function()
        require('litee.lib').setup()
        require('litee.gh').setup()
      end
    }
  }
  use 'APZelos/blamer.nvim'
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = {
      function()
        require('null-ls').setup({
          sources = {
            require("null-ls").builtins.formatting.stylua,
            require("null-ls").builtins.diagnostics.eslint,
            require("null-ls").builtins.completion.spell,
          }
        })
      end
    }
  }
end)
