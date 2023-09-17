local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
	vim.notify("Error from copilot")
end

copilot.setup({
	panel = { enabled = false },
	suggestion = {
		enabled = true,
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
		markdown = false,
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
