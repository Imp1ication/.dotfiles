return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"p00f/nvim-ts-rainbow",
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"bash",
				"json",
				"python",
				"markdown",
				"markdown_inline",
				"yaml",
				"gitignore",

				"cpp",
				"cmake",
			},

			ignore_install = {},

			auto_install = true,

			highlight = {
				enable = true, -- false will disable the whole extension
				disable = {}, -- list of language that will be disabled
				additional_vim_regex_highlighting = false,
			},

			indent = { enable = true, disable = {} },

			incremental_selection = {
				enable = true,
				keymaps = {
					node_incremental = "<cr>",
					node_decremental = "<bs>",
					scope_incremental = "<tab>",
				},
			},
			-- nvim-ts-rainbow
			rainbow = {
				enable = true,
				disable = {},
				extended_mode = true, -- also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
				max_file_lines = nil, -- do not enable for files with more than n lines, int
				-- colors = {}, -- table of hex strings
				-- termcolors = {} -- table of colour name strings
			},

			-- nvim-autopair
			autopairs = { enable = true },

			-- nvim-ts-autotag
			autotag = { enable = true },
		})
	end,
}
