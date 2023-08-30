local M = {
	"nvimdev/guard.nvim",
	lazy = false,
	enabled = true,
	config = function()
		local ft = require("guard.filetype")

		-- use clang-format and clang-tidy for c files
		ft("c"):fmt("clang-format"):lint("clang-tidy")

		-- use stylua to format lua files and no linter
		ft("lua"):fmt("stylua")

		-- use lsp to format first then use golines to format
		ft("go"):fmt("lsp") --[[ :lint("golangci") ]]

		-- multiple files register
		ft("typescript,javascript,typescriptreact"):fmt("prettier")
		ft("json"):fmt("prettier")
		-- call setup LAST
		require("guard").setup({
			-- the only options for the setup function
			fmt_on_save = true,
			-- Use lsp if no formatter was defined for this filetype
			lsp_as_default_formatter = false,
		})
	end,
}

return M
