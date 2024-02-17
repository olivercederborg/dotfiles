local function map(mode, l, r, opts)
	opts = opts or {}
	vim.keymap.set(mode, l, r, opts)
end

local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Save only when there's changes
map("n", "<C-s>", ":up<CR>", opts)

-- Format
-- map("n", "<leader>fm", ":Format<CR>", opts)

-- Better window navigations
map("n", "<C-k>", "<C-w>h", opts)
map("n", "<C-n>", "<C-w>j", opts)
map("n", "<C-e>", "<C-w>k", opts)
map("n", "<C-i>", "<C-w>l", opts)
map("n", "<C-c>", "<C-w>c", opts)

-- Move windows
map("n", "<C-w>k", "<C-w>H", opts)
map("n", "<C-w>n", "<C-w>J", opts)
map("n", "<C-w>e", "<C-w>K", opts)
map("n", "<C-w>i", "<C-w>L", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Forward retrace movements
map("n", "<C-m>", "<C-i>", opts)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Keep register after pasting
map("v", "p", '"_dP', opts)

-- Colemak mappings
map({ "n", "x", "o" }, "j", "e", opts)
map({ "n", "x", "o" }, "h", "n", opts)
map({ "n", "x", "o" }, "n", "j", opts)
map({ "n", "x", "o" }, "e", "k", opts)
map({ "n", "x", "o" }, "i", "l", opts)
map({ "n", "x", "o" }, "k", "h", opts)

-- Colemak Insert
map({ "n", "x", "o" }, "l", "i", opts)
map({ "n", "x", "o" }, "L", "I", opts)

-- Faster navigation
map({ "n", "x", "o" }, "N", "5jzz", opts)
map({ "n", "x", "o" }, "E", "5kzz", opts)
map({ "n", "x", "o" }, "K", "^", opts)
map({ "n", "x", "o" }, "I", "$", opts)


-- Previous search result
map({ "n", "v", "x", "o" }, "H", "N", opts)

-- Quality of life
map({ "n", "v" }, ";", ":", {
	noremap = true,
})

-- Unhighlight search
map("n", "<leader>l", ":nohlsearch<CR>", opts)

-- Add word to search then replace
map("n", "<leader>j", [[<cmd>let @/='\<'.expand('<cword>').'\>'<cr>"_ciw]])

-- Add selection to search then replace
map("x", "<leader>j", [[y<cmd>let @/=substitute(escape(@", '/'), '\n', '\\n', 'g')<cr>"_cgn]])

-- Replace word under cursor
map("n", "<leader>ss", "*:%s///c<left><left>", {
	noremap = true,
})
-- Replace selection
map("x", "<leader>ss", "y:%s/<C-r>0//c<left><left>", {
	noremap = true,
})

-- Delete whole buffer
map("n", "dae", ":%d<CR>", opts)
-- Delete whole buffer and enter insert mode
map("n", "cae", ":%d<CR>i", opts)
-- Yank whole buffer
map("n", "yae", ":%y+<CR>", opts)
-- Visual select whole buffer
map("n", "vae", "ggVG", opts)

-- Paste last yanked
map("n", ",p", '"0p', opts)
map("n", ",P", '"0P', opts)

-- Duplicate line/selection up/down
map("n", "<leader>dn", "yyp", opts)
map("n", "<leader>de", "yyP", opts)
map("x", "<leader>dn", "y'>p", opts)
map("x", "<leader>de", "yP", opts)

-- Move lines
map("n", "<C-M-n>", ":MoveLine(1)<CR>", opts)
map("n", "<C-M-e>", ":MoveLine(-1)<CR>", opts)
map("v", "<C-M-n>", ":MoveBlock(1)<CR>", opts)
map("v", "<C-M-e>", ":MoveBlock(-1)<CR>", opts)
map("n", "<C-M-i>", ":MoveHChar(1)<CR>", opts)
map("n", "<C-M-k>", ":MoveHChar(-1)<CR>", opts)
map("v", "<C-M-i>", ":MoveHBlock(1)<CR>", opts)
map("v", "<C-M-k>", ":MoveHBlock(-1)<CR>", opts)

-- Comment
-- Toggle comment on line
map("n", "<leader>/", '<ESC><cmd>lua require("Comment.api").toggle.linewise.current(nil)<CR>', opts)
-- Toggle comment on block
map("v", "<leader>/", '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', opts)

-- Telescope
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- Buffer management
map("n", "<leader>x", ":BufOnly<CR>", opts)

-- NvimTree
map("n", "<leader>e", ":Neotree reveal toggle<CR>", opts)
--[[ map("n", "<leader>n", ":Neotree float reveal_file=<cfile> reveal_force_cwd<CR>", opts) ]]
-- Trouble
map("n", "<leader>m", ":TroubleToggle<CR>", opts)

-- Git
map("n", "<leader>gg", ":LazyGit<CR>", opts)

-- nvim-spider
map({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
map({ "n", "o", "x" }, "j", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
map({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
map({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })

-- Copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-g>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
