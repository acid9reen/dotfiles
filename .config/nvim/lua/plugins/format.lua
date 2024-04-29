return {
    'stevearc/conform.nvim',
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                json = { "jq" },
                lua = { "stylua" },
                python = { "ruff_format" },
            },
        })

        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end
}
