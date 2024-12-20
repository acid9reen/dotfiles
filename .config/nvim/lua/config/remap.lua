vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set(
  "n",
  "<leader>ss",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Find word under cursor" }
)

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "<Esc> to exit terminal mode" })

-- Do not replace buffer after delete and paste
vim.keymap.set("x", "<leader>P", '"_dP')

vim.keymap.set("x", "<leader>y", '"+y')
-- vim.keymap.set("x", "<leader>p", "\"+p")

vim.keymap.set("n", "<leader>bd", ":up | %bd | e# <CR>", { desc = "Close all buffers except current one" })
vim.keymap.set("i", "<C-a>", "<C-6>", { desc = "Change language inside neovim" })

-- Disable inlay hints in insert mode
-- Enable back on leaving insert mode
vim.api.nvim_create_augroup("inlay_toggle", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
  group = "inlay_toggle",
  callback = function() vim.lsp.inlay_hint.enable(false) end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = "inlay_toggle",
  callback = function() vim.lsp.inlay_hint.enable(true) end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)
  vim.cmd(":startinsert")
end)

vim.keymap.set("n", "<A-j>", "<Cmd> cn <CR>", { desc = "Go to next item in quickfix list" })
vim.keymap.set("n", "<A-k>", "<Cmd> cp <CR>", { desc = "Go to previous item in quickfix list" })
