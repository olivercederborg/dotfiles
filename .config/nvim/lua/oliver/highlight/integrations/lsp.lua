local colors = require("oliver.highlight.colors").rose_pine()

return {
	-- LSP References
	LspReferenceText = { fg = colors.base, bg = colors.text },
	LspReferenceRead = { fg = colors.base, bg = colors.text },
	LspReferenceWrite = { fg = colors.base, bg = colors.text },

	-- Lsp Diagnostics
	DiagnosticHint = { fg = colors.iris },
	DiagnosticError = { fg = colors.love },
	DiagnosticWarn = { fg = colors.gold },
	DiagnosticInformation = { fg = colors.foam },
	LspSignatureActiveParameter = { fg = colors.base, bg = colors.foam },

	RenamerTitle = { fg = colors.base, bg = colors.love },
	RenamerBorder = { fg = colors.love },
	NormalFloat = { fg = colors.text },
	FloatBorder = { fg = colors.hl_high },
}
