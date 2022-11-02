local poimandres_present, poimandres = pcall(require, "poimandres")
if not poimandres_present then
	vim.notify("poimandres not found!")
	return
end

poimandres.setup({
	disable_background = true,
	disable_float_background = true,
	disable_italics = false,
	bold_vert_split = false,
	dim_nc_background = true,
})

local colorscheme = "poimandres"
local present, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not present then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end