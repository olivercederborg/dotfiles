local present, configs = pcall(require, "nvim-treesitter.configs")
if not present then
	return
end

configs.setup {
	ensure_installed = { "html", "css", "javascript", "typescript", "python", "json", "lua", "jsdoc" },
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- List of parsers to ignore installing

	autopairs = {
		enable = true,
	},

	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},

	indent = { enable = true, disable = { "yaml" } },

	-- Context commentstring
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
		config = {
			-- Languages that have a single comment style
			typescript = { __default = "// %s", __multiline = "/* %s */" },
			css = "/* %s */",
			scss = { __default = "// %s", __multiline = "/* %s */" },
			php = { __default = "// %s", __multiline = "/* %s */" },
			html = "<!-- %s -->",
			svelte = "<!-- %s -->",
			vue = "<!-- %s -->",
			handlebars = "{{! %s }}",
			glimmer = "{{! %s }}",
			graphql = "# %s",
			lua = { __default = "-- %s", __multiline = "--[[ %s ]]" },
			vim = '" %s',

			-- Languages that can have multiple types of comments
			tsx = {
				__default = "// %s",
				__multiline = "/* %s */",
				jsx_element = "{/* %s */}",
				jsx_fragment = "{/* %s */}",
				jsx_attribute = { __default = "// %s", __multiline = "/* %s */" },
				comment = { __default = "// %s", __multiline = "/* %s */" },
				call_expression = { __default = "// %s", __multiline = "/* %s */" },
				statement_block = { __default = "// %s", __multiline = "/* %s */" },
				spread_element = { __default = "// %s", __multiline = "/* %s */" },
			},
			javascript = {
				__default = "// %s",
				__multiline = "/* %s */",
				jsx_element = "{/* %s */}",
				jsx_fragment = "{/* %s */}",
				jsx_attribute = { __default = "// %s", __multiline = "/* %s */" },
				comment = { __default = "// %s", __multiline = "/* %s */" },
				call_expression = { __default = "// %s", __multiline = "/* %s */" },
				statement_block = { __default = "// %s", __multiline = "/* %s */" },
				spread_element = { __default = "// %s", __multiline = "/* %s */" },
			},
		},
	},

	autotag = {
		enable = true,
	},

  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@call.outer",
        ["ic"] = "@call.inner",
        ["aC"] = "@class.outer",
        ["iC"] = "@class.inner",
        ["aa"] = "@parameter.outer", -- thinking of it as an argument
      },
    },

    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },

  },
}
