local map = vim.api.nvim_set_keymap

map('n', '<C-`>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
map('n', '<C-0>', ':NvimTreeFocus<CR>', {noremap = true, silent = true})
