return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    opts = {
	    window = {
        	position = "float",
		},

		default_component_configs = {
      			git_status = {
        symbols = {
          added     = "+",
          modified  = "~",
          deleted   = "-",
          renamed   = "→",
          untracked = "★", -- replaces "?"
          ignored   = "!",
          unstaged  = "✗",
          staged    = "✓",
          conflict  = "",
        },
      },
    },
	},
    keys = {
		{"<leader>e", "<Cmd>Neotree toggle float<CR>", desc = "Toggle the file tree"},
	},
}
