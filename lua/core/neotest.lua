local M = {}

M.neotest_setup = function()
    require("neotest").setup({
        adapters = {
            require("neotest-playwright").adapter({
                options = {
                    persist_project_selection = true,
                    enable_dynamic_test_discovery = true,
                },
            }),
        },
    })
end

M.keys = {
    { "<leader>nts", '<cmd>lua require("neotest").summary.toggle()<cr>',            desc = "Toggle neotest summary" },
    { "<leader>nr",  '<cmd>lua require("neotest").run.run()',                       desc = "Run closest test" },
    { "<leader>nra", '<cmd>lua require("neotest").run.attach()',                    desc = "Attach closest test" },
    { "<leader>nrr", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', desc = "Run the whole file" },
}

return M
