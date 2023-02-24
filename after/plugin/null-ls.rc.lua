local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local cmp = null_ls.builtins.completion

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    formatting.stylua,
    formatting.prettier.with({
      extra_params = { "--single-quote", "--jsx-single-quote", "--semi" },
    }),
    formatting.gofmt,
    formatting.rustfmt,
    -- diagnostics.eslint,
    cmp.spell,
  },
  -- on_attach = function(client, bufnr)
  -- 	if client.supports_method("textDocument/formatting") then
  -- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  -- 		vim.api.nvim_create_autocmd("BufWritePre", {
  -- 			group = augroup,
  -- 			buffer = bufnr,
  -- 			callback = function()
  -- 				vim.lsp.buf.format({ bufnr = bufnr })
  -- 			end,
  -- 		})
  -- 	end
  -- end,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })

      -- format on save
      vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        group = group,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = "BufWritePost" })
        end,
        desc = "[lsp] format on save",
      })
    end

    if client.supports_method("textDocument/rangeFormatting") then
      vim.keymap.set("x", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,
})
