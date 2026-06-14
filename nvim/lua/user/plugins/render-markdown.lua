return {
	"MeanderingProgrammer/render-markdown.nvim",
	enabled = true,
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	ft = { "codecompanion", "markdown" },
	config = function()
		vim.keymap.set(
			"n",
			"<leader>mdr",
			":RenderMarkdown buf_toggle<CR>",
			{ desc = "Toggle state of this plugin for current buffer" }
		)

		require("render-markdown").setup({
			enabled = false,
			code = {
				enabled = true,
				language_icon = true,
				language_name = true,
				disable_background = true,
			},
			completions = { lsp = { enabled = true } },
		})
	end,
}
