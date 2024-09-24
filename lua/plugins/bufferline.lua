return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		vim.opt.termguicolors = true
		local map = vim.keymap.set
		map("n", "<leader>x", "<cmd>bd<CR>", { desc = "close buffer" })
		map("n", "b<RIGHT>", "<cmd> bnext <CR>", { noremap = true, silent = true })
		map("n", "b<LEFT>", "<cmd> bprev <CR>", { noremap = true, silent = true })

		require("bufferline").setup({
			highlights = require("min-theme").bufferline.highlights,
		})
	end,
}
