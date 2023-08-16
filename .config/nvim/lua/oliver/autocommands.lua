local autogroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
	group = autogroup("YankHighlight", { clear = true }),
	command = "silent! lua vim.highlight.on_yank()",
})

-- Inlay hints
--[[ autocmd("LspAttach", { ]]
--[[ 	group = autogroup("UserLspConfig", {}), ]]
--[[ 	callback = function(args) ]]
--[[ 		local client = vim.lsp.get_client_by_id(args.data.client_id) ]]
--[[ 		if client.server_capabilities.inlayHintProvider then ]]
--[[ 			vim.lsp.inlay_hint(args.buf, true) ]]
--[[ 		end ]]
--[[ 		-- whatever other lsp config you want ]]
--[[ 	end, ]]
--[[ }) ]]
