local filetypes = {
  hypr = {
    pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
  },
  gotmpl = {
    extension = {
      gotmpl = "gotmpl",
    },
  },
}

for _, v in pairs(filetypes) do
  vim.filetype.add(v)
end
