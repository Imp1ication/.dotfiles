return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		-- Keymap --
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", opts)
		vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<CR>", opts)
		vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
		vim.keymap.set("n", "<leader>fs", ":Telescope grep_string<CR>", opts)
		vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", opts)

		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {

				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { "smart" },
				layout_strategy = "horizontal", -- "horizontal", "vertical", "center", "cursor"

				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,

						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,
						["<Tab>"] = actions.move_selection_worse,
						["<S-Tab>"] = actions.move_selection_better,

						["<C-c>"] = actions.close,

						["<CR>"] = actions.select_default,
						["<C-s>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,

						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,

						["<PageUp>"] = actions.results_scrolling_up,
						["<PageDown>"] = actions.results_scrolling_down,

						-- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						-- ["<M-q>"] = actions.send_selected_to_qflist, -- + actions.open_qflist,
						-- ["<C-l>"] = actions.complete_tag,
						-- ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
					},

					n = {
						["<Esc>"] = actions.close,
						["<C-c>"] = actions.close,

						["<CR>"] = actions.select_default,
						["<C-s>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,

						["<Tab>"] = actions.move_selection_worse,
						["<S-Tab>"] = actions.move_selection_better,
						-- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						-- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["H"] = actions.move_to_top,
						["M"] = actions.move_to_middle,
						["L"] = actions.move_to_bottom,

						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,
						["gg"] = actions.move_to_top,
						["G"] = actions.move_to_bottom,

						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,

						["<PageUp>"] = actions.results_scrolling_up,
						["<PageDown>"] = actions.results_scrolling_down,

						["?"] = actions.which_key,
					},
				},
			},
			pickers = {
				find_files = {
					theme = "dropdown", -- "dropdown", "cursor", "ivy"
					previewer = false,
				},

				oldfiles = {
					previewer = false,
				},
			},
			extensions = {
				-- Your extension configuration goes here:
				-- extension_name = {
				--   extension_config_key = value,
				-- }
				-- please take a look at the readme of the extension you want to configure
			},
		})

		telescope.load_extension("fzf")
	end,
}
