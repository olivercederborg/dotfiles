local present, lualine = pcall(require, "lualine")
if not present then
	return
end

lualine.setup {
	options = {
		icons_enabled = true,
		theme = "rose-pine",
		disabled_filetypes = {},
		-- section_separators = { left = '', right = '' },
		-- component_separators = { left = '', right = '' },
		section_separators = {},
		component_separators = {},
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { "filename" },
		lualine_x = { "diagnostics", "diff", "filetype" },
		lualine_y = { "location" },
		lualine_z = { "progress" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
}
