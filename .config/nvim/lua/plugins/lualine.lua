return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function ()
			local configs = require("lualine")

			configs.setup ({
				options = { theme  = "gruvbox" },
				sections = {
					lualine_a = {'mode'},
					lualine_b = {
						-- 'branch',
						--    'diff',
						'diagnostics'
					},
					lualine_c = {'filename',},
					-- lualine_x = {"%{printf('%s',&iminsert?'ru':'en')}", 'encoding', 'fileformat', 'filetype'},
					-- lualine_y = {'progress'},
					-- lualine_z = {'location'}
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
			})
		end
	},
}
