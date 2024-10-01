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
				flavour = "frappe", -- latte, frappe, macchiato, mocha
				background = {  -- :h background
					light = "latte",
					dark = "mocchiato",
				},
				transparent_background = true, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false,       -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false,         -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15,       -- percentage of the shade to apply to the inactive window
				},
				no_italic = false,         -- Force no italic
				no_bold = false,           -- Force no bold
				no_underline = false,      -- Force no underline
				styles = {                 -- Handles the styles of general hi groups (see `:h highlight-args`):
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
						NvimTreeFolderIcon = { fg = "#64748b" },
						NvimTreeFolderArrowOpen = { fg = colors.pink },
						NvimTreeFolderArrowClosed = { fg = "#64748b" },
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
			-- vim.cmd([[colorscheme catppuccin]])
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
				--- @usage 'auto'|'main'|'moon'|'dawn'
				variant = "auto",
				--- @usage 'main'|'moon'|'dawn'
				dark_variant = "moon",
				bold_vert_split = false,
				dim_nc_background = false,
				disable_background = false,
				disable_float_background = true,
				disable_italics = false,
				transparent = true,

				--- @usage string hex value or named color from rosepinetheme.com/palette
				groups = {
					background = "base",
					background_nc = "_experimental_nc",
					panel = "surface",
					panel_nc = "base",
					border = "highlight_med",
					comment = "muted",
					link = "iris",
					punctuation = "subtle",

					error = "love",
					hint = "iris",
					info = "foam",
					warn = "gold",

					headings = {
						h1 = "iris",
						h2 = "foam",
						h3 = "rose",
						h4 = "gold",
						h5 = "pine",
						h6 = "foam",
					},
					-- or set all headings at once
					-- headings = 'subtle'
				},
				highlight_groups = {
					NvimTreeFolderIcon = { fg = "#64748b" },
					NvimTreeFolderArrowOpen = { fg = "pink" },
					NvimTreeFolderArrowClosed = { fg = "#64748b" },
					ColorColumn = { bg = "rose" },
					CursorLine = { bg = "foam", blend = 10 },
					StatusLine = { fg = "love", bg = "love", blend = 10 },
				},
			})
			-- vim.cmd([[colorscheme rose-pine]])
		end,
		priority = 1000,
	},
	{
		"tiagovla/tokyodark.nvim",
		opts = {
			transparent_background = false, -- set background to transparent
			gamma = 1.00,                  -- adjust the brightness of the theme
			styles = {
				comments = { italic = true }, -- style for comments
				keywords = { italic = true }, -- style for keywords
				identifiers = { italic = true }, -- style for identifiers
				functions = {},              -- style for functions
				variables = {},              -- style for variables
			},
			custom_highlights = {} or function(highlights, palette)
				return {}
			end, -- extend highlights
			custom_palette = {} or function(palette)
				return {}
			end,                 -- extend palette
			terminal_colors = true, -- enable terminal colors
		},
		config = function(_, opts)
			require("tokyodark").setup(opts) -- calling setup is optional
			-- vim.cmd([[colorscheme tokyodark]])
		end,
		priority = 1000,
	},
	{
		"datsfilipe/min-theme.nvim",
		config = function()
			require("min-theme").setup({
				-- (note: if your configuration sets vim.o.background the following option will do nothing!)
				theme = "dark",  -- String: 'dark' or 'light', determines the colorscheme used
				transparent = false, -- Boolean: Sets the background to transparent
				italics = {
					comments = true, -- Boolean: Italicizes comments
					keywords = true, -- Boolean: Italicizes keywords
					functions = true, -- Boolean: Italicizes functions
					strings = true, -- Boolean: Italicizes strings
					variables = true, -- Boolean: Italicizes variables
				},
				overrides = {
					NvimTreeFolderIcon = { fg = "#64748b" },
					-- NvimTreeFolderArrowOpen = { fg = "pink" },
					NvimTreeFolderArrowClosed = { fg = "#64748b" },
				}, -- A dictionary of group names, can be a function returning a dictionary or a table.
			})
			-- vim.cmd([[colorscheme min-theme]])
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require('kanagawa').setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				priority = 1000,
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = {         -- add/modify theme and palette colors
					palette = {},
					theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				},
				overrides = function(colors) -- add/modify highlights
					return {
						NvimTreeFolderArrowClosed = { fg = "#64748b" },
						NvimTreeFolderIcon = { fg = "#64748b" },
						NvimTreeFolderArrowOpen = { fg = "#83a3aa" },
						ursorLine = { bg = colors.bg_light0 },
						BufferLineIndicatorSelected = { fg = colors.warning, bg = colors.error },
						BufferLineFill = { fg = colors.springGreen, bg = colors.springGreen },
					}
				end,
				theme = "wave", -- Load "wave" theme when 'background' option is not set
				background = { -- map the value of 'background' option to a theme
					dark = "wave", -- try "dragon" !
					light = "lotus"
				},
			})
			vim.cmd("colorscheme kanagawa")
		end
	},


}
