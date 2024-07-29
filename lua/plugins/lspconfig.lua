return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
							disable = { "different-requires" },
						},
					},
				},
			})

			lspconfig.rust_analyzer.setup({})

			lspconfig.gopls.setup({
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				settings = {
					env = {
						GOEXPERIMENT = "rangefunc",
					},
					formatting = {
						gofumpt = true,
					},
				},
			})

			lspconfig.tailwindcss.setup({
				settings = {
					includeLanguages = {
						templ = "html",
					},
				},
			})

			lspconfig.tsserver.setup({
				capabilities = capabilities,
				filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
				settings = {
					tsserver = {
						complete = {
							autoImports = true,
							includeCompletionsForModuleExports = true,
						},
						importModuleSpecifierPreference = "relative",
					},
				},
			})

			lspconfig.templ.setup({})
		end,
	},
}
