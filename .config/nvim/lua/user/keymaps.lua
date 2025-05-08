vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Center search" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Center search" })

vim.keymap.set(
  "n",
  "<leader>ss",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Find word under cursor" }
)

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "<Esc> to exit terminal mode" })

vim.keymap.set("x", "<leader>P", '"_dP', { desc = "Paste from clipboard" })
vim.keymap.set("x", "<leader>y", '"+y', { desc = "Copy to clipboard" })
-- vim.keymap.set("x", "<leader>p", "\"+p")

vim.keymap.set("n", "<leader>bd", ":up | %bd | e# <CR>", { desc = "Close all buffers except current one" })
vim.keymap.set("i", "<C-a>", "<C-6>", { desc = "Toggle keymap" })

vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)
  vim.cmd(":startinsert")
end, { desc = "Open small terminal" })

vim.keymap.set("n", "<A-j>", "<Cmd> cn <CR>", { desc = "Go to next item in quickfix list" })
vim.keymap.set("n", "<A-k>", "<Cmd> cp <CR>", { desc = "Go to previous item in quickfix list" })

-- Visually select pasted text
vim.keymap.set("n", "<leader>vp", "`[v`]", { desc = "Visually select pasted text" })

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
vim.keymap.set(
  "n",
  "[d",
  function() vim.diagnostic.jump({ count = -1, float = true }) end,
  { desc = "Prev diagnostic" }
)
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next diagnostic" })
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Diagnostics" })
vim.keymap.set("n", "gK", function()
  local new_config = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = "Toggle diagnostic virtual_lines" })
vim.keymap.set(
  "n",
  "gI",
  function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
  { desc = "Toggle inlay hints" }
)
