local present, _ = pcall(require, "lspconfig")
if not present then
	return
end



require "oliver.lsp.configs"
require "oliver.lsp.null-ls"
require("oliver.lsp.handlers").setup()

-- require("oliver.highlight").load_highlight "lsp"
