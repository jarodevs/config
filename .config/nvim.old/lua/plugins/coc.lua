vim.api.nvim_create_user_command('Format', [[:call CocActionAsync('format')]], { nargs = 0})
