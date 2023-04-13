vim.keymap.set("n", "<leader>nl", function()
	require("noice").cmd("last")
end)
vim.keymap.set("n", "<leader>nh", function()
	require("noice").cmd("history")
end)

vim.keymap.set("c", "<leader>nc", function()
	require("noice").redirect(vim.fn.getcmdline())
end)

vim.keymap.set("n", "<leader>na", function()
	require("noice").cmd("all")
end)

-- vim.keymap.set("n", "<leader>u", function()
--   require("notify").dismiss({ silent = true, pending = true })
-- end)
