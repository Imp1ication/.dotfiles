return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Keymaps
		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
			vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open: Horizontal Split"))
			vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
		end

		-- Config
		-- disable netrw at the very start of your init.lua (strongly advised)
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			on_attach = my_on_attach,
			sort_by = "name", -- "name", "case_sensitive", "modification_time", "extension"

			view = {
				side = "left", -- "left", "right"
				cursorline = true,
				signcolumn = "yes", -- "yes", "auto", "no"

				adaptive_size = true,
				width = {
					min = 25,
					max = 35,
				},
			},

			renderer = {
				group_empty = true,
				full_name = true,
				root_folder_label = false,

				highlight_git = false,

				indent_width = 2,
				indent_markers = {
					enable = true,
					inline_arrows = false,
				},

				icons = {
					show = {
						git = false,
						file = true,
						folder = true,
						folder_arrow = true,
					},

					-- git_placement = "after", -- "after", "before", "signcolumn"
					glyphs = {
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},

				special_files = {
					"Cargo.toml",
					"Makefile",
					"README.md",
					"readme.md",
				},
			},

			filters = {
				dotfiles = false,
				git_clean = false,
				custom = {
					"*.meta",
				},

				-- Overrides "git.ignore", "filters.dotfiles", and "filters.custom"
				exclude = {
					"git.ignore",
				},
			},

			actions = {
				open_file = {
					quit_on_open = false,
					resize_window = false,
					window_picker = {
						enable = true,
						picker = "default",
						chars = "QWERTYUIOPASDFGHJKLZXCVBNM",
					},
				},
			},

			update_focused_file = {
				enable = true,
				update_root = true,
			},

			diagnostics = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = false,

				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},

			git = {
				enable = false,
				ignore = false,
				show_on_dirs = false,
				show_on_open_dirs = false,
			},
		})
	end,
}
