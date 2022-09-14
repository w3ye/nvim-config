-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gz", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", bufopts)
  vim.keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", bufopts)
  vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", bufopts)

  vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
  vim.keymap.set("n", "<space>cA", vim.lsp.buf.code_action, bufopts)

  vim.keymap.set("n", "<C-m>", vim.lsp.buf.signature_help, bufopts)

  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)

  -- @NOTE: diagnostics hover
  --   vim.api.nvim_create_autocmd("CursorHold", {
  --     buffer = bufnr,
  --     callback = function()
  --       local opts = {
  --         focusable = false,
  --         close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
  --         border = "rounded",
  --         source = "always",
  --         prefix = " ",
  --         scope = "cursor",
  --       }
  --       vim.diagnostic.open_float(nil, opts)
  --     end,
  --   })
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig").gopls.setup({
  on_attach = function(client, bufnr)
    -- formatting_callback(client, bufnr)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
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
})

require("lspconfig").eslint.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
})

require("lspconfig").tsserver.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  capabilities = capabilities,
})

require("lspconfig").sumneko_lua.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

require("lspconfig").cssls.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
})

require("lspconfig").html.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
})

require("lspconfig").prismals.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
})
