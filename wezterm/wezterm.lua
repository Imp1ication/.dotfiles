local wezterm = require("wezterm")

return {
	-- 視窗設定
	window_padding = {
		left = 10,
		right = 3,
		top = 3,
		bottom = 0,
	},
	window_decorations = "RESIZE", -- RESIZE | TITLE
	window_background_opacity = 0.93,

	-- Tab bar
	enable_tab_bar = false,

	-- 字體設定
	font_size = 20.0,
	font = wezterm.font("Maple Mono NF CN"),

	-- 主題
	cursor_blink_rate = 0,
	color_scheme = "Night Owl (Gogh)",

	-- 快捷鍵
	keys = {
		{
			key = "N",
			mods = "CMD",
			action = wezterm.action.SpawnWindow,
		},
	},
}
