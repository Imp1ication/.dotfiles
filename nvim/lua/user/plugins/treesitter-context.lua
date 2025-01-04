return {
	"nvim-treesitter/nvim-treesitter-context",
    enabled = true,
	config = function()
		-- Keymaps --
		vim.keymap.set("n", "<leader>tc", function()
			require("treesitter-context").go_to_context(vim.v.count1)
		end, { noremap = true, silent = true })

		-- Config --
		require("treesitter-context").setup({
			enable = true,
			max_lines = 2,
			line_numbers = true,
			mode = "cursor", -- "cursor", "topline"
		})
	end,
}
