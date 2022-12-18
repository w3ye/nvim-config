vim.keymap.set("n", "<C-f>", "<cmd>Telescope find_files theme=dropdown<cr>")
-- vim.keymap.set("n", "<C-F>", "<cmd>FZF<cr>")
-- vim.keymap.set("n", "<leader>r", "<cmd>Rg<cr>")
vim.keymap.set("n", "<leader>R", "<cmd>Rg!<cr>")
vim.keymap.set("n", "<leader>fa", "<cmd>Telescope live_grep_args<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<cr>")
vim.keymap.set("n", "<leader>ft", "<cmd>Telescope treesitter<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope file_browser<cr>")
vim.keymap.set("n", "<leader>fht", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>fkm", "<cmd>Telescope keymaps<cr>")
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>")
vim.keymap.set("n", "<leader>fp", "<cmd>Telescope registers<cr>")
vim.keymap.set("n", "<leader>fx", "<cmd>TodoTelescope<cr>")
vim.keymap.set("n", "<leader>xL", "<cmd>TodoLocList<cr>")
vim.keymap.set("n", "<leader>xy", "<cmd>TodoQuickFix<cr>")

vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeFindFileToggle<cr>")

-- highlight move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- cursor stay in middle with scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- search cursor stay in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "Y", "yy")
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- toggles
vim.keymap.set("n", "<F3>", "<cmd>set hlsearch!<cr>")
vim.keymap.set("n", "<F2>", "<cmd>set relativenumber!<cr>")
vim.keymap.set("n", "<F12>", "<cmd>BlamerToggle<cr>")

-- pressing tab in normal mode split buffers
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>")

-- vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })
vim.keymap.set("n", "<M-right>", "<C-w>>", { silent = true })
vim.keymap.set("n", "<M-left>", "<C-w><", { silent = true })
vim.keymap.set("n", "<M-up>", "<C-w>+", { silent = true })
vim.keymap.set("n", "<M-down>", "<C-w>-", { silent = true })

vim.keymap.set("n", "<C-H>", "<cmd>FocusSplitLeft<cr>", { silent = true })
vim.keymap.set("n", "<C-J>", "<cmd>FocusSplitDown<cr>", { silent = true })
vim.keymap.set("n", "<C-K>", "<cmd>FocusSplitUp<cr>", { silent = true })
vim.keymap.set("n", "<C-L>", "<cmd>FocusSplitRight<cr>", { silent = true })
vim.keymap.set("n", "<leader>mn", "<cmd>FocusToggle<cr>", { silent = true })
vim.keymap.set("n", "<leader>mm", "<cmd>FocusMaximise<cr>", { silent = true })
vim.keymap.set("n", "<leader>me", "<cmd>FocusEqualise<cr>", { silent = true })

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
vim.keymap.set("n", "<leader>cp", "<cmd>let @* = expand('%:p')<cr>")

vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>")

vim.keymap.set("n", "<leader>J", "<cmd>lua require('trevj').format_at_cursor()<cr>")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("i", "<C-c>", "<Esc>")
