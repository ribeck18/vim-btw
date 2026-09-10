vim.pack.add{
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' }
}

require('nvim-treesitter').install({
	'lua',
	'go',
	'gomod',
	'gosum',
	'python',
	'html',
	'css',
	'javascript',
	'typescript',
	'c',
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 
	'lua',
	'go',
	'gomod',
	'gosum',
	'python',
	'html',
	'css',
	'javascript',
	'typescript',
	'c',
  },
  callback = function() vim.treesitter.start() end,
})
