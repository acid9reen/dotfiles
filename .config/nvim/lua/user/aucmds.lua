vim.api.nvim_create_autocmd("FileType", {
  desc = "Enable spellcheck on text files",
  pattern = { "html", "markdown", "text", "tex", "rst", "gitcommit" },
  callback = function() vim.opt_local.spell = true end,
})

vim.api.nvim_create_augroup("inlay_toggle", { clear = true })
local inlay_hint_was_enabled = true
vim.api.nvim_create_autocmd("InsertEnter", {
  desc = "Disable inlay hints in insert mode",
  group = "inlay_toggle",
  callback = function()
    inlay_hint_was_enabled = vim.lsp.inlay_hint.is_enabled()
    vim.lsp.inlay_hint.enable(false)
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  desc = "Restore inlay hints mode on leaving insert mode",
  group = "inlay_toggle",
  callback = function()
    if inlay_hint_was_enabled then vim.lsp.inlay_hint.enable(true) end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Hide line numbers for terminal buffers",
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

-- On lsp attach
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local fzf = require("fzf-lua")

    client.server_capabilities.semanticTokensProvider = nil

    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
    end

    -- Go to
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = args.buf, desc = "Go to declaration" })
    vim.keymap.set("n", "gi", fzf.lsp_implementations, { buffer = args.buf, desc = "Go to implemetation" })
    vim.keymap.set("n", "gd", fzf.lsp_definitions, { buffer = args.buf, desc = "Go to definition" })
    vim.keymap.set("n", "grr", fzf.lsp_references, { desc = "Go to references" })
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, { buffer = args.buf, desc = "Type definition" })

    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf, desc = "Hover" })
    vim.keymap.set("n", "<leader>fs", fzf.lsp_document_symbols, { buffer = args.buf, desc = "Find symbols" })

    -- Signature help
    vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, { buffer = args.buf, desc = "Signature help" })
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { buffer = args.buf, desc = "Signature help" })

    -- Actions
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { buffer = args.buf, desc = "Rename symbol" })
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { buffer = args.buf, desc = "Code action" })

    -- Workspaces
    vim.keymap.set(
      "n",
      "<space>wa",
      vim.lsp.buf.add_workspace_folder,
      { buffer = args.buf, desc = "Add workspace folder" }
    )
    vim.keymap.set(
      "n",
      "<space>wr",
      vim.lsp.buf.remove_workspace_folder,
      { buffer = args.buf, desc = "Remove workspace folder" }
    )
    vim.keymap.set(
      "n",
      "<space>wl",
      function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
      { buffer = args.buf, desc = "List workspace folders" }
    )
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then return end
    if client.name == "ruff" then
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
    end
  end,
  desc = "LSP: Disable hover capability from Ruff",
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("EnableTreesitterHighlighting", { clear = true }),
  desc = "Try to enable tree-sitter syntax highlighting",
  pattern = "*",
  callback = function()
    pcall(function() vim.treesitter.start() end)
    -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
