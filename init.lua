require("core.mappings")
require("config.lazy")
require("config.lsp")


vim.opt.number = true         -- shows line numbers
vim.opt.relativenumber = true -- shows relative line numbers

--fold functions
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
