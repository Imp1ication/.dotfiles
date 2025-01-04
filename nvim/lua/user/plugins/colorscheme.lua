local colorescheme = "cyberdream"

return {
	-- Main
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "moon", -- "storm", "moon", "night", "day"
				transparent = false,
			})
			vim.cmd.colorscheme(colorescheme)
		end,
	},

	-- Others
	{
		"VDuchauffour/neodark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("neodark").setup({
				theme_style = "neodark",
			})
			vim.cmd.colorscheme(colorescheme)
		end,
	},
	{
		"sainnhe/sonokai",
		lazy = false,
		priority = 1000,
		config = function()
			-- default, atlantis, anfromeda, shusia, maia, expresso
			vim.g.sonokai_style = "shusia"
			vim.cmd.colorscheme(colorescheme)
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme(colorescheme)
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				background = {
					dark = "wave", -- "none", "light", "dark"
				},
				transparent = true,
			})
			vim.cmd.colorscheme(colorescheme)
		end,
	},
	{
		"oxfist/night-owl.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("night-owl").setup({
				transparent_background = false,
			})
			vim.cmd.colorscheme(colorescheme)
		end,
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				transparent = true,
                borderless_telescope = false,
			})
			vim.cmd.colorscheme(colorescheme)
		end,
	},
}
