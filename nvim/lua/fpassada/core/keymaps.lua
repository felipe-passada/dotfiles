-- map helper function
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '

-- Window navigation
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')

-- Window resizing
map('n', '<C-S-up>', ':resize -3<CR>', opts)
map('n', '<C-S-down>', ':resize +3<CR>', opts)
map('n', '<C-S-left>', ':vertical resize -3<CR>', opts)
map('n', '<C-S-right>', ':vertical resize +3<CR>', opts)

-- Navigating buffers
map('n', '<S-l>', ':bnext<CR>', opts)
map('n', '<S-h>', ':bprevious<CR>', opts)

-- Moving text
map('v', '<A-j>', ':m .+1<CR>==', opts)
map('v', '<A-k>', ':m .-2<CR>==', opts)

