local present, telescope = pcall(require, "telescope")
if not present then
	return
end

local present_, actions = pcall(require, "telescope.actions")
if not present_ then
	return
end

vim.g.theme_switcher_loaded = true

telescope.setup {
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = "   ",
		selection_caret = "  ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "vertical",
		layout_config = {
			vertical = {
				prompt_position = "top",
				preview_height = 0.55,
				results_height = 0.8,
				width = 0.5,
				height = 0.95,
			},
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = { "node_modules" },
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display = { "truncate" },
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,

		mappings = {
			i = {
				["<C-n>"] = actions.move_selection_next,
				["<C-e>"] = actions.move_selection_previous,
			},

			n = {
				["q"] = actions.close,

				["n"] = actions.move_selection_next,
				["e"] = actions.move_selection_previous,

				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,
			},
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
		}
	},
}
