local map = vim.keymap.set

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
	}
	vim.lsp.buf.execute_command(params)
end

return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
			map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
			map("n", "wa", "<cmd>lua vim.lsp.buf.add_workspace_folder<CR>", { noremap = true, silent = true })
			map("n", "wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder<CR>", { noremap = true, silent = true })

			vim.diagnostic.config({
				signs = true,
				underline = true,
				virtual_text = false,
				virtual_lines = false,
				update_in_insert = true,
				float = {
					-- UI.
					header = "true",
					border = "rounded",
					focusable = true,
				},
			})

			vim.o.updatetime = 250
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
				callback = function()
					vim.diagnostic.open_float(nil, { focus = false })
				end,
			})

			local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

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

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				init_options = {
					preferences = {
						disableSuggestions = true,
					},
				},
				commands = {
					OrganizeImports = {
						organize_imports,
						description = "Organize Imports",
					},
				},
			})

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
				filetypes = {
					"javascriptreact",
					"vue",
					"typescriptreact",
					"astro",
					"css",
					"postcss",
					"svelte",
					"sass",
				},
				settings = {
					includeLanguages = {
						templ = "html",
					},
				},
			})

			lspconfig.templ.setup({})
			lspconfig.vuels.setup({
				capabilities = capabilities,
				settings = {
					vetur = {
						completion = {
							autoImport = true,
							useScaffoldSnippets = true,
						},
						format = {
							defaultFormatter = {
								html = "prettier",
								js = "prettier",
								ts = "prettier",
							},
						},
						validation = {
							template = true,
							script = true,
							style = true,
							templateProps = true,
							interpolation = true,
						},
						experimental = {
							templateInterpolationService = true,
						},
					},
				},
			})
		end,
	},
}
