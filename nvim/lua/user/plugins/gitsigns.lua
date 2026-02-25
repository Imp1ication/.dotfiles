return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local styles = require("user.utils.styles")

		require("gitsigns").setup({
			signs = styles.gitsigns,
			signcolumn = true,
			numhl = false,
			linehl = false,
			word_diff = false,
			sign_priority = 6,

			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},

			attach_to_untracked = true,

			current_line_blame = false,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 300,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",

			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		})

		-- Custom commands
		vim.api.nvim_create_user_command("GitDiff", "vert Gitsigns diffthis", {})
		vim.api.nvim_create_user_command("GitBlame", "Gitsigns blame_line", {})
		vim.api.nvim_create_user_command("GitHunk", "Gitsigns preview_hunk", {})

		-- Keybinds
		local opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap("n", "<leader>gsd", ":GitDiff<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>gsb", ":GitBlame<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>gsh", ":GitHunk<CR>", opts)
	end,
}
