-- HYPRLAND CONFIG

local V = require("utils.variables")
local B = require("utils.bootstrap")
local T = require("utils.tiling")

-- =====================
-- ENVIRONMENT VARIABLES
-- =====================
B.map_env({
	-- Core
	KEQING_DOTS_ROOT = V.root,
	WORKSPACES_PER_MONITOR = V.wpm,
	AQ_NO_ATOMIC = "1", -- workaround for 0.56.0 atomic-commit SIGSEGV on NVIDIA (releaseStashedCommit crash)

	-- Cursor themes
	HYPRCURSOR_THEME = "Keqing",
	HYPRCURSOR_SIZE = "24",
	XCURSOR_THEME = "Keqing",
	XCURSOR_SIZE = "24",

	-- Input method
	QT_IM_MODULE = "fcitx",
	XMODIFIERS = "@im=fcitx",
	INPUT_METHOD = "fcitx",
	SDL_IM_MODULE = "fcitx",

	-- Toolkit
	XDG_MENU_PREFIX = "arch-",
	QT_QPA_PLATFORMTHEME = "qt6ct",
	GTK_THEME = "Adwaita:dark",
	GTK_APPLICATION_PREFER_DARK_THEME = "1",
	QT_STYLE_OVERRIDE = "Fusion",
	QT_QUICK_CONTROLS_STYLE = "Fusion",
	QT_THEME = "dark",

	-- Session
	XDG_CURRENT_DESKTOP = "Hyprland",
	XDG_SESSION_DESKTOP = "Hyprland",
	XDG_SESSION_TYPE = "wayland",

	-- Wayland
	QT_QPA_PLATFORM = "wayland;xcb",
	GDK_BACKEND = "wayland,x11",
	MOZ_ENABLE_WAYLAND = "1",
	GTK_USE_PORTAL = "1",
})

-- ==========
-- ANIMATIONS
-- ==========
B.map_curves({
	quick = { { 0.15, 0 }, { 0.1, 1 } },
	linear = { { 0, 0 }, { 1, 1 } },
})

B.map_anim({
	{ leaf = "global", enabled = false },
	{ leaf = "fadeIn", speed = 1.5, bezier = "linear" },
	{ leaf = "fadeOut", speed = 1.5, bezier = "linear" },
	{ leaf = "windowsIn", speed = 1.5, bezier = "linear", style = "popin 85%" },
	{ leaf = "windowsOut", speed = 1.5, bezier = "linear", style = "popin 85%" },
	{ leaf = "windowsMove", speed = 2.0, bezier = "quick" },
	{ leaf = "workspaces", speed = 2.5, bezier = "quick", style = "slidevert" },
})

-- ========
-- SETTINGS
-- ========
hl.config({
	general = {
		border_size = 5,
		allow_tearing = false,
		gaps_in = 10,
		gaps_out = 20,
		resize_on_border = true,

		col = {
			active_border = { colors = { V.col.accent .. "EE", V.col.lavender .. "EE" }, angle = 45 },
			inactive_border = V.col.textDim .. "AA",
		},
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		blur = {
			enabled = false,
		},
	},

	animations = {
		enabled = true,
	},

	input = {
		kb_layout = "us",
		follow_mouse = 1,
		sensitivity = 0,

		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
			tap_to_click = true,
			drag_lock = 0,
			scroll_factor = 1.0,
		},
	},

	cursor = {
		enable_hyprcursor = true,
		no_hardware_cursors = 1,
		use_cpu_buffer = 2,
	},

	misc = {
		animate_mouse_windowdragging = true,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		force_default_wallpaper = 0,
		middle_click_paste = false,
	},

	xwayland = {
		force_zero_scaling = true,
	},
})

-- ======================
-- INITIAL MONITOR CONFIG
-- ======================
B.set_monitor("", "preferred", "0x0", 1, 0)

-- ========
-- GESTURES
-- ========
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- ============
-- WINDOW RULES
-- ============
hl.window_rule({ match = { fullscreen = true }, border_color = V.col.accentAlt })
hl.window_rule({ match = { float = true }, border_color = V.col.text })
hl.window_rule({ match = { class = "code-oss" }, opacity = "0.7" })

-- ===========
-- KEYBINDINGS
-- ===========
B.map_keybinds(nil, {
	["SUPER + F"] = hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }),
	["SUPER + I"] = B.exec(V.settings),
	["SUPER + L"] = B.exec(V.lock),
	["SUPER + P"] = hl.dsp.window.pseudo(),
	["SUPER + Q"] = B.exec(V.logout),
	["SUPER + V"] = hl.dsp.window.float({ action = "toggle" }),
	["SUPER + ALT + K"] = B.exec(V.editor .. " keqing-shell"),
	["SUPER + CTRL + SHIFT + W"] = function() T.cw("a") end,
	["SUPER + SHIFT + C"] = B.exec(V.control),
	["SUPER + SHIFT + F"] = hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }),
	["SUPER + SHIFT + K"] = B.exec(V.editor .. " keqing-dots"),
	["SUPER + SHIFT + S"] = B.exec(V.screenshot),
	["SUPER + SHIFT + W"] = function() T.cw() end,
	["SHIFT + SPACE"] = B.exec(V.launcher),
	["SUPER + TAB"] = B.exec(V.overview),
})

B.map_keybinds({ repeating = true }, {
	["SUPER + B"] = B.exec(V.browser),
	["SUPER + C"] = B.exec(V.editor),
	["SUPER + E"] = B.exec(V.filemanager),
	["SUPER + T"] = B.exec(V.terminal),
	["SUPER + W"] = hl.dsp.window.close(),
	["SUPER + SHIFT + B"] = B.exec(V.browser_private),
})

B.map_keybinds({ repeating = true }, {
	["SUPER + up"] = hl.dsp.focus({ direction = "u" }),
	["SUPER + down"] = hl.dsp.focus({ direction = "d" }),
	["SUPER + left"] = hl.dsp.focus({ direction = "l" }),
	["SUPER + right"] = hl.dsp.focus({ direction = "r" }),
	["SUPER + SHIFT + up"] = function() T.adaptive_move("u") end,
	["SUPER + SHIFT + down"] = function() T.adaptive_move("d") end,
	["SUPER + SHIFT + left"] = function() T.adaptive_move("l") end,
	["SUPER + SHIFT + right"] = function() T.adaptive_move("r") end,
})

for i = 1, V.wpm do
	local k = i % V.wpm
	hl.bind("SUPER + " .. k, function() T.fw(i) end)
	hl.bind("SUPER + CTRL + " .. k, function() T.sw(i) end)
	hl.bind("SUPER + SHIFT + " .. k, function() T.mw(i) end)
end

B.map_keybinds({ locked = true, repeating = true }, {
	["XF86AudioRaiseVolume"] = B.exec("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"),
	["XF86AudioLowerVolume"] = B.exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"),
	["XF86AudioMicMute"] = B.exec("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	["XF86AudioMute"] = B.exec("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	["XF86MonBrightnessDown"] = B.exec("brightnessctl -e4 -n2 set 1%-"),
	["XF86MonBrightnessUp"] = B.exec("brightnessctl -e4 -n2 set 1%+"),
})

B.map_keybinds({ mouse = true }, {
	["SUPER + mouse:272"] = hl.dsp.window.drag(),
	["SUPER + mouse:273"] = hl.dsp.window.resize(),
})

B.auto_start({
	"fcitx5",
	"keqing-shell"
})

B.load_device()
