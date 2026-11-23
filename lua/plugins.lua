vim.pack.add{
	{ src = 'https://github.com/EdenEast/nightfox.nvim' },
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
	{ src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', build='make' },
	{ src = 'https://github.com/nvim-telescope/telescope.nvim' },
	{ src = 'https://github.com/folke/which-key.nvim' },
	{ src = 'https://github.com/MunifTanjim/nui.nvim' },
	{ src = 'https://github.com/nvim-tree/nvim-web-devicons' },
	{ src = 'https://github.com/nvim-neo-tree/neo-tree.nvim' },
	{ src = 'https://github.com/rafamadriz/friendly-snippets' },
	{ src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.*') },
	{ src = 'https://github.com/windwp/nvim-autopairs' },
	{ src = 'https://github.com/goolord/alpha-nvim' },
	{ src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },
	{src = 'https://github.com/ThePrimeagen/Harpoon', version = "harpoon2"}
}

require('plugins.nightfox')
require('plugins.telescope')
require('plugins.neo-tree')
require('plugins.which-key')
require('plugins.treesitter')
require('plugins.blink')
require('plugins.autopairs')
require('plugins.alpha')
require('plugins.harpoon')



