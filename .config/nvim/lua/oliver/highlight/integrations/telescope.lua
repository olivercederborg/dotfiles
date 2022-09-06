local colors = require("poimandres.palette")

return {
	--[[ TelescopeBorder = { ]]
	--[[   fg = colors.background1, ]]
	--[[   bg = colors.background1, ]]
	--[[ }, ]]
	--[[]]
	--[[ TelescopePromptBorder = { ]]
	--[[   fg = colors.background1, ]]
	--[[   bg = colors.background1, ]]
	--[[ }, ]]
	--[[]]
	--[[ TelescopePromptNormal = { ]]
	--[[   fg = colors.text, ]]
	--[[   bg = colors.overlay, ]]
	--[[ }, ]]
	--[[]]
	--[[ TelescopePromptPrefix = { ]]
	--[[   fg = colors.text, ]]
	--[[   bg = colors.surface, ]]
	--[[ }, ]]
	--[[]]
	--[[ TelescopeNormal = { bg = colors.surface }, ]]

	TelescopePreviewTitle = {
		fg = colors.background2,
		bg = colors.teal1,
	},

	TelescopePromptTitle = {
		fg = colors.background2,
		bg = colors.blue1,
	},

	TelescopeResultsTitle = {
		fg = colors.text,
		bg = colors.blueGray3,
	},

	TelescopeSelection = { bg = colors.background1, fg = colors.text },

	--[[ TelescopeResultsDiffAdd = { ]]
	--[[   fg = colors.foam, ]]
	--[[ }, ]]
	--[[]]
	--[[ TelescopeResultsDiffChange = { ]]
	--[[   fg = colors.gold, ]]
	--[[ }, ]]
	--[[]]
	--[[ TelescopeResultsDiffDelete = { ]]
	--[[   fg = colors.love, ]]
	--[[ }, ]]
}
