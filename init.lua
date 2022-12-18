require("plugins")
require("startify_config")
require("will.set")
require("will.keymaps")
require("will.colour")

vim.cmd([[
set updatetime=1000
syntax enable
let g:blamer_template = '<committer> • <summary>, <committer-time>'
let g:blamer_relative_time = 1
]])

-- LSP disagnostic icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- diagnostic settings
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- same word highlighting
vim.cmd([[
hi CursorWord cterm=none gui=none guibg=#363838
let g:cursorword_disable_filetypes = ["TelescopePrompt", "neo-tree"]
]])
