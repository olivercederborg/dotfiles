local wezterm = require("wezterm")
local colors = require("lua/rose-pine").colors()
local window_frame = require("lua/rose-pine").window_frame()

return {
	default_cursor_style = "BlinkingBlock",
	colors = colors,
	window_frame = window_frame,

	-- font
	font_size = 15,
	line_height = 1.8,

	-- colorscheme
	color_scheme = "rose-pine-moon",
	window_background_opacity = 0.97,

	-- tab bar
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = true,
	tab_max_width = 999999,

	window_padding = {
		left = 30,
		right = 30,
		top = 30,
		bottom = 30,
	},
	window_decorations = "RESIZE",
}
