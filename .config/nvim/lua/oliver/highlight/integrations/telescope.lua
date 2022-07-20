local colors = require("oliver.highlight.colors").rose_pine()

return {
	TelescopeBorder = {
		fg = colors.surface,
		bg = colors.surface,
	},

	TelescopePromptBorder = {
		fg = colors.surface,
		bg = colors.surface,
	},

	TelescopePromptNormal = {
		fg = colors.text,
		bg = colors.overlay,
	},

	TelescopePromptPrefix = {
		fg = colors.text,
		bg = colors.surface,
	},

	TelescopeNormal = { bg = colors.surface },

	TelescopePreviewTitle = {
		fg = colors.base,
		bg = colors.foam,
	},

	TelescopePromptTitle = {
		fg = colors.base,
		bg = colors.rose,
	},

	TelescopeResultsTitle = {
		fg = colors.text,
		bg = colors.base,
	},

	TelescopeSelection = { bg = colors.hl_med, fg = colors.text },

	TelescopeResultsDiffAdd = {
		fg = colors.foam,
	},

	TelescopeResultsDiffChange = {
		fg = colors.gold,
	},

	TelescopeResultsDiffDelete = {
		fg = colors.love,
	},
}
