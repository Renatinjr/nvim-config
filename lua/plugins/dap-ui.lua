local map = vim.keymap.set
return {
	"rcarriga/nvim-dap-ui",
	event = "VeryLazy",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		require("dapui").setup()
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
		map("n", "<leader>ba", "<cmd> DapToggleBreakpoint <CR>", { noremap = true, silent = true })
		map("n", "<leader>br", "<cmd> DapContinue <CR>", { noremap = true, silent = true })
		map("n", "<Leader>dx", ":DapTerminate<CR>")
		map("n", "<Leader>do", ":DapStepOver<CR>")
	end,
}
