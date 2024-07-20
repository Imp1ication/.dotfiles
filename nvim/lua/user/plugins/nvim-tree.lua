return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		-- Keymaps --
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")
			local opts = { buffer = bufnr, noremap = true, silent = true }

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			vim.keymap.set("n", "l", api.node.open.edit, opts)
			vim.keymap.set("n", "<CR>", api.node.open.edit, opts)
			vim.keymap.set("n", "h", api.node.navigate.parent_close, opts)
			vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts)

			vim.keymap.set("n", "v", api.node.open.vertical, opts)
			vim.keymap.set("n", "s", api.node.open.horizontal, opts)

			vim.keymap.set("n", "r", api.fs.rename, opts)
			vim.keymap.set("n", "R", api.fs.rename_sub, opts)
			vim.keymap.set("n", "<C-r>", api.tree.reload, opts)
			vim.keymap.set("n", "<C-c>", api.tree.collapse_all, opts)
		end

		-- Config --
		-- disable netrw at the very start
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			on_attach = my_on_attach,
			sort_by = "name", -- "name", "case_sensitive", "modification_time", "extension", "suffix", "filetype"
			git = { enable = false },

			view = {
				side = "left", -- "left", "right"
				cursorline = true,
				signcolumn = "auto", -- "yes", "auto", "no"

				float = {
					enable = true,
					open_win_config = function()
						local screen_w = vim.opt.columns:get()
						local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
						local window_w = screen_w * 0.5
						local window_h = screen_h * 0.8
						local center_x = (screen_w - window_w) / 2
						local center_y = (screen_h - window_h) / 2
						return {
							border = "rounded",
							relative = "editor",
							row = center_y,
							col = center_x,
							width = math.floor(window_w),
							height = math.floor(window_h),
						}
					end,
				},
			},

			renderer = {
				group_empty = true,
				full_name = true,
                root_folder_label = function()
                    return string.gsub(vim.fn.getcwd(), vim.env.HOME, "~", 1)
                end,

				highlight_git = false,

				indent_width = 2,
				indent_markers = {
					enable = true,
					inline_arrows = false,
				},

				special_files = {
					"Cargo.toml",
					"Makefile",
					"README.md",
					"readme.md",
				},

				icons = {
					show = {
						git = false,
						file = true,
						folder = true,
						folder_arrow = true,
						diagnostics = true,
					},
				},
			},

			filters = {
				dotfiles = false,
				custom = {
					"*.meta",
				},

				exclude = {
					".gitignore",
				},
			},

			actions = {
				open_file = {
					quit_on_open = true,
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
				show_on_dirs = false,
				show_on_open_dirs = true,
				severity = {
					min = vim.diagnostic.severity.WARN,
					max = vim.diagnostic.severity.ERROR,
				},
			},
		})
	end,
}
