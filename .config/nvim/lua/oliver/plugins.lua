local fn = vim.fn
-- https://github.com/williamboman/nvim-config/blob/main/lua/wb/plugins.lua#L161
local is_macbook = vim.trim(fn.system("hostname")) == "MacBook-Pro-tilhrende-Oliver-2.local"

--[[ local poimandres = is_macbook and "~/Develop/personal/poimandres.nvim" or "olivercederborg/poimandres.nvim" ]]
return {
	{
		"olivercederborg/poimandres.nvim",
		lazy = false,
		priority = 1000,
		--[[ dir = is_macbook and "~/Develop/personal/poimandres.nvim/", ]]
		config = function()
			require("poimandres").setup({
				disable_background = true,
				disable_float_background = true,
				disable_italics = false,
				bold_vert_split = false,
				dim_nc_background = true,
			})
		end,
		init = function()
			vim.cmd([[colorscheme poimandres]])
		end,
	},
	"nvim-lua/plenary.nvim",
	"numToStr/Comment.nvim",
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				-- show_end_of_line = true,
				show_current_context = true,
				show_current_context_start = true,
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	"fedepujol/move.nvim",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"JoosepAlviste/nvim-ts-context-commentstring",
	{ "windwp/nvim-ts-autotag", event = "InsertEnter" },
	"nvim-treesitter/nvim-treesitter-textobjects",
	"nvim-treesitter/nvim-treesitter-context",
	"nvim-treesitter/playground",
	"p00f/nvim-ts-rainbow",

	-- cmp plugins
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"hrsh7th/nvim-cmp", -- The completion plugin
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lua",
	"nvim-lua/completion-nvim",
	"onsails/lspkind.nvim",

	-- Manage buffers
	{
		"matbme/JABS.nvim",
		lazy = true,
		config = function()
			require("jabs").setup({
				position = "center", -- center, corner. Default corner
				width = 80, -- default 50
				height = 20, -- default 10
				border = "none",
			})
		end,
	},

	-- Snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			-- LSP Support
			"neovim/nvim-lspconfig", -- Required
			"williamboman/mason.nvim", -- Optional
			"williamboman/mason-lspconfig.nvim", -- Optional

			-- Autocompletion
			"hrsh7th/nvim-cmp", -- Required
			"hrsh7th/cmp-nvim-lsp", -- Required
			"hrsh7th/cmp-buffer", -- Optional
			"hrsh7th/cmp-path", -- Optional
			"saadparwaiz1/cmp_luasnip", -- Optional
			"hrsh7th/cmp-nvim-lua", -- Optional

			-- Snippets
			"L3MON4D3/LuaSnip", -- Required
			"rafamadriz/friendly-snippets", -- Optional
		},
	},
	"tamago324/nlsp-settings.nvim", -- language server settings defined in json for
	"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
	"jose-elias-alvarez/typescript.nvim",

	-- Code actions
	{
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
		lazy = true,
		config = function()
			vim.g.code_action_menu_show_details = false
			vim.g.code_action_menu_show_diff = false
			vim.g.code_action_menu_window_border = "single"
		end,
	},

	-- Dress up the normal ui
	{ "stevearc/dressing.nvim", event = "VeryLazy" },

	-- NeoTree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
	},
	--[[ { ]]
	--[[ 	"kyazdani42/nvim-tree.lua", ]]
	--[[ 	lazy = true, ]]
	--[[ 	tag = "nightly", -- optional, updated every week. (see issue #1193) ]]
	--[[ }, ]]

	-- Telescope
	{ "nvim-telescope/telescope.nvim", lazy = true },

	-- AutoPairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
	},

	-- Hop
	{
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
		config = function()
			require("hop").setup({ keys = "ntesiroahdmvkgjblpufyw" })
		end,
	},

	-- Issues and errors
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	},

	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("scrollbar").setup({})
		end,
	},

	-- Wildmenu
	{
		"gelguy/wilder.nvim",
		config = function()
			local wilder = require("wilder")
			wilder.setup({ modes = { ":", "/", "?" } })

			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer({
					highlighter = wilder.basic_highlighter(),
					left = { " ", wilder.popupmenu_devicons() },
					right = { " ", wilder.popupmenu_scrollbar() },
				})
			)
		end,
	},

	{ "numtostr/BufOnly.nvim", cmd = "BufOnly" },

	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		config = function()
			require("fidget").setup()
		end,
	},

	-- Git
	{ "lewis6991/gitsigns.nvim" },
	{ "kdheepak/lazygit.nvim" },

	-- Copilot
	{ "github/copilot.vim" },
}
