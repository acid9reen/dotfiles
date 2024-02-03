return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
                    "python",
                    "lua",
                },
				sync_install = false,
				highlight = { enable = true },
				indent = { disable = { "python" } },
			})
		end
	},
}
