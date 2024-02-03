vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = 'Open netrw'})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = 'Move selection down'})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = 'Move selection up'})

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = 'Find word under cursor'})

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {desc = '<Esc> to exit terminal mode'})

-- Do not replace buffer after delete and paste
vim.keymap.set("x", "<leader>p", "\"_dP")
