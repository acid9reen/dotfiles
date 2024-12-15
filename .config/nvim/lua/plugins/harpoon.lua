return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = true,
    config = true,
    keys = {
      { "<leader>a", function() require("harpoon"):list():add() end, mode = { "n" }, desc = "Add file to Harpoon" },
      {
        "<C-e>",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        mode = { "n" },
        desc = "Harpoon menu",
      },
      { "<C-j>", function() require("harpoon"):list():select(1) end, mode = { "n" } },
      { "<C-k>", function() require("harpoon"):list():select(2) end, mode = { "n" } },
      { "<C-l>", function() require("harpoon"):list():select(3) end, mode = { "n" } },
      { "<C-;>", function() require("harpoon"):list():select(4) end, mode = { "n" } },
    },
  },
}
