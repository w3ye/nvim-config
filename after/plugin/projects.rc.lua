local ok, project = pcall(require, "project_nvim")
if not ok then
	return
end

project.setup({
	-- the option to manually do so using `:ProjectRoot` command.
	manual_mode = false,
	patterns = { ".git" },
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
})
