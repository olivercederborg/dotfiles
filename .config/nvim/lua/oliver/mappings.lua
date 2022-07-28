local function map(mode, l, r, opts)
  opts = opts or {}
  vim.keymap.set(mode, l, r, opts)
end

local opts = { noremap = true, silent = true }
--
vim.g.mapleader = ' '

-- Save only when there's changes
map('n', '<C-s>', ':up<CR>', opts)

-- Format
map('n', '<leader>fm', ':Format<CR>', opts)

-- Better window navigations
map('n', '<C-k>', '<C-w>h', opts)
map('n', '<C-n>', '<C-w>j', opts)
map('n', '<C-e>', '<C-w>k', opts)
map('n', '<C-i>', '<C-w>l', opts)
map('n', '<C-c>', '<C-w>c', opts)

-- Resize with arrows
map('n', '<C-Up>', ':resize -2<CR>', opts)
map('n', '<C-Down>', ':resize +2<CR>', opts)
map('n', '<C-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Visual --
-- Stay in indent mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Keep register after pasting
map('v', 'p', '"_dP', opts)

-- Colemak mappings
map({ 'n', 'x', 'o' }, 'j', 'e', opts)
map({ 'n', 'x', 'o' }, 'h', 'n', opts)
map({ 'n', 'x', 'o' }, 'n', 'j', opts)
map({ 'n', 'x', 'o' }, 'e', 'k', opts)
map({ 'n', 'x', 'o' }, 'i', 'l', opts)
map({ 'n', 'x', 'o' }, 'k', 'h', opts)

-- Colemak Insert
map({ 'n', 'x', 'o' }, 'l', 'i', opts)
map({ 'n', 'x', 'o' }, 'L', 'I', opts)

-- Faster navigation
map({ 'n', 'x', 'o' }, 'N', '5j', opts)
map({ 'n', 'x', 'o' }, 'E', '5k', opts)
map({ 'n', 'x', 'o' }, 'K', '^', opts)
map({ 'n', 'x', 'o' }, 'I', '$', opts)

-- Forward retrace movements
map('n', '<C-m', '<C-i>', opts)

-- Previous search result
map({ 'n', 'v', 'x', 'o' }, 'H', 'N', opts)

-- Quality of life
map({ 'n', 'v' }, ';', ':', {
  noremap = true,
})

-- Unhighlight search
map('n', '<leader>l', ':nohlsearch<CR>', opts)

-- Add word to search then replace
map('n', '<leader>j', [[<cmd>let @/='\<'.expand('<cword>').'\>'<cr>"_ciw]])

-- Add selection to search then replace
map('x', '<leader>j', [[y<cmd>let @/=substitute(escape(@", '/'), '\n', '\\n', 'g')<cr>"_cgn]])

-- Replace word under cursor
map('n', '<leader>ss', '*:%s///c<left><left>', {
  noremap = true,
})
-- Replace selection
map('x', '<leader>ss', 'y:%s/<C-r>0//c<left><left>', {
  noremap = true,
})

-- Delete whole buffer
map('n', 'dae', ':%d<CR>', opts)
-- Delete whole buffer and enter insert mode
map('n', 'cae', ':%d<CR>i', opts)
-- Yank whole buffer
map('n', 'yae', ':%y+<CR>', opts)
-- Visual select whole buffer
map('n', 'vae', 'ggVG', opts)

map('n', ',p', '"0p', opts)
map('n', ',P', '"0P', opts)

-- Duplicate line/selection up/down
map('n', '<leader>dn', 'yyp', opts)
map('n', '<leader>de', 'yyP', opts)
map('x', '<leader>dn', "y'>p", opts)
map('x', '<leader>de', 'yP', opts)

-- Comment
-- Toggle comment on line
map('n', '<leader>/', '<ESC><cmd>lua require("Comment.api").toggle_current_linewise()<CR>', opts)
-- Toggle comment on block
map('v', '<leader>/', '<ESC><cmd>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)

-- Telescope
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fh', ':Telescope help_tags<CR>', opts)

-- Buffer management
map('n', '<leader>b', ':JABSOpen<CR>', opts)
map('n', '<leader>x', ':BufOnly<CR>', opts)

-- NvimTree
map('n', '<leader>e', ':NvimTreeFocus<CR>', opts)
map('n', '<leader>n', ':NvimTreeToggle<CR>', opts)

-- Trouble
map('n', '<leader>m', ':TroubleToggle<CR>', opts)

-- Git
map('n', '<leader>gg', ':LazyGit<CR>', opts)

-- Copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap('i', '<C-g>', 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Hop
map('n', '<leader>w', ':HopWord<CR>', opts)
map('', 's', "<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>", {})
map('', 'S', "<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>", {})

-- place this in one of your configuration file(s)
vim.api.nvim_set_keymap(
  '',
  'f',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
  {}
)
vim.api.nvim_set_keymap(
  '',
  'F',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
  {}
)
vim.api.nvim_set_keymap(
  '',
  't',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
  {}
)
vim.api.nvim_set_keymap(
  '',
  'T',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>",
  {}
)
