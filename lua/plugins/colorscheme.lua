return {
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		priority = 1000,
		-- config = function()
		-- 	vim.cmd([[colorscheme tokyonight-night]])
		-- end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				color_overrides = {},
				custom_highlights = function(colors)
					return {
						NvimTreeFolderIcon = { fg = "#888c86" },
						NvimTreeFolderArrowOpen = { fg = colors.pink },
						NvimTreeFolderArrowClosed = { fg = colors.pink },
					}
				end,
				default_integrations = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
				},
			})
			vim.cmd([[colorscheme catppuccin]])
		end,

		priority = 1000,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				-- Use a sharp border with `FloatBorder` highlights
				border = "single",
				-- add the title in hover float window
				title = "hover",
			})
			require("rose-pine").setup({
				variant = "moon",
				dark_variant = "moon",
			})
			-- vim.cmd([[colorscheme rose-pine]])
		end,
		priority = 1000,
	},
}
