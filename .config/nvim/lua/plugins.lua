return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.o.background = "dark"
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
	"neovim/nvim-lspconfig",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {"python", "lua", "haskell"},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    {
        "L3MON4D3/LuaSnip",
        version = "2.*",
        build = "make install_jsregexp",
    },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function ()
			local builtin = require('telescope.builtin')

			vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
			vim.keymap.set('n', '<C-p>', builtin.git_files, {})
			vim.keymap.set('n', '<leader>ps', function ()
				builtin.grep_string({ search = vim.fn.input("Grep > ") }); end)
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		end
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function ()
			local configs = require("lualine")

			configs.setup ({
				options = { theme  = "gruvbox" },
			})
		end
	},
	{
		"mbbill/undotree",
		config = function ()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

		end
	},
	{
		"tpope/vim-fugitive",
		config = function ()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		end
	},
    {
        "ThePrimeagen/harpoon",
        config = function ()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>a", mark.add_file)
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

            vim.keymap.set("n", "<C-j>", function () ui.nav_file(1) end)
            vim.keymap.set("n", "<C-k>", function () ui.nav_file(2) end)
            vim.keymap.set("n", "<C-l>", function () ui.nav_file(3) end)
            vim.keymap.set("n", "<C-;>", function () ui.nav_file(4) end)
        end
    },
    {
        'numToStr/Comment.nvim',
        lazy = false,
    },
    {
        "cappyzawa/trim.nvim",
    },
}
