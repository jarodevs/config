require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'UtkarshVerma/molokai.nvim'
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
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
	use	'tpope/vim-fugitive'
	use 'mtth/scratch.vim'
	use {
	  	"folke/todo-comments.nvim",
	  	requires = "nvim-lua/plenary.nvim",
	}
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})
	use 'preservim/tagbar'
end)

require('lualine')
require('plugins.nvim-tree')
require('plugins.todo-comments')
require('telescope')
require('plugins.coc')
