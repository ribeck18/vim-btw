return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
	win = {
      		row = math.huge,
      		col = math.huge,
      		no_overlap = false,
      		width = { min = 20, max = 40 },
      		height = { min = 4, max = 20 },
      		border = "rounded",
    	},
    	layout = {
      		width = { min = 20, max = 20 },
      		spacing = 1,
    	},
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
