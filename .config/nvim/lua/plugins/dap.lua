return {
  {
    "miroshQa/debugmaster.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      "jbyuki/one-small-step-for-vimkind",
      "mfussenegger/nvim-dap-python",
      "leoluz/nvim-dap-go",
      "williamboman/mason.nvim",
    },
    config = function()
      local dm = require("debugmaster")
      vim.keymap.set({ "n", "v" }, "<leader>d", dm.mode.toggle, { nowait = true })
      -- If you want to disable debug mode in addition to leader+d using the Escape key:
      -- vim.keymap.set("n", "<Esc>", dm.mode.disable)
      -- This might be unwanted if you already use Esc for ":noh"
      vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

      dm.plugins.osv_integration.enabled = true -- needed if you want to debug neovim lua code
      local dap = require("dap")

      require("dap-python").setup("/home/ruslan/.venvs/debugpy/bin/python")
      require("dap-python").test_runner = "pytest"
      require("dap-go").setup({
        dap_configurations = {
          {
            type = "go",
            name = "Debug (Build Flags)",
            request = "launch",
            program = "${file}",
            buildFlags = require("dap-go").get_build_flags,
          },
        },
      })

      vim.keymap.set("n", "<space>bb", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

      vim.keymap.set("n", "<F1>", dap.continue)
      vim.keymap.set("n", "<F2>", dap.step_into)
      vim.keymap.set("n", "<F3>", dap.step_over)
      vim.keymap.set("n", "<F4>", dap.step_out)
      vim.keymap.set("n", "<F5>", dap.step_back)
      vim.keymap.set("n", "<F6>", dap.up)
      vim.keymap.set("n", "<F7>", dap.down)
      vim.keymap.set("n", "<F11>", dap.restart)
    end,
  },
}
