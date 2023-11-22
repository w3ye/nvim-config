local M = {
    {
        "nvimdev/guard.nvim",
        lazy = false,
        dependencies = { "nvimdev/guard-collection" },
        enabled = _G.enabled.guard,
        config = function()
            local ft = require("guard.filetype")

            -- use clang-format and clang-tidy for c files
            -- ft("c"):fmt("clang-format"):lint("clang-tidy")

            -- use stylua to format lua files and no linter
            ft("lua"):fmt("stylua")

            -- use lsp to format first then use golines to format
            ft("go"):fmt("lsp") --[[ :lint("golangci") ]]

            -- multiple files register
            ft("typescript,javascript,typescriptreact"):fmt("prettier")
            ft("json"):fmt("prettier")
            -- call setup LAST
            require("guard").setup({
                -- the only options for the setup function
                fmt_on_save = true,
                -- Use lsp if no formatter was defined for this filetype
                lsp_as_default_formatter = false,
            })
        end,
    },
    {
        "stevearc/conform.nvim",
        enabled = _G.enabled.conform_formatter,
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    typescriptreact = { "prettier" },
                    go = { "gofmt" },
                    rust = { "rustfmt" },
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_fallback = true,
                },
            })
        end,
        opts = {},
    },
    {
        "MunifTanjim/prettier.nvim",
        enabled = _G.enabled.guard,
        config = function()
            local prettier = require("prettier")

            prettier.setup({
                bin = "prettier", -- or `'prettierd'` (v0.23.3+)
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
                cli_options = {
                    printwidth = 80,
                },
            })
        end,
    },
}

return M
