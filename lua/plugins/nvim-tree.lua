return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		local map = vim.keymap.set
		map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "toggle nvimtree" })

		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
		})
	end,
}
