local keymap = vim.keymap.set
local ok, saga = pcall(require, "lspsaga")
if not ok then
  return
end

saga.setup({
  ui = {
    theme = "round",
    border = "rounded",
  },
  lightbulb = {
    enable = false,
    enable_in_insert = true,
    cache_code_action = true,
    sign = true,
    update_time = 150,
    sign_priority = 20,
    virtual_text = false,
  },
  outline = {
    win_position = "right",
    --set special filetype win that outline window split.like NvimTree neotree
    -- defx, db_ui
    win_with = "",
    win_width = 30,
    show_detail = true,
    auto_enter = true,
    auto_preview = false,
    auto_refresh = true,
    virt_text = "┃",
    keys = {
      jump = "o",
      expand_collapse = "u",
      quit = "q",
    },
  },
  callhierarchy = {
    show_detail = false,
    keys = {
      edit = "e",
      vsplit = "s",
      split = "i",
      tabe = "t",
      jump = "o",
      quit = "q",
      expand_collapse = "u",
    },
  },
  diagnostic = {
    show_code_action = true,
    show_source = true,
    jump_num_shortcut = true,
    --1 is max
    max_width = 0.7,
    custom_fix = nil,
    custom_msg = nil,
    text_hl_follow = false,
    border_follow = true,
    keys = {
      exec_action = "o",
      quit = "q",
      go_action = "g",
    },
  },
  rename = {
    quit = "<C-c>",
    exec = "<CR>",
    mark = "x",
    confirm = "<CR>",
    in_select = true,
  },
  finder = {
    --percentage
    max_height = 0.5,
    keys = {
      jump_to = "p",
      edit = { "o", "<CR>" },
      vsplit = "s",
      split = "i",
      tabe = "t",
      quit = { "q", "<ESC>" },
      close_in_preview = "<ESC>",
    },
  },
  code_action = {
    num_shortcut = true,
    quit = "q",
    exec = "<CR>",
  },
  definition = {
    edit = "<C-c>o",
    vsplit = "<C-c>v",
    split = "<C-c>i",
    tabe = "<C-c>t",
    quit = "q",
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
keymap("n", "rn", "<cmd>Lspsaga rename ++project<CR>", { silent = true })

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Show cursor diagnostic
-- keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
keymap("n", "<leader>cd", "<cmd>lua vim.diagnostic.open_float()<CR>", { silent = true })
keymap("n", "<leader>cl", "<cmd>Lspsaga show_line_diagnostics<CR>")
--
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
keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>", { silent = true })
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true })

keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
