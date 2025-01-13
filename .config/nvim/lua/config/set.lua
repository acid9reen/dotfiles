vim.g.mapleader = " "

-- vim.opt.guicursor = ""
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"

-- Some latex stuff
vim.g.tex_flavor = "latex"

vim.g.tex_indent_items = 0
vim.g.tex_indent_and = 0
vim.g.tex_indent_brace = 0
vim.g.tex_no_error = 1

-- Spellcheck
vim.opt.spelllang = { "en_us", "ru" }
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "markdown", "text", "tex", "rst", "gitcommit" },
  callback = function() vim.opt_local.spell = true end,
})

-- Switch languages on ctrl+6
vim.opt.keymap = "russian-jcukenwin"
-- Options to use by default en
vim.opt.iminsert = 0
vim.opt.imsearch = 0

vim.g.have_nerd_font = true

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

-- Populate quickfix list on go compiler errors
vim.bo.errorformat = [[
  %-G#\ %.%#
  %-G%.%#panic:\ %m
  %Ecan\'t\ load\ package:\ %m
  %A%\\%%(%[%^:]%\\+:\ %\\)%\\?%f:%l:%c:\ %m
  %A%\\%%(%[%^:]%\\+:\ %\\)%\\?%f:%l:\ %m
  %C%*\\s%m
  %-G%.%#
]]

-- Folding
vim.opt.foldcolumn = "auto:1"
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- Do not replace first line of the fold with greyed out text
vim.opt.foldtext = ""

-- Invisible characters
vim.opt.list = true
local space = "·"
vim.opt.listchars:append({
  eol = "$",
  tab = ">-",
  multispace = space,
  lead = space,
  trail = space,
  nbsp = space,
})
