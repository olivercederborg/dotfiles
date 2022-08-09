-- color variant hex codes
local colors = {
	base = {
		yellow = "#FFFAC2",
		teal1 = "#5DE4C7",
		teal2 = "#5FB3A1",
		teal3 = "#42675A",
		blue1 = "#89DDFF",
		blue2 = "#ADD7FF",
		blue3 = "#91B4D5",
		blue4 = "#7390AA",
		pink1 = "#FAE4FC",
		pink2 = "#FCC5E9",
		pink3 = "#D0679D",
		blueGray1 = "#A6ACCD",
		blueGray2 = "#767C9D",
		blueGray3 = "#506477",
		background1 = "#303340",
		background2 = "#1B1E28",
		background3 = "#171922",
		text = "#E4F0FB",
		white = "#FFFFFF",
	},
	storm = {
		yellow = "#FFFAC2",
		teal1 = "#5DE4C7",
		teal2 = "#5FB3A1",
		teal3 = "#42675A",
		blue1 = "#89DDFF",
		blue2 = "#ADD7FF",
		blue3 = "#91B4D5",
		blue4 = "#607487",
		pink1 = "#FAE4FC",
		pink2 = "#FCC5E9",
		pink3 = "#D0679D",
		blueGray1 = "#A6ACCD",
		blueGray2 = "#868CAD",
		blueGray3 = "#506477",
		background1 = "#404350",
		background2 = "#252B37",
		background3 = "#1B1E28",
		text = "#E4F0FB",
		white = "#FFFFFF",
	},
}

local poimandres = {}

function poimandres.select(palette)
	return {
		foreground = colors[palette].text,
		background = colors[palette].background2,
		cursor_bg = colors[palette].blue4,
		cursor_border = colors[palette].blue4,
		cursor_fg = colors[palette].background2,
		selection_bg = colors[palette].blueGray3,
		selection_fg = colors[palette].text,
		ansi = {
			colors[palette].background3,
			colors[palette].pink3,
			colors[palette].teal1,
			colors[palette].yellow,
			colors[palette].blue1,
			colors[palette].pink2,
			colors[palette].blue1,
			colors[palette].white,
		},
		brights = {
			colors[palette].blueGray3,
			colors[palette].pink3,
			colors[palette].teal1,
			colors[palette].yellow,
			colors[palette].blue2,
			colors[palette].pink2,
			colors[palette].blue2,
			colors[palette].white,
		},
		tab_bar = {
			background = colors[palette].background3,
			active_tab = {
				bg_color = colors[palette].background2,
				fg_color = colors[palette].text,
			},
			inactive_tab = {
				bg_color = colors[palette].background3,
				fg_color = colors[palette].blueGray3,
			},
			inactive_tab_hover = {
				bg_color = colors[palette].background3,
				fg_color = colors[palette].blueGray2,
			},
			new_tab = {
				bg_color = colors[palette].background3,
				fg_color = colors[palette].blueGray3,
			},
			new_tab_hover = {
				bg_color = colors[palette].background3,
				fg_color = colors[palette].blueGray2,
				italic = true,
			},
		},
		visual_bell = colors[palette].blueGray3,
		indexed = {
			[16] = colors[palette].teal1,
			[17] = colors[palette].pink3,
		},
		scrollbar_thumb = colors[palette].background1,
		split = colors[palette].background3,
		-- nightbuild only
		compose_cursor = colors[palette].pink2,
	}
end

function poimandres.setup(options)
	-- default options
	options = {
		flavour = options.flavour or "base",
	}

	return poimandres.select(options.flavour)
end

return poimandres
