require("plugins")
require("will.set")
require("will.keymaps")
require("will.colour")
require("impatient")

vim.cmd([[
set updatetime=1000
syntax enable
let g:blamer_template = '<committer> • <summary>, <committer-time>'
let g:blamer_relative_time = 1
]])

-- same word highlighting
vim.cmd([[
hi CursorWord cterm=none gui=none guibg=#363838
let g:cursorword_disable_filetypes = ["TelescopePrompt", "neo-tree"]
]])

-- disable cursor line
vim.cmd([[set nocul]])

vim.api.nvim_create_user_command("Dvod", "DiffviewOpen develop", {})
