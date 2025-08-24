vim.lsp.enable("basedpyright")
vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
      },
      typeCheckingMode = "standard",
    },
  },
})

vim.lsp.enable("ruff")
vim.lsp.config("ruff", {})

vim.lsp.enable("dockerls")
vim.lsp.config("dockerls", {})

vim.lsp.enable("yamlls")
vim.lsp.config("yamlls", {})

vim.lsp.enable("taplo")
vim.lsp.config("taplo", {})

vim.lsp.enable("lua_ls")
vim.lsp.config("lua_ls", {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then return end

    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        version = "LuaJIT",
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    })
  end,
  settings = {
    Lua = {},
  },
})

vim.lsp.enable("jsonls")
vim.lsp.config("jsonls", {})

vim.lsp.enable("gitlab_ci_ls")
vim.lsp.config("gitlab_ci_ls", {})

vim.lsp.enable("gopls")
vim.lsp.config("gopls", {
  settings = {
    gopls = {
      gofumpt = true,
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = true,
        run_govulncheck = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
      hints = {
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
      directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
      semanticTokens = false,
    },
  },
})

vim.lsp.enable("htmx")
vim.lsp.config("htmx", {
  filetypes = {
    "aspnetcorerazor",
    "astro",
    "astro-markdown",
    "blade",
    "clojure",
    "django-html",
    "htmldjango",
    "edge",
    "eelixir",
    "elixir",
    "ejs",
    "erb",
    "eruby",
    "gohtml",
    "gotmpl",
    "gohtmltmpl",
    "haml",
    "handlebars",
    "hbs",
    "html",
    "htmlangular",
    "html-eex",
    "heex",
    "jade",
    "leaf",
    "liquid",
    "markdown",
    "mdx",
    "mustache",
    "njk",
    "nunjucks",
    "php",
    "razor",
    "slim",
    "twig",
    "javascript",
    "javascriptreact",
    "reason",
    "rescript",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
    "templ",
  },
})

vim.lsp.enable("emmet_language_server")
vim.lsp.config("emmet_language_server", {
  filetypes = {
    "css",
    "eruby",
    "gotmpl",
    "html",
    "htmldjango",
    "javascript",
    "javascriptreact",
    "jinja",
    "less",
    "pug",
    "sass",
    "scss",
    "typescriptreact",
  },
})
