local builtin = require('telescope.builtin')

vim.api.nvim_command([[ tmap <Esc> <c-\><c-n> ]])
vim.keymap.set('n', '<C-t>', ':FloatermToggle<CR>', {silent = true})
vim.keymap.set('n', '<C-n>', ':FloattermNew<CR>', {silent = true})
vim.keymap.set('n', '<C->>', ':FloatermNext<CR>', {silent = true})
vim.keymap.set('n', '<C-<>', ':FloatermPrev<CR>', {silent = true})
