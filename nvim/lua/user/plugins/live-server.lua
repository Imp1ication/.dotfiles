return {
	"aurum77/live-server.nvim",
	run = function()
		require("live_server.util").install()
	end,
	cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
	config = function()
		require("live_server").setup({
			port = 8080,
			browser_command = "firefox", -- Empty string starts up with default browser
			quiet = false,
			no_css_inject = false, -- Disables css injection if true, might be useful when testing out tailwindcss
			install_path = vim.fn.stdpath("config") .. "/live-server/",
		})
	end,
}
