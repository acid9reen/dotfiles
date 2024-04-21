return {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function ()
        local neogen = require('neogen')
        neogen.setup({
            snippet_engine = "luasnip",
            languages = {
                python = {
                    template  = {
                        annotation_convention = "numpydoc",
                    },
                }
            },
        })
    end,
}
