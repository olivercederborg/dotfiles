local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Reload nvim when plugins.lua is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local present, packer = pcall(require, "packer")
if not present then
	return
end

packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "single" }
		end,
	},
}

return packer.startup(function(use)
	use "wbthomason/packer.nvim" -- this is essential.

	use "nvim-lua/plenary.nvim"
	use "kyazdani42/nvim-web-devicons"
	use "lewis6991/impatient.nvim"
	use "numToStr/Comment.nvim"
	use {
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	}
	use {
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	}
	use {
		"abecodes/tabout.nvim",
		config = function()
			require("tabout").setup {
				tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
				backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
				act_as_tab = true, -- shift content if tab out is not possible
				act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
				default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
				default_shift_tab = "<C-d>", -- reverse shift default action,
				enable_backwards = true, -- well ...
				completion = true, -- if the tabkey is used in a completion pum
				tabouts = {
					{ open = "'", close = "'" },
					{ open = '"', close = '"' },
					{ open = "`", close = "`" },
					{ open = "(", close = ")" },
					{ open = "[", close = "]" },
					{ open = "{", close = "}" },
				},
				ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
				exclude = {}, -- tabout will ignore these filetypes
			}
		end,
		wants = { "nvim-treesitter" }, -- or require if not used so far
		after = { "nvim-cmp" }, -- if a completion plugin is using tabs load it before
	}

	-- -- Alpha - greeter
	-- use {
	-- 	"goolord/alpha-nvim",
	-- 	config = function()
	-- 		require("alpha").setup(require("alpha.themes.dashboard").config)
	-- 	end,
	-- }

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
	use "JoosepAlviste/nvim-ts-context-commentstring"
	use "windwp/nvim-ts-autotag"
	use "nvim-treesitter/nvim-treesitter-textobjects"
	use "nvim-treesitter/playground"

	-- cmp plugins
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "hrsh7th/cmp-cmdline" -- cmdline completions
	use "hrsh7th/nvim-cmp" -- The completion plugin

	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "hrsh7th/cmp-nvim-lua"
	use "nvim-lua/completion-nvim"
	use "onsails/lspkind.nvim"

	-- Manage buffers
	use {
		"matbme/JABS.nvim",
		config = function()
			require("jabs").setup {
				-- Options for the main window
				position = "center", -- center, corner. Default corner
				width = 80, -- default 50
				height = 20, -- default 10
				border = "none",
			}
		end,
	}

	-- Snippets
	use "L3MON4D3/LuaSnip"
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- LSP
	use {
		"williamboman/nvim-lsp-installer",
		"neovim/nvim-lspconfig",
	}
	use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
	use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
	use "jose-elias-alvarez/nvim-lsp-ts-utils"
	use "MunifTanjim/prettier.nvim"

	-- Code actions
	use {
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
		config = function()
			vim.g.code_action_menu_show_details = false
			vim.g.code_action_menu_show_diff = false
			vim.g.code_action_menu_window_border = "single"
		end,
	}

	-- Dress up the normal ui
	use { "stevearc/dressing.nvim" }

	-- NvimTree
	use {
		"kyazdani42/nvim-tree.lua",
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	}

	-- Telescope
	use "nvim-telescope/telescope.nvim"

	-- AutoPairs
	use {
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup {}
		end,
	}

	-- Lualine
	use {
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	}

	-- Hop
	use {
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup { keys = "ntesiroahdmvkgjblpufyw" }
		end,
	}
	-- use("ggandor/lightspeed.nvim")

	-- Issues and errors
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end,
	}

	use {
		"petertriho/nvim-scrollbar",
		config = function()
			require("scrollbar").setup {}
		end,
	}

	-- Notifications
	use {
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require "notify"

			require("notify").setup {
				background_colour = "#2a273f",
			}
		end,
	}

	-- Wildmenu
	use {
		"gelguy/wilder.nvim",
		config = function()
			local wilder = require "wilder"
			wilder.setup { modes = { ":", "/", "?" } }

			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer {
					highlighter = wilder.basic_highlighter(),
					left = { " ", wilder.popupmenu_devicons() },
					right = { " ", wilder.popupmenu_scrollbar() },
				}
			)
		end,
	}

	use { "numtostr/BufOnly.nvim", cmd = "BufOnly" }

	use {
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup {
				mapping = { "nn" }, -- a table with mappings to use
				timeout = 150,
				clear_empty_lines = false, -- clear line after escaping if there is only whitespace
				keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
			}
		end,
	}

	-- Git
	use {
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	}
	use "kdheepak/lazygit.nvim"

	-- Copilot
	use "github/copilot.vim"

	-- Themes
	-- use {
	-- 	"rose-pine/neovim",
	-- 	as = "rose-pine",
	-- 	tag = "v1.*",
	-- }
	use {
		"~/Develop/sideprojects/poimandres.nvim",
		as = "poimandres",
		-- commit = '09f53983bc1369fdef0c76a4365d91a7c9c51281'
	}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
