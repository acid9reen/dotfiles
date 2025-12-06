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
    {
      "fredrikaverpil/neotest-golang",
      version = "*", -- Optional, but recommended; track releases
      build = function()
        vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
      end,
    },
  },
  config = function()
    local neotest = require("neotest")
    local go_config = {
      runner = "gotestsum", -- Optional, but recommended
    }

    neotest.setup({
      -- See all config options with :h neotest.Config
      discovery = {
        -- Drastically improve performance in ginormous projects by
        -- only AST-parsing the currently opened buffer.
        enabled = false,
        -- Number of workers to parse files concurrently.
        -- A value of 0 automatically assigns number based on CPU.
        -- Set to 1 if experiencing lag.
        concurrent = 1,
      },
      running = {
        -- Run tests concurrently when an adapter provides multiple commands to run.
        concurrent = true,
      },
      summary = {
        -- Enable/disable animation of icons.
        animated = false,
      },
      adapters = {
        require("neotest-python"),
        require("neotest-golang")(go_config),
      },
    })
  end,
}
