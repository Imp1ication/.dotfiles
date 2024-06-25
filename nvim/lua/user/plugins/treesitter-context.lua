return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		-- Keymaps --
		vim.keymap.set("n", "<C-[>", function()
			require("treesitter-context").go_to_context(vim.v.count1)
		end, { noremap = true, silent = true })

		-- Config --
		require("treesitter-context").setup({
			enable = true,
			max_lines = 3,
			line_numbers = true,
			mode = "cursor", -- "cursor", "topline"
		})
	end,
}
