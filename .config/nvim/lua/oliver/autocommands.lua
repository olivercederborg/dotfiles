local autogroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
local yankGrp = autogroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
	group = yankGrp,
})
