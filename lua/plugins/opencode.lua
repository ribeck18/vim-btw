return {
  "nickjvandyke/opencode.nvim",
  version = "*", -- Latest stable release
  dependencies = {
    {
      -- `snacks.nvim` integration is recommended, but optional
      ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
      "folke/snacks.nvim",
      optional = true,
      opts = {
        input = {}, -- Enhances `ask()`
        picker = { -- Enhances `select()`
          actions = {
            opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
          },
          win = {
            input = {
              keys = {
                ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
              },
            },
          },
        },
      },
    },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any; goto definition on the type or field for details
    }
vim.keymap.set("v", "kj", "<esc>")

    vim.o.autoread = true -- Required for `opts.events.reload`

    -- Recommended/example keymaps
    vim.keymap.set({ "n", "x" }, "<leader>a", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode…" })
    vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end,                          { desc = "Execute opencode action…" })

    local function opencode_terminal_wins()
      local wins = {}
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].buftype == "terminal" then
          local name = vim.api.nvim_buf_get_name(buf)
          if name and name:find("opencode", 1, true) then
            table.insert(wins, win)
          end
        end
      end
      return wins
    end

    local function toggle_opencode_focus()
      -- If already visible, let toggle() hide it.
      if #opencode_terminal_wins() > 0 then
        require("opencode").toggle()
        return
      end

      -- Show (or start) opencode, then focus its terminal and enter terminal-mode.
      require("opencode").toggle()
      vim.schedule(function()
        local win = opencode_terminal_wins()[1]
        if win and vim.api.nvim_win_is_valid(win) then
          vim.api.nvim_set_current_win(win)
          vim.cmd("startinsert")
        end
      end)
    end

    vim.keymap.set({ "n" }, "<leader>o", toggle_opencode_focus, { desc = "Toggle opencode" })
    vim.keymap.set({ "t" }, "<C-o>", toggle_opencode_focus,      { desc = "Toggle opencode" })

    -- opencode runs in a terminal buffer; in terminal-mode, normal window commands
    -- like `<C-w>w` are sent to the terminal job. Add buffer-local mappings so you
    -- can move focus without closing it.
    vim.api.nvim_create_autocmd("TermOpen", {
      group = vim.api.nvim_create_augroup("opencode_terminal_keymaps", { clear = true }),
      callback = function(ev)
        local name = vim.api.nvim_buf_get_name(ev.buf)
        if not (name and name:find("opencode", 1, true)) then
          return
        end

        local opts = { buffer = ev.buf, silent = true }
        vim.keymap.set("t", "<C-w>w", [[<C-\><C-n><C-w>w]], opts)
        vim.keymap.set("t", "<C-w>p", [[<C-\><C-n><C-w>p]], opts)
        vim.keymap.set("t", "<C-w>h", [[<C-\><C-n><C-w>h]], opts)
        vim.keymap.set("t", "<C-w>j", [[<C-\><C-n><C-w>j]], opts)
        vim.keymap.set("t", "<C-w>k", [[<C-\><C-n><C-w>k]], opts)
        vim.keymap.set("t", "<C-w>l", [[<C-\><C-n><C-w>l]], opts)
      end,
    })

    vim.keymap.set({ "n", "x" }, "go",  function() return require("opencode").operator("@this ") end,        { desc = "Add range to opencode", expr = true })
    vim.keymap.set("n",          "goo", function() return require("opencode").operator("@this ") .. "_" end, { desc = "Add line to opencode", expr = true })

    vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "Scroll opencode up" })
    vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "Scroll opencode down" })

    -- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above — otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap)
    -- vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
    -- vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
  end,
}
