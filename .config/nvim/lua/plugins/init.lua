require('packer').startup(function(use)
	-- use 'ayu-theme/ayu-vim'
	use ({ 'projekt0n/github-nvim-theme' })
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
		config = function() require('nvim-autopairs').setup {map_cr = false} end
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
	use 'lukas-reineke/indent-blankline.nvim'
	use 'voldikss/vim-floaterm'
	use 'pantharshit00/vim-prisma'
end)

require('plugins.nvim-tree')
require('telescope').load_extension('fzf')
require('plugins.coc')
