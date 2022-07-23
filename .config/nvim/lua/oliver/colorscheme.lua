-- local rose_present, rose_pine = pcall(require, "rose-pine")
-- if not rose_present then
-- 	vim.notify "rose pine not found!"
-- 	return
-- end
--
--
-- rose_pine.setup {
-- 	dark_variant = "moon",
-- 	disable_background = true,
-- 	disable_italics = true,
-- }

local poimandres_present, poimandres = pcall(require, "poimandres")
if not poimandres_present then
	vim.notify "poimandres not found!"
	return
end

poimandres.setup {
	disable_background = true,
	disable_float_background = true,
	disable_italics = true,
}

local colorscheme = "poimandres"
local present, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not present then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
