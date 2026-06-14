return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
		{ "nvim-treesitter/nvim-treesitter-textobjects", branch = "master" },
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			modules = {},
			sync_install = false, -- 是否同步安裝 parser
			auto_install = true, -- 是否自動安裝缺少的 parser
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"ini",

				"c",
				"cpp",
				"cmake",

				"diff",
				"bash",
				"json",
				"python",
				"markdown",
				"markdown_inline",
				"gitignore",
			},

			ignore_install = {},

			highlight = {
				enable = true, -- false will disable the whole extension
				disable = {}, -- list of language that will be disabled
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

			-- nvim-autopair
			autopairs = { enable = true },

			-- nvim-ts-autotag
			autotag = { enable = true },

			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
			},
		})
	end,
}
