require("neodev").setup({})
local lsp_conf = require("will.lsp-config")
local lang_opt = lsp_conf.lang_options
-- local lsp = require("lsp-zero")
--
-- lsp.preset({ name = "minimal" })
local lsp = require("lsp-zero").preset({
  name = "minimal",
  set_lsp_keymaps = false,
  manage_nvim_cmp = false,
  suggest_lsp_servers = false,
})
lsp.ensure_installed({
  "tsserver",
  "eslint",
  "lua_ls",
  "gopls",
})

lsp.on_attach(function(client, bufnr)
  lsp_conf.on_attach(client, bufnr)
end)

lsp.set_preferences({
  sign_icons = {
    error = " ",
    warn = " ",
    hint = " ",
    info = " ",
  },
})

lsp.configure("gopls", lang_opt.go)

lsp.configure("lua_ls", lang_opt.lua)

-- diagnostic settings
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

lsp.setup()
