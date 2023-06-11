-- local M = {}

-- M.setup = function()
--     require("bookmarks").setup({
--         -- sign_priority = 8,  --set bookmark sign priority to cover other sign
--         save_file = vim.fn.expand("$HOME/.bookmarks"), -- bookmarks save file path
--         keywords = {
--                 ["@t"] = "☑️ ",              -- mark annotation startswith @t ,signs this icon as `Todo`
--                 ["@w"] = "⚠️ ",              -- mark annotation startswith @w ,signs this icon as `Warn`
--                 ["@f"] = "⛏ ",                 -- mark annotation startswith @f ,signs this icon as `Fix`
--                 ["@n"] = " ",                 -- mark annotation startswith @n ,signs this icon as `Note`
--         },
--     })
-- end

-- M.keys = {
--     { "mm", '<cmd>require("bookmarks").bookmark_toggle<cr>' }, -- add or remove bookmark at current line
--     { "mi", '<cmd>require("bookmarks").bookmark_ann<cr>' }, -- add or edit mark annotation at current line
--     { "mc", '<cmd>require("bookmarks").bookmark_clean<cr>' }, -- clean all marks in local buffer
--     { "mn", '<cmd>require("bookmarks").bookmark_next<cr>' }, -- jump to next mark in local buffer
--     { "mp", '<cmd>require("bookmarks").bookmark_prev<cr>' }, -- jump to previous mark in local buffer
--     { "ml", '<cmd>require("bookmarks").bookmark_list<cr>' }, -- show marked file list in quickfix window
-- }

-- return M
