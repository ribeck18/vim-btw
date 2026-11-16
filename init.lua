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
  cmd = function(dispatchers, config)
    local env = vim.tbl_extend("force", {}, config.cmd_env or {})
    local root = config.root_dir
    local target_file = root and vim.fs.joinpath(root, ".tinygo-target")
    if target_file and vim.uv.fs_stat(target_file) then
      local ok, info = pcall(function()
        local target = vim.trim(vim.fn.readfile(target_file, "", 1)[1] or "")
        assert(target:match("^[%w_-]+$"), "expected a board name or 'host'")
        local args = { "tinygo", "info", "-json" }
        if target ~= "host" then
          args[#args + 1] = "-target=" .. target
        end
        local result = vim.system(args, { cwd = root, text = true }):wait(10000)
        assert(result.code == 0, vim.trim(result.stderr or "tinygo info failed"))
        local info = vim.json.decode(result.stdout)
        assert(type(info.goroot) == "string" and type(info.build_tags) == "table", "unexpected tinygo info output")
        return info
      end)
      if ok then
        env.GOROOT = info.goroot
        env.GOOS = info.goos
        env.GOARCH = info.goarch
        env.GOARM = info.goarm
        env.GOMIPS = info.gomips
        env.GOFLAGS = "-tags=" .. table.concat(info.build_tags, ",")
      else
        vim.notify("Could not load TinyGo settings from " .. target_file .. ": " .. info, vim.log.levels.ERROR)
      end
    end
    return vim.lsp.rpc.start({ "gopls" }, dispatchers, {
      cwd = config.cmd_cwd,
      detached = config.detached,
      env = env,
    })
  end,
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

