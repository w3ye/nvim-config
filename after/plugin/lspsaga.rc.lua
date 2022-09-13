local keymap = vim.keymap.set
local ok, saga = pcall(require, "lspsaga")
if not ok then
  return
end

saga.init_lsp_saga({
  border_style = "rounded",
  code_action_lightbulb = {
    enable = true,
    enable_in_insert = false,
    cache_code_action = true,
    sign = true,
    update_time = 150,
    sign_priority = 20,
    virtual_text = false,
  },
})
-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
keymap("n", "rn", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Show cursor diagnostic
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[f", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]f", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
keymap("n", "[e", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]e", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", { silent = true })
