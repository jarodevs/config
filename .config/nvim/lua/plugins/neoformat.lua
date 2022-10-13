-- allow neoformat to use local project prettier configuration
vim.cmd('let g:neoformat_try_node_exe = 1')
vim.cmd('autocmd BufWritePre *.js Neoformat')
vim.cmd('autocmd BufWritePre *.ts Neoformat')
