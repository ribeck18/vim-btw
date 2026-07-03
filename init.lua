require("core.mappings")
require("config.lazy")
require("config.lsp")


vim.opt.number = true         -- shows line numbers
vim.opt.relativenumber = true -- shows relative line numbers

--fold functions
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- Auto-reload buffers when files change on disk (e.g. OpenCode edits).
vim.opt.autoread = true
vim.opt.updatetime = 1000
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("AutoReadOnChange", { clear = true }),
  command = "checktime",
})
