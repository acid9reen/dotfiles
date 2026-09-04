return {
  "stevearc/oil.nvim",
  config = function()
    local names_to_ignore = {
      ["__pycache__/"] = true,
      ["venv/"] = true,
      [".venv/"] = true,
      ["env/"] = true,
    }
    require("oil").setup({
      is_always_hidden = function(name, bufnr)
        if names_to_ignore[name] then return true end
        return false
      end,
      view_options = {
        is_hidden_file = function(name, bufnr)
          local is_dotfile = vim.startswith(name, ".")
          -- Hide golang test files
          local is_test = name:match("%_test.go$") ~= nil

          local is_mock = vim.startswith(name, "mock")

          return is_dotfile or is_test or is_mock
        end,
      },
      keymaps = {
        ["gd"] = {
          desc = "Toggle file detail view",
          callback = function()
            detail = not detail
            if detail then
              require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
            else
              require("oil").set_columns({ "icon" })
            end
          end,
        },
      },
    })
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
}
