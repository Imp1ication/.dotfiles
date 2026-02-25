return {
	"christoomey/vim-tmux-navigator",
	lazy = false,
	config = function()
		local opts = { noremap = true, silent = true }
		-- 獨立設定 toggleterm 的快捷鍵
		vim.keymap.set("n", "<C-\\>", "<cmd>ToggleTerm<cr>", opts)
	end,
}
