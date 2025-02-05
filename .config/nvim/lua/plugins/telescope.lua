return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    lazy = true,
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          file_ignore_patterns = {
            "vendor",
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })

      telescope.load_extension("fzf")
    end,
    lazy = true,
    keys = {
      { "<leader>pf", "<cmd>Telescope find_files<cr>", mode = { "n" }, desc = "Find files" },
      { "<C-p>", "<cmd>Telescope git_files<cr>", mode = { "n" }, desc = "Git files" },
      { "<leader>ps", "<cmd>Telescope live_grep<cr>", mode = { "n" }, desc = "Find in files" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", mode = { "n" }, desc = "Find buffer" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", mode = { "n" }, desc = "Find help" },
    },
  },
}
