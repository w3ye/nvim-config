local ok, bufferline = pcall(require, "bufferline")
if not ok then
	return
end

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
bufferline.setup({
	auto_hide = true,
	insert_at_end = true,
	highlight_visible = false,
	sidebar_filetypes = {
		undotree = { text = "undotree" },
		-- Or, specify the event which the sidebar executes when leaving:
		["neo-tree"] = { event = "BufWipeout" },
		-- Or, specify both
		Outline = { event = "BufWinLeave", text = "symbols-outline" },
	},
})
local bufferline_state = require("bufferline.api")

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "NvimTree" then
			require("bufferline.api").set_offset(31, "FileTree")
		end
	end,
})

vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = "*",
	callback = function()
		if vim.fn.expand("<afile>"):match("NvimTree") then
			require("bufferline.api").set_offset(0)
		end
	end,
})
