require("neo-tree").setup({
  window = {
    position = "float",
  },

  default_component_configs = {
    git_status = {
      symbols = {
        added = "+",
        modified = "~",
        deleted = "-",
        renamed = "→",
        untracked = "★",
        ignored = "!",
        unstaged = "✗",
        staged = "✓",
        conflict = "",
      },
    },
  },
})
