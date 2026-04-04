require("core.mappings")
require("config.lazy")
require("config.lsp")


vim.opt.number = true         -- shows line numbers
vim.opt.relativenumber = true -- shows relative line numbers

-- Diagnostics
vim.diagnostic.config({
	virtual_text = true,
})


-- This is for LSP


print("I use vim btw")
