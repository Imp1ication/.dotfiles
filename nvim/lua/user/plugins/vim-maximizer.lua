return {
	"szw/vim-maximizer",
	config = function()
		-- Keymap --
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<C-w>m", ":MaximizerToggle<CR>", opts)
	end,
}
