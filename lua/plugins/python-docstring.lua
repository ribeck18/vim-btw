return {
  "danymat/neogen",
  config = function()
    require("neogen").setup({
      snippet_engine = "nvim",
    })
  end,
}
