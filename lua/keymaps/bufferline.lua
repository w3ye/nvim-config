local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<M-,>", "<Cmd>BufferLineCyclePrev<CR>", opts)
map("n", "<M-.>", "<Cmd>BufferLineCycleNext<CR>", opts)
-- Re-order to previous/next
map("n", "<M-[>", "<Cmd>BufferLineMovePrev<CR>", opts)
map("n", "<M-]>", "<Cmd>BufferLineMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<M-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
map("n", "<M-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
map("n", "<M-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
map("n", "<M-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
map("n", "<M-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
map("n", "<M-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
map("n", "<M-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
map("n", "<M-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
map("n", "<M-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)
map("n", "<M-0>", "<Cmd>BufferLineLast<CR>", opts)
-- Close buffer
map("n", "<leader>D", "<Cmd>BufferLinePickClose<CR>", opts)
-- Pin/unpin buffer
map("n", "<M-p>", "<Cmd>BufferLineTogglePin<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("n", "<C-g>", "<Cmd>BufferLinePick<CR>", opts)
-- Sort automatically by...
map("n", "<leader>bb", "<Cmd>BufferLineOrderByBufferNumber<CR>", opts)
map("n", "<leader>bd", "<Cmd>BufferLineOrderByDirectory<CR>", opts)
map("n", "<leader>bl", "<Cmd>BufferLineOrderByLanguage<CR>", opts)
map("n", "<leader>bw", "<Cmd>BufferLineOrderByWindowNumber<CR>", opts)
