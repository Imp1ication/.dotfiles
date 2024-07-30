return {
	"zbirenbaum/copilot.lua",
	enabled = true,
	event = "InsertEnter",
	dependencies = {
		"zbirenbaum/copilot-cmp",
	},
	config = function()
		require("copilot").setup({
			panel = { enabled = false },
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<leader>ka",
					accept_word = "<leader>kw",
					accept_line = "<leader>kl",
					next = "<leader>kj",
					prev = "<leader>kk",
					dismiss = "<leader>kd",
				},
			},
			filetypes = {
                gitcommit = true,
				markdown = true,
				yaml = false,
				help = false,
				cvs = false,
				["."] = false,
				["*.ini"] = false,
				["*.config"] = false,
			},
			copilot_node_command = "node", -- Node.js version must be > 16.x
			server_opts_overrides = {},
		})
	end,
}
