lvim.builtin.bufferline = {
	options = {
		tab_size = 18,
		max_name_length = 18,
		numbers = "none", -- "none", "ordinal", "buffer_id", "both", function({ ordinal, id, lower, raise }): string

		always_show_bufferline = true,
		separator_style = "slant", -- "slant", "thick", "thin", {"|", "|"}

		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = false,

		indicator = {
			style = "none", -- "icon", "underline", "none"
			icon = "▎", -- this should be omitted if indicator style is not "icon"
		},

		-- Diagnostics
		diagnostics = "nvim_lsp", -- false, "nvim_lsp", "coc"
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(_, _, diagnostics_dict, _)
			local key = "none"
			for i, _ in pairs(diagnostics_dict) do
				if i == "error" then
					key = "error"
				elseif key ~= "error" and i == "warning" then
					key = "warning"
				elseif key == "none" then
					key = i
				end
			end

			local icon = (key == "error" and " " or (key == "warning" and " " or "󰠠 "))
			return "" .. icon .. diagnostics_dict[key]
		end,

		offsets = {
			{
				filetype = "NvimTree",
                text = "Explorer",
				text_align = "center", -- "left", "center", "right"
				highlight = "Pmenu",
			},
		},
	},
}
