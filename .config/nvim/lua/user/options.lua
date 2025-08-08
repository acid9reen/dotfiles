local options = {
  backup = false,
  -- colorcolumn = { "100" },
  completeopt = { "menuone", "noselect" },
  cursorline = false,
  expandtab = true,
  guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20",
  hlsearch = false,
  ignorecase = true,
  incsearch = true,
  nu = true,
  pumheight = 10,
  relativenumber = true,
  scrolloff = 8,
  shiftwidth = 4,
  signcolumn = "yes",
  smartcase = true,
  smartindent = true,
  softtabstop = 4,
  spelllang = { "en_us", "ru" },
  swapfile = false,
  tabstop = 4,
  termguicolors = true,
  undodir = os.getenv("HOME") .. "/.vim/undodir",
  undofile = true,
  updatetime = 300,
  wrap = false,
}

vim.diagnostic.config({ virtual_lines = false })
vim.opt.isfname:append("@-@")

-- Custom list invisible characters
vim.opt.listchars:append({
  eol = "$",
  tab = ">-",
  multispace = "·",
  lead = "·",
  trail = "·",
  nbsp = "·",
})

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")

-- Reset to default keymap
-- Need to be done after other configuration options due side effect of keymap setting
vim.opt.keymap = "russian-jcukenwin"
vim.opt.iminsert = 0
vim.opt.imsearch = 0
