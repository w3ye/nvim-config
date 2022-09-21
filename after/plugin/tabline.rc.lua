local ok, bufferline = pcall(require, "bufferline")
if not ok then
	return
end

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<M-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<M-.>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "<M-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<M->>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<M-1>", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<M-2>", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<M-3>", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<M-4>", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<M-5>", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<M-6>", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<M-7>", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<M-8>", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<M-9>", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<M-0>", "<Cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer
map("n", "<M-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
map("n", "<M-w>", "<Cmd>BufferClose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("n", "<C-g>", "<Cmd>BufferPick<CR>", opts)
-- Sort automatically by...
map("n", "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
bufferline.setup({})
