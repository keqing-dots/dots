local V, F = require("utils.variables"), require("utils.functions")

F.setup_displays({
	{ "eDP-1", "1920x1080@60", "0x0" },
}, V.wpm)

F.auto_start({
	"fcitx5",
	"keqing-shell start_locked",
})

hl.config({
	input = { scroll_method = "no_scroll" },
})

hl.monitor({
	output = "DP-2",
	mode = "preferred",
	position = "auto",
	mirror = "eDP-1",
})
