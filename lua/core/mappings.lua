vim.g.mapleader = " " --Spacebar leader key
vim.keymap.set("n","-", vim.cmd.Ex) -- in normal mode - will open file explorer
vim.keymap.set("n", "<leader>ft", "<cmd>split | terminal<CR>", { desc = "Open terminal" })

