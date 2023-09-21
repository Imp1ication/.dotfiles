-- Add keymaps
local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', 's', api.node.open.horizontal, opts('Open: Horizontal Split'))
    vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
end

lvim.builtin.nvimtree.setup = {
    on_attach = on_attach,
    sort_by = "name",
    view = {
        adaptive_size = true,
    },

	renderer = {
		group_empty = true,
		full_name = true,

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
        exclude = {},
    },

    actions = {
        open_file = {
            quit_on_open = false,
            resize_window = false,
            window_picker = {
                enable = true,
                picker = "default",
                chars = "QWERTYUIOPASDFGHJKLZXCVBNM"
            },
        },
    },

    update_focused_file = {
        enable = true,
        debounce_delay = 15,
        update_root = true,
        ignore_list = {},
    },

	diagnostics = {
		enable = true,
		show_on_dirs = true,
        show_on_open_dirs = false,

		icons = {
			hint = "ﴞ",
			info = "",
			warning = "",
			error = "",
		},
	},

    git = {
        enable = false,
        ignore = false,
        show_on_dirs = false,
        show_on_open_dirs =  false,
    },
}

