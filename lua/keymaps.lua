--Neovim
vim.g.mapleader = " " 
vim.keymap.set("i", "kj", "<esc>", {desc = "Esc"})

--Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

--neo-tree
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle float<cr>', { desc = 'Toggle the file tree' })


--lsp specific keybinds
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local function opts(desc)
      return {
        buffer = args.buf,
        silent = true,
        desc = desc,
      }
    end

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Show documentation for symbol"))
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename symbol"))
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("See quick fixes"))

    vim.keymap.set("n", "<leader>i", function()
      vim.diagnostic.open_float(nil, { focus = false })
    end, opts("Show diagnostics"))
  end,
})
