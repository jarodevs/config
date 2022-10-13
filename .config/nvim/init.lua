vim.opt.tabstop 	= 4
vim.opt.shiftwidth 	= 4
vim.opt.rnu		= true
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require('packer').startup(function(use)
	use 'ayu-theme/ayu-vim'
	use {
			'nvim-tree/nvim-tree.lua',
			requires = {
				'nvim-tree/nvim-web-devicons', -- optional, for file icons
  		}
	}
	use 'sbdchd/neoformat'
	use {'neoclide/coc.nvim', branch = 'release'}
	use {
		'windwp/nvim-autopairs', 
		config = function() require("nvim-autopairs").setup {map_cr = false} end
	}
	use {
  		'nvim-telescope/telescope.nvim', tag = '0.1.0',
  		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'nvim-lua/plenary.nvim'
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use {
        'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
    }
end)

require('theme')
require('plugins')
require('keybindings')
