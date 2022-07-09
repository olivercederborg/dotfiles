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
    formatting.prettierd,
    formatting.stylua,

    diagnostics.eslint_d,

    code_actions.eslint_d,
  },
})
