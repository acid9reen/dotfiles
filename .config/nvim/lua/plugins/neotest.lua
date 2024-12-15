return {
  "nvim-neotest/neotest",
  lazy = true,
  keys = {
    {
      "<leader>tt",
      function() require("neotest").output.open({ enter = true, last_run = true }) end,
      desc = "Test results",
    },
    { "<leader>tf", function() require("neotest").run.run() end, desc = "Test function" },
    { "<leader>tm", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Test module" },
    { "<leader>ts", function() require("neotest").run.stop() end, desc = "Stop test" },
    { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug test" },
  },
  dependencies = {
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-go",
  },
  config = function()
    local neotest = require("neotest")

    neotest.setup({
      adapters = {
        require("neotest-python"),
        require("neotest-go"),
      },
    })
  end,
}
