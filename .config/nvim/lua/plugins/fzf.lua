return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    "telescope",
    -- winopts = { preview = { default = "bat" } },
  },
  lazy = false,
  keys = {
    { "<leader>pf", "<cmd>FzfLua files<cr>", mode = { "n" }, desc = "Find files" },
    { "<leader>pg", "<cmd>FzfLua git_files<cr>", mode = { "n" }, desc = "Git files" },
    { "<leader>ps", "<cmd>FzfLua live_grep_native<cr>", mode = { "n" }, desc = "Find in files" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", mode = { "n" }, desc = "Find buffer" },
    { "<leader>fh", "<cmd>FzfLua helptags<cr>", mode = { "n" }, desc = "Find help" },
  },
}
