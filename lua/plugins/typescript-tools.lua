local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
	}
	vim.lsp.buf.execute_command(params)
end

return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		require("typescript-tools").setup({
			on_attach = function() end,
			handlers = {},
			settings = {
				separate_diagnostic_server = true,
				publish_diagnostic_on = "insert_leave",
				expose_as_code_action = {
					OrganizeImports = {
						organize_imports,
						description = "Organize Imports",
					},
				},
				tsserver_path = nil,
				tsserver_plugins = {},
				tsserver_max_memory = "auto",
				tsserver_format_options = {
					allowIncompleteCompletions = true,
					allowRenameOfImportPath = true,
				},
				tsserver_file_preferences = {
					includeInlayParameterNameHints = "all",
					includeCompletionsForModuleExports = true,
					quotePreference = "auto",
				},
				tsserver_locale = "en",
				complete_function_calls = true,
				include_completions_with_insert_text = true,
				disable_member_code_lens = true,
				jsx_close_tag = {
					enable = true,
					filetypes = { "javascriptreact", "typescriptreact", "javascript", "typescript" },
				},
			},
		})

		local map = vim.keymap.set
		map("n", "<leader>rui", "<cmd>TSToolsRemoveUnusedImports<CR>", { desc = 'Remove unused Imports' })
		map("n", "<leader>ru", "<cmd>TSToolsRemoveUnused<CR>", { desc = 'Remove unused declarations' })
		map("n", "<leader>fxe", "<cmd>TSToolsFixAll<CR>", { desc = 'Fix Errors' })
		map("n", "<leader>ami", "<cmd>TSToolsAddMissingImports<CR>", { desc = 'Add Missing Imports' })
	end,
}
