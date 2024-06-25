return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("bufferline").setup({
			options = {
				tab_size = 20,
				max_name_length = 20,
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

				-- Mouse actions
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,

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
						text = function()
							return string.gsub(vim.fn.getcwd(), vim.env.HOME, "~", 1)
						end, -- set hide root in nvim tree
						text_align = "left", -- "left", "center", "right"
						highlight = "Directory",
					},
				},
			},
		})
	end,
}
