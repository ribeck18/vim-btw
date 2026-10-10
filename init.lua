require('lsp')
require('plugins')
require('keymaps')
require('config')



vim.filetype.add({
  extension = { gohtml = "gohtmltmpl" },
})

vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.config("html", {
  filetypes = { "html", "gohtmltmpl" },
  get_language_id = function(_, filetype)
    return filetype == "gohtmltmpl" and "html" or filetype
  end,
})

vim.lsp.config("gopls", {
  filetypes = { "go", "gomod", "gowork", "gotmpl", "gohtmltmpl" },
  get_language_id = function(_, filetype)
    return filetype == "gohtmltmpl" and "gotmpl" or filetype
  end,
  settings = {
    gopls = {
      templateExtensions = { "gohtml" },
    },
  },
})

vim.treesitter.language.register("html", "gohtmltmpl")

