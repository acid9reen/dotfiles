return {
    'stevearc/conform.nvim',
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                json = { "jq" },
                lua = { "stylua" },
                python = { "ruff_format" },
                tex = { "latexindent" },
                yaml = { "yamlfix" },
                md = { "mdformat" },
                go = { "gofmt" }
            },
        })

        vim.keymap.set({'n', 'v'}, '<leader>ff', conform.format, { desc = 'Format' })
    end
}
