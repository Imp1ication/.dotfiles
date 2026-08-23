return {
	"carderne/pi-nvim",
	enabled = true,
	dependencies = { "akinsho/toggleterm.nvim" },
	config = function()
		require("pi-nvim").setup({
			socket_path = nil,
			set_default_keymaps = false,
		})
		local Terminal = require("toggleterm.terminal").Terminal

		local pi_term = Terminal:new({
			cmd = "pi",
			hidden = true,
			direction = "vertical",
			close_on_exit = true,
			size = math.floor(vim.o.columns * 0.45),
			on_open = function(term)
				vim.cmd("startinsert!")

				vim.keymap.set("t", "<C-\\>", function()
					_main_term_toggle()
				end, { buffer = term.bufnr, noremap = true, silent = true })
			end,
		})

		vim.keymap.set("n", "<leader>ai", function()
			pi_term:toggle()
		end, { noremap = true, silent = true, desc = "PI: Toggle terminal" })
	end,
}
