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
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function ()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")

            mason.setup()
            mason_lspconfig.setup({
                ensure_installed = { "lua_ls", "pyright", },
            })
        end
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
				indent = { enable = false },
			})
		end
	},
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
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

			vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc = 'Find files'})
			vim.keymap.set('n', '<C-p>', builtin.git_files, {desc = 'Git files'})
			vim.keymap.set('n', '<leader>ps', builtin.live_grep, {desc = 'Find in files'})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = 'Find buffer'})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = 'Find help'})
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
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, {desc = 'Undo tree'})

		end
	},
	{
		"tpope/vim-fugitive",
		config = function ()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git, {desc = 'Git'})
		end
	},
    {
        "ThePrimeagen/harpoon",
        config = function ()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>a", mark.add_file, {desc = 'Add file to Harpoon'})
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, {desc = 'Harpoon menu'})

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
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufEnter",
        opts = {
            signs = {
                add = { text = "A" },
                change = { text = "C" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "|" },
                untracked = { text = "|" },
            },
            on_attach = function(buffer)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
                end

                -- stylua: ignore start
                map("n", "]h", gs.next_hunk, "Next Hunk")
                map("n", "[h", gs.prev_hunk, "Prev Hunk")
                map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
                map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
                map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
                map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
                map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
                map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
                map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
                map("n", "<leader>ghd", gs.diffthis, "Diff This")
                map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
            end,
        }
    },
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("refactoring").setup()
        end,
    },
    {
        'stevearc/dressing.nvim',
        opts = {},
    },
}
