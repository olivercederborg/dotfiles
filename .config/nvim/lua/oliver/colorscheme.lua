local rose_present, rose_pine = pcall(require, "rose-pine")
if not rose_present then
	vim.notify("rose pine not found!")
	return
end

rose_pine.setup({
	dark_variant = "moon",
	disable_background = true,
	disable_italics = true,
})

local colorscheme = "rose-pine"
local present, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not present then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
