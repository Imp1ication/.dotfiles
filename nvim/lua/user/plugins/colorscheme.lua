local colorscheme = "night-owl"

return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "moon", -- "storm", "moon", "night", "day"
				transparent = true,
			})
		end,
	},

	-- Others
	{
		"sainnhe/sonokai",
		lazy = false,
		priority = 1000,
		config = function()
			-- default, atlantis, anfromeda, shusia, maia, expresso
			vim.g.sonokai_style = "shusia"
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
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
			})

			-- vim.cmd("colorscheme kanagawa")
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
			vim.cmd.colorscheme(colorscheme)
		end,
	},
}
