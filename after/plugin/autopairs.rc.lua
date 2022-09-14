local ok, npairs = pcall(require, "nvim-autopairs")
if not ok then
	return
end

npairs.setup({
	fast_wrap = {
		map = "<C-q>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = [=[[%'%"%)%>%]%)%}%,]]=],
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "Search",
		highlight_grey = "Comment",
	},
})
