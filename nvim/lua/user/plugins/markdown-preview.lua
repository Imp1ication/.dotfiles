return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown", "codecompanion" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	config = function()
		vim.keymap.set(
			"n",
			"<leader>mdp",
			":MarkdownPreviewToggle<CR>",
			{ desc = "Toggle state of this plugin for current buffer" }
		)
	end,
}
