local ok, tree = pcall(require, "nvim-tree")
if not ok then
	return
end

tree.setup({
	filters = {
		dotfiles = false,
	},
	view = {
		adaptive_size = true,
	},
})
