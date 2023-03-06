local lsp_conf = require("will.lsp-config")
require("neodev").setup({})

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    -- Replace these with whatever servers you want to install
    "rust_analyzer",
    "tsserver",
    "eslint",
    "lua_ls",
    "gopls",
  },
})
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local gopls = {
  on_attach = lsp_conf.on_attach,
  capabilities = lsp_capabilities,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
  init_options = {
    usePlaceholders = true,
  },
}

local lua = {
  on_attach = lsp_conf.on_attach,
  capabilities = lsp_capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThridParty = false,
      },
    },
  },
}
local custom_server = { gopls, lua }
local lspconfig_setup = function(name)
  if custom_server[name] ~= nil then
    return custom_server[name]
  end
  return {
    on_attach = lsp_conf.on_attach,
    capabilities = lsp_capabilities,
  }
end

local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers({
  function(server_name)
    lspconfig[server_name].setup(lspconfig_setup(server_name))
  end,
})
