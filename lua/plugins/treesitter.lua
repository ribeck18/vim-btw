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

require('nvim-treesitter').setup()

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
	'gohtmltmpl',
  },
  callback = function() vim.treesitter.start() end,
})
