local ok, tree = pcall(require, "nvim-tree")
if not ok then
	return
end

local api = require("nvim-tree.api")
api.events.subscribe(api.events.Event.FileCreated, function(file)
	vim.cmd("edit " .. file.fname)
end)

tree.setup({
	live_filter = {
		prefix = "[FILTER]: ",
		always_show_folders = false, -- Turn into false from true by default
	},
	filters = {
		dotfiles = false,
	},
	view = {
		adaptive_size = true,
	},
	mappings = {
		list = {
			{ key = "C", action_cb = collapse_all },
		},
	},
})
