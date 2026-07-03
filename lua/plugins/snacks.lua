return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    terminal = {},
  },
  keys = {
    {
      "<leader>ft",
      function()
        Snacks.terminal()
      end,
      desc = "Floating Terminal",
    },
    {
      "<C-/>",
      function()
        Snacks.terminal()
      end,
      desc = "Floating Terminal",
      mode = { "n", "t" },
    },
  },
}
