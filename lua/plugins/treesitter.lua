require('nvim-treesitter').install({
	'lua',
	'swift',
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

require('nvim-treesitter').setup()

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 
	'lua',
	'swift',
	'go',
	'gomod',
	'gosum',
	'python',
	'html',
	'css',
	'javascript',
	'typescript',
	'c',
	'gohtmltmpl',
  },
  callback = function() vim.treesitter.start() end,
})
