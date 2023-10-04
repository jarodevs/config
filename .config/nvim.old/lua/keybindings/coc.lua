local map = vim.api.nvim_set_keymap
local keyset = vim.keymap.set
local opts = {silent = true, noremap = true, expr = true}

map("i", "<C-TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
map("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

keyset("n", "gd", "<Plug>(coc-definition)", { silent = true})
keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true})
keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true})
keyset("n", "gr", "<Plug>(coc-references)", { silent = true})
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})
