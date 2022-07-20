-- local colors = require("oliver.highlight.colors").rose_pine()
-- " gray
-- highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
-- " blue
-- highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
-- highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
-- " light blue
-- highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
-- highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
-- highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
-- " pink
-- highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
-- highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
-- " front
-- highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
-- highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
-- highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4

return {
	CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", strikethrough = true },
	CmpItemAbbrMatch = { fg = "#569CD6", bg = "NONE", bold = true },
	CmpItemAbbrMatchFuzzy = { fg = "#569CD6", bg = "NONE", bold = true },
	-- CmpItemMenu = { fg = "#C792EA", bg = "NONE", italic = true },

	CmpItemKindField = { bg = "NONE", fg = "#B5585F" },
	CmpItemKindProperty = { bg = "NONE", fg = "#B5585F" },
	CmpItemKindEvent = { bg = "NONE", fg = "#B5585F" },

	CmpItemKindText = { bg = "NONE", fg = "#9CDCFE" },
	CmpItemKindEnum = { bg = "NONE", fg = "#9FBD73" },
	CmpItemKindKeyword = { bg = "NONE", fg = "#9FBD73" },

	CmpItemKindConstant = { bg = "NONE", fg = "#D4BB6C" },
	CmpItemKindConstructor = { bg = "NONE", fg = "#D4BB6C" },
	CmpItemKindReference = { bg = "NONE", fg = "#D4BB6C" },

	CmpItemKindFunction = { bg = "NONE", fg = "#C586C0" },
	CmpItemKindStruct = { bg = "NONE", fg = "#A377BF" },
	CmpItemKindClass = { bg = "NONE", fg = "#A377BF" },
	CmpItemKindModule = { bg = "NONE", fg = "#A377BF" },
	CmpItemKindOperator = { bg = "NONE", fg = "#A377BF" },

	CmpItemKindVariable = { bg = "NONE", fg = "#7E8294" },
	CmpItemKindFile = { bg = "NONE", fg = "#7E8294" },

	CmpItemKindUnit = { bg = "NONE", fg = "#D4A959" },
	CmpItemKindSnippet = { bg = "NONE", fg = "#D4A959" },
	CmpItemKindFolder = { bg = "NONE", fg = "#D4A959" },

	CmpItemKindMethod = { bg = "NONE", fg = "#6C8ED4" },
	CmpItemKindValue = { bg = "NONE", fg = "#6C8ED4" },
	CmpItemKindEnumMember = { bg = "NONE", fg = "#6C8ED4" },

	CmpItemKindInterface = { bg = "NONE", fg = "#58B5A8" },
	CmpItemKindColor = { bg = "NONE", fg = "#58B5A8" },
	CmpItemKindTypeParameter = { bg = "NONE", fg = "#58B5A8" },
}
