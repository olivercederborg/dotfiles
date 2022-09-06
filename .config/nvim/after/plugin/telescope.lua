local present, telescope = pcall(require, "telescope")
if not present then
  return
end

local present_, actions = pcall(require, "telescope.actions")
if not present_ then
  return
end

require("oliver.highlight").load_highlight("telescope")

vim.g.theme_switcher_loaded = true

telescope.setup({
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
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.5,
        results_width = 0.5,
        width = 0.7,
        height = 0.85,
      },
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules", "package-lock" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = true,
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
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
  pickers = {},
})
