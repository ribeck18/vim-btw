
-- NOTE: There are a few keymaps in the lsp.lua make sure you don't conflict with those.

vim.g.mapleader = " " --Spacebar leader key
vim.keymap.set("n","-", vim.cmd.Ex) -- in normal mode - will open file explorer
vim.keymap.set("n", "<leader>ft", "<cmd>split | terminal<CR>", { desc = "Open terminal" })


--generate docstring
vim.keymap.set("n", "<leader>ds", function()
  require("neogen").generate()
end)
