local M = {}

M.border_style = {
	["none"] = {},
	["default"] = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
	["bold"] = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
	["double"] = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
	["round"] = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
}

M.kind_icons = {
	Text = "",
	Method = "",
	Function = "󰊕",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "󰡱",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
	Copilot = "󱙺",
}

M.gitsigns = {
	add = { text = "+" },
	change = { text = "│" },
	delete = { text = "" },
	topdelete = { text = "" },
	changedelete = { text = "~" },
	untracked = { text = "▎" },
}

M.diagnostic = {
	error = " ",
	warn = " ",
	hint = "󰠠 ",
	info = " ",
}

return M
