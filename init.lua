require("plugins")
require("startify_config")

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true

vim.opt.nu = true

vim.opt.hidden = true
vim.opt.hlsearch = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.autochdir = true

vim.opt.scrolloff = 8
vim.opt.wrap = true
vim.opt.signcolumn = "yes"
vim.opt.fixendofline = true
vim.opt.clipboard = "unnamedplus"

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hlsearch = false
vim.opt.relativenumber = true
vim.opt.cursorline = false

-- code folding
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.api.nvim_create_autocmd("BufRead", {
	callback = function()
		vim.api.nvim_create_autocmd("BufWinEnter", {
			once = true,
			command = "normal! zx",
		})
	end,
})

-- vim.cmd([[colorscheme nightfox]])
vim.cmd([[colorscheme everblush]])
-- change line number color
vim.cmd([[
hi linenr guifg=#59666b
hi cursorlinenr guifg=#59666b
hi DiffText guibg=#253f4a
]])

vim.g.mapleader = " "
vim.cmd([[set updatetime=100]])
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
-- vim.cmd [[autocmd BufWritePre *.tsx, *.ts, *.jsx, *.js EslintFixAll]]
vim.cmd([[syntax enable]])
vim.cmd([[
let g:blamer_template = '<committer> • <summary>, <committer-time>'
let g:blamer_relative_time = 1
]])

vim.keymap.set("n", "<C-f>", "<cmd>Telescope find_files theme=dropdown<cr>")
vim.keymap.set("n", "<leader><C-f>", "<cmd>FZF<cr>")
vim.keymap.set("n", "<leader>lg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope grep_string<cr>")
vim.keymap.set("n", "<leader>ts", "<cmd>Telescope treesitter<cr>")
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>FHT", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>xf", "<cmd>TodoTelescope<cr>")
vim.keymap.set("n", "<leader>xL", "<cmd>TodoLocList<cr>")
vim.keymap.set("n", "<leader>xy", "<cmd>TodoQuickFix<cr>")

vim.keymap.set("n", "<leader>T", "<cmd>Neotree toggle filesystem reveal left<cr>")

vim.keymap.set("n", "Y", "yy")
-- toggles
vim.keymap.set("n", "<F3>", "<cmd>set hlsearch!<cr>")
vim.keymap.set("n", "<F2>", "<cmd>set relativenumber!<cr>")
vim.keymap.set("n", "<F12>", "<cmd>BlamerToggle<cr>")

-- pressing tab in normal mode split buffers
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>")

vim.keymap.set("n", "<C-h>", "<cmd>FocusSplitLeft<cr>", { silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>FocusSplitDown<cr>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>FocusSplitUp<cr>", { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>FocusSplitRight<cr>", { silent = true })
vim.keymap.set("n", "<leader>mn", "<cmd>FocusToggle<cr>", { silent = true })
vim.keymap.set("n", "<leader>mm", "<cmd>FocusMaximise<cr>", { silent = true })
vim.keymap.set("n", "<leader>me", "<cmd>FocusEqualise<cr>", { silent = true })

vim.keymap.set("n", "<C-p>", "<cmd>YankyRingHistory<cr>", { silent = true })

vim.keymap.set("n", "<C-w>C", "<cmd>qa<cr>")
vim.keymap.set("n", "<leader><C-w>", "<cmd>wq<cr>")
vim.keymap.set("n", "<leader><C-q>", "<cmd>wqa<cr>")

vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.code_action()<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")

vim.keymap.set("n", "<leader>so", "<cmd>Startify<cr>")

vim.keymap.set("n", "<leader>gp", "<cmd>G push<cr>")
vim.keymap.set("n", "<leader>gf", "<cmd>G pull<cr>")

vim.keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<cr>")
vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<cr>")
vim.keymap.set("n", "<leader>dh", "<cmd>DiffviewFileHistory %<cr>")

vim.keymap.set("n", "<leader>p", "<cmd>Telescope projects<cr>")
vim.keymap.set("n", "<leader>P", "<cmd>ProjectRoot<cr>")
vim.keymap.set("n", "<leader>cp", "<cmd>let @+ = expand('%:p')<cr>")

vim.keymap.set("n", "<leader>J", "<cmd>require('trevj').format_at_cursor()<cr>")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "<C-e>", "<Nop>")

-- LSP disagnostic icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- diagnostic settings
vim.diagnostic.config({
	virtual_text = false,
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
