vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = 'Move selection down'})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = 'Move selection up'})

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = 'Find word under cursor'})

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {desc = '<Esc> to exit terminal mode'})

-- Do not replace buffer after delete and paste
vim.keymap.set("x", "<leader>P", "\"_dP")

vim.keymap.set("x", "<leader>y", "\"+y")
-- vim.keymap.set("x", "<leader>p", "\"+p")

vim.keymap.set("n", "<leader>b", "YpVr")
vim.keymap.set("i", "<C-a>", "<C-6>")

-- Disable inlay hints in insert mode
-- Enable back on leaving insert mode
vim.api.nvim_create_augroup("inlay_toggle", { clear=true })
vim.api.nvim_create_autocmd("InsertEnter", {group="inlay_toggle", callback=function() vim.lsp.inlay_hint.enable(false) end})
vim.api.nvim_create_autocmd("InsertLeave", {group="inlay_toggle", callback=function() vim.lsp.inlay_hint.enable(true) end})
