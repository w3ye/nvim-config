local all_off = false
On = true
if all_off == true then
	On = false
end

local M = {
	-- coding
	autopairs = On,
	comment = On,
	tabout = On,
	todo_comments = On,
	vim_surround = On,
	comment_string = On,
	visual_multi = On,
	trevJ = On,
	trouble = On,
	lspsaga = On,
	fugitive = On,
	gitsigns = On,
	noegit = On,
	diffview = On,
	lazygit = On,
	dap = false,
	-- ui
	blankline = On,
	mini = On,
	lualine = On,
	focus = On,
	dashboard = On,
	noice = On,
	notify = false,
	--editor
	lastplace = On,
	flit = On,
	leap = On,
	which_key = On,
	harpoon = On,
	bqf = On,
}

return M
