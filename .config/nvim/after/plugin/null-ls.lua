local null_ls_present, null_ls = pcall(require, "null-ls")
if not null_ls_present then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier,
		formatting.gofmt,
		formatting.stylua,
		formatting.black,

		diagnostics.eslint,
		diagnostics.flake8,

		code_actions.eslint,
		code_actions.gitsigns,

		require("typescript.extensions.null-ls.code-actions"),
	},
	-- Autoformat on save
	--[[ on_attach = function(client, bufnr) ]]
	--[[ 	local augroup = vim.api.nvim_create_augroup("LspFormatting", {}) ]]
	--[[]]
	--[[ 	if client.server_capabilities.documentFormattingProvider then ]]
	--[[ 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr }) ]]
	--[[ 		vim.api.nvim_create_autocmd("BufWritePre", { ]]
	--[[ 			group = augroup, ]]
	--[[ 			buffer = bufnr, ]]
	--[[ 			callback = function() ]]
	--[[ 				vim.lsp.buf.format() ]]
	--[[ 			end, ]]
	--[[ 		}) ]]
	--[[ 	end ]]
	--[[ end, ]]
})
