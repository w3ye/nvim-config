local M = {}

M.setup = function()
    local wk = require("which-key")
    wk.register({
        t = {
            name = "Tree & test",
        },
    }, { prefix = "<leader>" })
end

return M
