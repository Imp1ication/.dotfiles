return {
	"zbirenbaum/copilot.lua",
    enabled = false,
	event = "InsertEnter",
	dependencies = {
		"zbirenbaum/copilot-cmp",
	},
	config = function()
		require("copilot").setup({
			panel = { enabled = false },
			suggestion = {
				enabled = false,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<M-a>",
					accept_word = "<M-w>",
					accept_line = "<M-l>",
					next = "<M-j>",
					prev = "<M-k>",
					dismiss = "<M-y>",
				},
			},
			filetypes = {
				yaml = false,
				markdown = true,
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				["."] = false,
			},
			copilot_node_command = "node", -- Node.js version must be > 16.x
			server_opts_overrides = {},
		})
	end,
}
