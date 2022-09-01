local function map(mode, l, r, opts)
	opts = opts or {}
	vim.keymap.set(mode, l, r, opts)
end

local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Save only when there's changes
map("n", "<C-s>", ":up<CR>", opts)

-- Format
map("n", "<leader>fm", ":Format<CR>", opts)

-- Better window navigations
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-k>", "<C-w>j", opts)
map("n", "<C-j>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-c>", "<C-w>c", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Keep register after pasting
map("v", "p", '"_dP', opts)

-- Colemak mappings
map({ "n", "x", "o" }, "j", "k", opts)
map({ "n", "x", "o" }, "k", "j", opts)

-- Faster navigation
map({ "n", "x", "o" }, "K", "5j", opts)
map({ "n", "x", "o" }, "J", "5k", opts)
map({ "n", "x", "o" }, "H", "^", opts)
map({ "n", "x", "o" }, "L", "$", opts)

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

map("n", ",p", '"0p', opts)
map("n", ",P", '"0P', opts)

-- Duplicate line/selection up/down
map("n", "<leader>dk", "yyp", opts)
map("n", "<leader>dj", "yyP", opts)
map("x", "<leader>dk", "y'>p", opts)
map("x", "<leader>dj", "yP", opts)

-- Move lines
map("n", "<C-M-k>", ":MoveLine(1)<CR>", opts)
map("n", "<C-M-j>", ":MoveLine(-1)<CR>", opts)
map("v", "<C-M-k>", ":MoveBlock(1)<CR>", opts)
map("v", "<C-M-j>", ":MoveBlock(-1)<CR>", opts)
map("n", "<C-M-l>", ":MoveHChar(1)<CR>", opts)
map("n", "<C-M-h>", ":MoveHChar(-1)<CR>", opts)
map("v", "<C-M-l>", ":MoveHBlock(1)<CR>", opts)
map("v", "<C-M-h>", ":MoveHBlock(-1)<CR>", opts)

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
map("n", "<leader>b", ":JABSOpen<CR>", opts)
map("n", "<leader>x", ":BufOnly<CR>", opts)

-- NvimTree
map("n", "<leader>e", ":NvimTreeFocus<CR>", opts)
map("n", "<leader>n", ":NvimTreeToggle<CR>", opts)

-- Trouble
map("n", "<leader>m", ":TroubleToggle<CR>", opts)

-- Git
map("n", "<leader>gg", ":LazyGit<CR>", opts)

-- Copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-g>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Hop
map("n", "<leader>w", ":HopWord<CR>", opts)
map("", "s", "<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>", {})
map("", "S", "<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>", {})

-- place this in one of your configuration file(s)
vim.api.nvim_set_keymap(
	"",
	"f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
	{}
)
vim.api.nvim_set_keymap(
	"",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
	{}
)
vim.api.nvim_set_keymap(
	"",
	"t",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
	{}
)
vim.api.nvim_set_keymap(
	"",
	"T",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>",
	{}
)
