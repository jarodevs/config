local map = vim.api.nvim_set_keymap

map('n', '<C-c> <C-t>', ':TagbarToggle<CR>', {noremap = true, silent = true})
