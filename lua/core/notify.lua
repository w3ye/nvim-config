local M = {}

M.setup = function()
    vim.opt.termguicolors = true
    require("notify").setup({
        timeout = 2000,
        animation = "fade_in_slide_out",
        render = "minimal",
        col = 10,
        opacity = 100,
        col = 1,
        max_height = function()
            return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
            return math.floor(vim.o.columns * 0.75)
        end,
    })
end
return M
