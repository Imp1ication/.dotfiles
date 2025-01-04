return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "vertical" then
					return vim.o.columns * 0.4
				else
					return 20
				end
			end,
			open_mapping = [[<C-\>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float", -- "vertical", "horizontal", "tab", "float"
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved", -- "single", "double", "shadow", "curved"
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})

		function _G.set_terminal_keymaps()
			local opts = { noremap = true }
			vim.api.nvim_buf_set_keymap(0, "t", "<C-n>", [[<C-\><C-n>]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		vim.o.hidden = true

		-- setup lazygit and lazydocker
		local lzg_term = require("toggleterm.terminal").Terminal
		local lazygit = lzg_term:new({
			cmd = "lazygit",
			hidden = true,
			on_open = function(term)
				-- 在打开 lazygit 时设置 Ctrl-\ 为关闭的快捷键
				vim.api.nvim_buf_set_keymap(
					term.bufnr,
					"t",
					"<C-\\>",
					"<cmd>close<CR>",
					{ noremap = true, silent = true }
				)
			end,
		})

		local lzd_term = require("toggleterm.terminal").Terminal
		local lazydocker = lzd_term:new({
			cmd = "lazydocker",
			hidden = true,
			on_open = function(term)
				-- 在打开 lazydocker 时设置 Ctrl-\ 为关闭的快捷键
				vim.api.nvim_buf_set_keymap(
					term.bufnr,
					"t",
					"<C-\\>",
					"<cmd>close<CR>",
					{ noremap = true, silent = true }
				)
			end,
		})

		function _lazygit_toggle()
			lazygit:toggle()
		end

		function _lazydocker_toggle()
			lazydocker:toggle()
		end

		vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>ld", "<cmd>lua _lazydocker_toggle()<CR>", { noremap = true, silent = true })
	end,
}
