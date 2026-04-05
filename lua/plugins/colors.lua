return {
	"EdenEast/nightfox.nvim",
	priority = 1000,
	config = function()
		require('nightfox').setup({
		--paste any config options from the github right here.
		styles = {               -- Style to be applied to different syntax groups
      			comments = "italic",     -- Value is any valid attr-list value `:help attr-list`
      			conditionals = "NONE",
      			constants = "bold",
      			functions = "NONE",
      			keywords = "NONE",
      			numbers = "NONE",
      			operators = "NONE",
      			strings = "NONE",
      			types = "NONE",
      			variables = "NONE",
    			},
		})
		vim.cmd("colorscheme nordfox") -- also could use dawnfox, dayfox, nighfox, terafox, nordfox, carbonfox
	end,
}


