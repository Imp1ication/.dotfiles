return {
	"iamcco/markdown-preview.nvim",
	ft = "markdown",
	config = function()
		vim.fn["mkdp#util#install"]()

		vim.keymap.set("n", "<leader>mp", "<Plug>MarkdownPreviewToggle", { noremap = true, silent = true })
	end,
}
