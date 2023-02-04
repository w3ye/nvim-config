local ok, tree = pcall(require, "nvim-tree")
if not ok then
	return
end

local api = require("nvim-tree.api")
api.events.subscribe(api.events.Event.FileCreated, function(file)
	vim.cmd("edit " .. file.fname)
end)

local function open_nvim_tree()
	-- open the tree
	require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

local function collapse_all()
	require("nvim-tree.actions.tree-modifiers.collapse-all").fn()
end

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
		mappings = {
			list = {
				{ key = "C", action_cb = collapse_all },
			},
		},
	},
})
