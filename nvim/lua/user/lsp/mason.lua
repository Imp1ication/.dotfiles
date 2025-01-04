return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- Setup mason and mason-lspconfig --
		require("mason").setup({
			ui = {
				-- Whether to automatically check for new versions when opening the :Mason window.
				check_outdated_packages_on_open = true,
				border = "rounded",

				-- Size of the window. Accepts:
				-- - Integer greater than 1 for fixed width.
				-- - Float in the range of 0-1 for a percentage of screen width.
				width = 0.8,
				height = 0.8,

				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup({
			-- list of servers for mason to install
			ensure_installed = {
				"lua_ls",
			},
			automatic_installation = true, -- auto-install configured servers with lspconfig
		})

		require("mason-tool-installer").setup({
			-- list of tools for mason to install
			ensure_installed = {
				"stylua",
				"prettier",
			},
			automatic_installation = true, -- auto-install configured tools
		})
	end,
}
