return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-python",
        "nvim-neotest/neotest-go",
        "nvim-neotest/nvim-nio",
    },
    config = function ()
        local neotest = require("neotest")
        neotest.setup({
                adapters = {
                    require("neotest-python"),
                    require("neotest-go")
                }
            })

        vim.keymap.set(
            "n",
            "<leader>tt",
            function ()
                neotest.output.open({ enter = true, last_run = true })
            end
            )

        vim.keymap.set("n", "<leader>tf", function () neotest.run.run() end, {desc = "Test Function"})
        vim.keymap.set("n", "<leader>tm", function () neotest.run.run(vim.fn.expand("%")) end, {desc = "Test Module"})
        vim.keymap.set("n", "<leader>ts", function () neotest.run.stop() end, {desc = "Stop test"})
        vim.keymap.set("n", "<leader>td", function () neotest.run.run({strategy="dap"}) end, {desc = "Debug test"})
    end
}
