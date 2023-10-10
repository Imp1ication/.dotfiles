return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"jayp0521/mason-null-ls.nvim",
	},
	config = function()
		-- Setup mason and mason-lspconfig --
		require("mason").setup({
			ui = {
				-- Whether to automatically check for new versions when opening the :Mason window.
				check_outdated_packages_on_open = true,

				-- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
				border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },

				-- Size of the window. Accepts:
				-- - Integer greater than 1 for fixed width.
				-- - Float in the range of 0-1 for a percentage of screen width.
				width = 0.8,
				height = 0.9,

				icons = {
					-- The list icon to use for installed packages.
					package_installed = "◍",
					-- The list icon to use for packages that are installing, or queued for installation.
					package_pending = "◍",
					-- The list icon to use for packages that are not installed.
					package_uninstalled = "◍",
				},

				keymaps = {
					toggle_package_expand = "<CR>",
					install_package = "i",
					update_package = "u",
					check_package_version = "c",
					update_all_packages = "U",
					check_outdated_packages = "C",
					uninstall_package = "X",
					cancel_installation = "<C-c>",
					apply_language_filter = "<C-f>",
				},
			},
		})

		require("mason-lspconfig").setup({
			-- list of servers for mason to install
			ensure_installed = {
				"lua_ls",
				"clangd",
				"pyright",
			},
			automatic_installation = true, -- auto-install configured servers with lspconfig
		})

		require("mason-null-ls").setup({
			ensure_installed = {
				"stylua",
				"xmlformat",
			},
			automatic_installation = true,
			automatic_setup = true,
		})
	end,
}
