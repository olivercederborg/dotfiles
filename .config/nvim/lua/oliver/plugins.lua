local fn = vim.fn
-- https://github.com/williamboman/nvim-config/blob/main/lua/wb/plugins.lua#L161
local is_macbook = vim.trim(fn.system("hostname")) == "MacBook-Pro-tilhrende-Oliver-2.local"

return {
	{
		"olivercederborg/poimandres.nvim",
		lazy = false,
		priority = 1000,
		dir = is_macbook and "~/Develop/personal/poimandres.nvim",
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
			vim.cmd("colorscheme poimandres")
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
	-- Lua
	{
		"folke/zen-mode.nvim",
		opts = {
			window = {
				width = 150,
			},
		},
	},

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
	{
		"lvimuser/lsp-inlayhints.nvim",
		config = function()
			require("lsp-inlayhints").setup()
		end,
	},

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
	{ "stevearc/dressing.nvim", lazy = true },

	-- NeoTree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
	},

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

	-- Leap
	{
		"ggandor/leap.nvim",
		dependencies = "tpope/vim-repeat",
		config = function()
			require("leap").add_default_mappings()
			require("leap").opts.labels = { "n", "t", "e", "s", "i", "r", "o", "a", "h", "d", "m", "v" }
			require("leap").opts.safe_labels = { "n", "t", "e", "s", "i", "r", "o", "a", "h", "d", "m", "v" }
		end,
	},
	{
		"ggandor/flit.nvim",
		config = function()
			require("flit").setup({
				keys = { f = "f", F = "F", t = "t", T = "T" },
				labeled_modes = "nvo",
				multiline = false,
				opts = {
					labels = { "n", "t", "e", "s", "i", "r", "o", "a", "h", "d", "m", "v" },
					safe_labels = { "n", "t", "e", "s", "i", "r", "o", "a", "h", "d", "m", "v" },
				},
			})
		end,
	},

	{ "chrisgrieser/nvim-spider", lazy = true },

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
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.g.lazygit_floating_window_scaling_factor = 0.85 -- scaling factor for floating window
			vim.g.lazygit_floating_window_border_chars = { " ", " ", " ", " ", " ", " ", " ", " " } -- customize lazygit popup window border characters.
		end,
	},

	-- Copilot
	{ "github/copilot.vim" },
}
