local M = {}

M.load_highlight = function(group)
  if type(group) == 'string' then
    group = require('oliver.highlight.integrations.' .. group)
  end

  for hl, col in pairs(group) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

return M
