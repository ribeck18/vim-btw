
-- Enable LSP here
vim.lsp.enable({"lua_ls"})
vim.lsp.enable({"csharp_ls"})

-- Configure the lsp
vim.diagnostic.config({
	virtual_lines = true,  --show diagnostic below the line 

	signs = {
		text ={
			[vim.diagnostic.severity.ERROR] = "",
      			[vim.diagnostic.severity.WARN]  = "",
      			[vim.diagnostic.severity.INFO]  = "»",
      			[vim.diagnostic.severity.HINT]  = "󰮥",
		}
	}
})

vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#ff6b6b" })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn",  { fg = "#f9c74f" })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo",  { fg = "#4dabf7" })
vim.api.nvim_set_hl(0, "DiagnosticSignHint",  { fg = "#94d82d" })

vim.api.nvim_set_hl(0, "DiagnosticVirtualLinesError", { fg = "#ff6b6b" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualLinesWarn",  { fg = "#f9c74f" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualLinesInfo",  { fg = "#4dabf7" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualLinesHint",  { fg = "#94d82d" })

-- ignore the vim global
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
