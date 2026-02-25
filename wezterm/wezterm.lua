local wezterm = require("wezterm")

return {
	-- 視窗設定
	window_padding = {
		left = 10,
		right = 3,
		top = 3,
		bottom = 0,
	},
	window_decorations = "RESIZE", -- Buttonless 對應為 RESIZE
	window_background_opacity = 0.96,

	-- Tab bar
	enable_tab_bar = true,
	use_fancy_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,

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
