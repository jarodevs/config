local map = vim.api.nvim_set_keymap
local keyset = vim.keymap.set

-- NVIM TREE
map('n', '<C-`>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
map('n', '<C-0>', ':NvimTreeFocus<CR>', {noremap = true, silent = true})

-- COC
-- completion
-- auto complete
local opts = {silent = true, noremap = true, expr = true}
map("i", "<C-TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
map("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
map("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})
