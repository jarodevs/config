require('plugins.nvim-tree')
require('plugins.neoformat')

return require('packer').startup(function()
	use 'ayu-theme/ayu-vim' 
	use {
			'nvim-tree/nvim-tree.lua',
			requires = {
				'nvim-tree/nvim-web-devicons', -- optional, for file icons
  		}
	}
	use 'sbdchd/neoformat'
	use {'neoclide/coc.nvim', branch = 'release'}
end)

