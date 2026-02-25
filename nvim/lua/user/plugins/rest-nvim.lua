return {
	"rest-nvim/rest.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			table.insert(opts.ensure_installed, "http")
		end,
	},
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "json",
			callback = function()
				vim.opt_local.formatprg = "jq ."
			end,
		})
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "html",
			callback = function()
				vim.opt_local.formatprg = "tidy -q -i"
			end,
		})

		-- keymaps
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "http",
			callback = function()
				vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<CR>", { buffer = true, desc = "Rest run" })
			end,
		})
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "rest_nvim_result",
			callback = function()
				vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = true, silent = true })
			end,
		})
	end,
}
