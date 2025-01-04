return {
	"kkoomen/vim-doge",
	config = function()
		vim.g.doge_enable_mappings = 0

		vim.g.doge_doc_standard_python = "google" -- "reST", "numpy", "google", "sphinx", "doxygen"
		vim.g.doge_python_settings = {
			single_quotes = 0,
			omit_redundant_param_types = 0,
		}

		vim.api.nvim_set_keymap("n", "<leader>dg", "<cmd>DogeGenerate<CR>", { noremap = true, silent = true })
	end,
}
