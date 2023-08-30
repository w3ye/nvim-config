local mason = require("core.lsp.mason")
local lsp = require("core.lsp.lsp")
local cmp = require("core.lsp.cmp")
local snippet = require("core.lsp.snippet")
local copilot = require("core.lsp.copilot")

local M = {
	mason,
	lsp,
	"onsails/lspkind.nvim",
	cmp,
	snippet,
	copilot,
}

return M
