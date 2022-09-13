local prettier = require("prettier")

prettier.setup({
  bin = "prettier", -- or `'prettierd'` (v0.22+)
  cli_options = {
    config_precedence = "prefer-file",
    bracket_spacing = false,
    jsx_single_quote = true,
    sing_quote = true,
    semi = true,
  },
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})
