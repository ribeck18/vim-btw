-- Enable LSP here
vim.lsp.enable({ "lua_ls" })
vim.lsp.enable({ "csharp_ls" })
vim.lsp.enable({ "basedpyright" })
vim.lsp.enable({ "ruff" })
vim.lsp.enable({ "vtsls" })
vim.lsp.enable({ "html" })
vim.lsp.enable({ "cssmoudules_ls" })
vim.lsp.enable({ "cssls"})
vim.lsp.enable({ "clangd" })
vim.lsp.enable({ "gopls" })

-- Configure the lsp
vim.diagnostic.config({
	virtual_lines = false, --show diagnostic below the line
	underline = true,

	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN]  = "",
			[vim.diagnostic.severity.INFO]  = "»",
			[vim.diagnostic.severity.HINT]  = "󰮥",
		}
	}
})

-- show the error message
vim.keymap.set("n", "<leader>i", vim.diagnostic.open_float)

vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#ff6b6b" })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#f9c74f" })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#4dabf7" })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#94d82d" })

vim.api.nvim_set_hl(0, "DiagnosticVirtualLinesError", { fg = "#ff6b6b" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualLinesWarn", { fg = "#f9c74f" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualLinesInfo", { fg = "#4dabf7" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualLinesHint", { fg = "#94d82d" })

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

--Python LSP and Linter
-- basedpyright: types, analysis, semantic highlighting
vim.lsp.config("basedpyright", {
	settings = {
		basedpyright = {
			analysis = {
				typeCheckingMode = "standard",
				diagnosticMode = "openFilesOnly",
				diagnosticSeverityOverrides = {
					reportUnusedImport = "none",
					reportUnusedVariable = "none",
				},
				inlayHints = {
					callArgumentNames = true,
				},
			},
		},
	},
})

-- ruff: linting / import cleanup / fixes
vim.lsp.config("ruff", {
	init_options = {
		settings = {
			configurationPreference = "filesystemFirst",
		},
	},
})

--ruff format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.py",
	callback = function()
		vim.lsp.buf.format()
	end,
})


--Shortcuts Keymaps\
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf, silent = true }

		-- Show documentation for symbol under cursor
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts, {desc = "Show documentation for symbol."})

		-- Go to definition
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts, {desc = "Go to the definition."})

		-- Rename symbol
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts, {desc = "Rename symbol."})

		-- Code actions / quick fixes
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts, {desc = "See quick fixes."})

		-- Show diagnostics for current line
		vim.keymap.set("n", "<leader>i", function()
			vim.diagnostic.open_float(nil, { focus = false })
		end, opts, {desc = "Show diagnostics."})

		-- Jump between diagnostics
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts, {desc = "Go to prev diagnostic."})
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts, {desc = "Go to next diagnostic."})
	end,
})


--go format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
    vim.lsp.buf.format({ async = false })
  end,
})
