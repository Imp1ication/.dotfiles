return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		-- Your DBUI configuration
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_auto_expand_results = 1
		vim.g.db_ui_winwidth = 25
	end,
	config = function()
		-- 為 dbout 檔案類型建立自動命令以禁用摺疊
		vim.cmd("autocmd FileType dbout setlocal nofoldenable")

		local colors = {
			bg = "#0D0E15",
			bg_dark = "#0A0B10",
			blue = "#41A6FF",
			yellow = "#FFD700",
			red = "#F85366",
		}

		-- 解決浮動視窗背景問題
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.bg_dark })

		-- 自訂通知顏色
		vim.api.nvim_set_hl(0, "NotificationInfo", { fg = colors.bg, bg = colors.blue })
		vim.api.nvim_set_hl(0, "NotificationWarning", { fg = colors.bg, bg = colors.yellow })
		vim.api.nvim_set_hl(1, "NotificationError", { fg = colors.bg, bg = colors.red })

		-- Setup nvim-cmp for SQL filetypes
		require("cmp").setup.filetype({ "sql", "mysql", "plsql" }, {
			sources = {
				{ name = "vim-dadbod-completion" },
				{ name = "buffer" },
			},
		})
	end,
}
