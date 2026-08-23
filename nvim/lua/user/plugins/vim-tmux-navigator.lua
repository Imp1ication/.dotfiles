return {
	"christoomey/vim-tmux-navigator",
	lazy = false,
	config = function()
		local opts = { noremap = true, silent = true }
		-- 獨立設定 toggleterm 的快捷鍵
		vim.api.nvim_set_keymap("n", "<C-\\>", "<Cmd>lua _main_term_toggle()<Cr>", opts)
	end,
}
