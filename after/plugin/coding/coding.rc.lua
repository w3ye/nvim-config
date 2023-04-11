require("nvim-autopairs").setup({
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = [=[[%'%"%)%>%]%)%}%,]]=],
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "Search",
		highlight_grey = "Comment",
	},
})

require("Comment").setup({
	ignore = "^$",
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
