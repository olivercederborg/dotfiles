local present, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not present then
  return
end

local lspconfig = require 'lspconfig'

local servers = { 'html', 'cssls', 'emmet_ls', 'tsserver', 'jsonls', 'sumneko_lua', 'gopls', 'tailwindcss', 'pyright' }

lsp_installer.setup {
  ensure_installed = servers,
}

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("oliver.lsp.handlers").on_attach,
    capabilities = require("oliver.lsp.handlers").capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "oliver.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
  end
  lspconfig[server].setup(opts)
end
