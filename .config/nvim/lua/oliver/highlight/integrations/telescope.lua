local colors = require("poimandres.palette")

return {
	TelescopeBorder = {
		fg = colors.background1,
	},

	TelescopePromptBorder = {
		fg = colors.background1,
	},

	TelescopePromptNormal = {
		fg = colors.text,
	},

	TelescopePromptPrefix = {
		fg = colors.blueGray2,
	},

	--[[ TelescopeNormal = { bg = colors.background2 }, ]]

	TelescopePreviewTitle = {
		fg = colors.background2,
		bg = colors.teal1,
	},

	TelescopePromptTitle = {
		fg = colors.background2,
		bg = colors.blue1,
	},

	--[[ TelescopeResultsTitle = { ]]
	--[[ 	fg = colors.text, ]]
	--[[ 	bg = colors.blueGray3, ]]
	--[[ }, ]]

	TelescopeSelection = { bg = colors.background1, fg = colors.text },

	TelescopeResultsDiffAdd = {
		fg = colors.teal1,
	},

	TelescopeResultsDiffChange = {
		fg = colors.yellow,
	},

	TelescopeResultsDiffDelete = {
		fg = colors.pink3,
	},
}
