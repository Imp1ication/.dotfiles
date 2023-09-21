local colors = {
	black = "#202328",
	white = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
	red = "#fb4934",
}

local mid_section = {
	function()
		return "%="
	end,
}

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

-- Component options --
local filename = {
	"filename",
	-- 0: Just the filename
	-- 1: Relative path
	-- 2: Absolute path
	-- 3: Absolute path, with tilde as the home directory
	path = 1,
	shorting_target = 40, -- Shortens path to leave 40 spaces in the window
	file_status = true,
	newfile_status = false, -- Display new file status (new file means no write after created)
	symbols = {
		modified = "[+]",
		readonly = "[]",
		unnamed = "[No Name]",
		newfile = "[New]",
	},
	color = { fg = colors.white, gui = "bold" },
}

local location = {
	"location",
	icon = "",
	color = { fg = colors.violet },
	cond = hide_in_width,
}

local progress = {
	"progress",
	color = { fg = colors.violet },
	cond = hide_in_width,
}

local lsp_server = {
	-- Lsp server name .
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = " LSP:",
	color = { fg = colors.blue, gui = "bold" },
}

local diag = {
	"diagnostics",
	sources = { "nvim_lsp" },
	symbols = { error = " ", warn = " ", hint = "󰠠 ", info = " " },
	colored = true, -- Displays diagnostics status in color if set to true.
	update_in_insert = true, -- Update diagnostics in insert mode.
	always_visible = false, -- Show diagnostics even if there are none.
}

local branch = {
	"branch",
	icon = "",
	color = { fg = colors.yellow, gui = "bold" },
}

local diff = {
	"diff",
	symbols = { added = " ", modified = "柳", removed = " " },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
	cond = hide_in_width,
}

-- Setup --
lvim.builtin.lualine = {
    style = "none",
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 300,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {},
		lualine_c = {
            filename,
			location,
			progress,
			mid_section,
			lsp_server,
		},
		lualine_x = { diag, branch, diff },
		lualine_y = {},
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { filename, mid_section, lsp_server },
		lualine_x = { branch },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {
        "nvim-tree",
        "toggleterm",
    },
}
