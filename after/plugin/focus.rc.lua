local ok, focus = pcall(require, "focus")
if not ok then
	return
end

focus.setup({
	autoresize = false,
	relativenumber = true,
	number = true,
	excluded_filetypes = { "toggleterm" },
})
