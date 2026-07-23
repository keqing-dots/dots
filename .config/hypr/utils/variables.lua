-- VARIABLES

local V = {}

-- Palette
V.col = require("utils.colors")

-- Home
V.home = os.getenv("HOME")

-- Core
V.root = V.home .. "/keqing-dots"
V.wpm = 10

-- Applications
V.terminal = "kitty"
V.browser = "zen-browser"
V.browser_private = "zen-browser --private"
V.editor = "code"
V.filemanager = V.terminal .. " yazi"
V.screenshot = "bash -c 'mkdir -p $HOME/Pictures/screenshots/ && hyprshot -m region -o $HOME/Pictures/screenshots/'"

-- Keqing-shell IPC Calls
V.qs = "keqing-shell "
V.control = V.qs .. "controlcenter"
V.launcher = V.qs .. "launcher"
V.lock = V.qs .. "lock"
V.logout = V.qs .. "logout"
V.overview = V.qs .. "overview"
V.settings = V.qs .. "settings"
V.visualizer = V.qs .. "visualizer"

return V
