require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "rust_analyzer",
        "tsserver",
        "eslint",
        "lua_ls",
        "gopls",
    },
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

-- using null-ls as default for formatting
local default_null_ls = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gz", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gv", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", bufopts)
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

    if client.name == "tsserver" then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end

    default_null_ls(client, bufnr)
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local gopls = {
    on_attach = lsp_attach,
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

local lua_ls = {
    on_attach = lsp_attach,
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
local servers = { gopls, lua_ls }
local server_setup = function(name)
    if servers[name] ~= nil then
        return servers[name]
    end
    return {
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
    }
end

local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers({
    function(server_name)
        lspconfig[server_name].setup(server_setup(server_setup))
    end,
})
