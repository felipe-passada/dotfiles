-- map helper function
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '

-- Window navigation
map('n', '<leader>j', '<C-w>j')
map('n', '<leader>k', '<C-w>k')
map('n', '<leader>h', '<C-w>h')
map('n', '<leader>l', '<C-w>l')
-- Telescope
map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { silent=true })
map('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], { silent = true })
map('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], { silent = true })
map('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], { silent = true })
-- NvimTree
map('n', '<leader>t',':NvimTreeToggle<cr>', { silent = true })
map('n', '<leader>r',':NvimTreeRefresh<cr>', { silent = true })
map('n', '<leader>f',':NvimTreeFindFile<cr>', { silent = true })

