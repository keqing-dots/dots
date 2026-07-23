local B = require("utils.bootstrap")

local monitors = {
	{ "eDP-1", "1920x1080@60", "0x0" },
	{ "HDMI-A-2", "1920x1080@60", "1920x0" },
}

B.setup_displays(monitors)
