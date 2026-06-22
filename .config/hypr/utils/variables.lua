-- VARIABLES

local V = {}

-- Palette
V.col = {}
V.col.accent = "#7B2FE8" -- deep violet overcoat (primary)
V.col.accentContainer = "#3D1878" -- overcoat shadow (primary container)
V.col.accentAlt = "#C8942A" -- antique gold ornaments (secondary)
V.col.accentAltContainer = "#6B4A18" -- pressed gold (secondary container)
V.col.lavender = "#C87EFF" -- pale lavender inner top
V.col.lavenderSubtle = "#E8D4F8" -- pale lavender near-white
V.col.textMuted = "#A896C8" -- lavender glove trim (muted text)
V.col.textDim = "#6B5890" -- dim purple-grey (disabled/inactive)
V.col.text = "#F0ECF8" -- lavender-white (white flowers + pale top)
V.col.fieldBg = "#0F1535" -- dark blue skirt (surface)
V.col.surfaceAlt = "#1A1848" -- elevated surface
V.col.base = "#12091E" -- near-black gloves (base)
V.col.electro = "#9D3EF2" -- Electro Vision (fixed lore color)

-- Home
V.home = os.getenv("HOME")

-- Core
V.root = V.home .. "/keqing-dots"
V.wpm = 10

-- Applications
V.terminal = "kitty"
V.browser = "zen-browser"
V.browser_private = "zen-browser --private"
V.editor = "codium"
V.filemanager = V.terminal .. " yazi"
V.screenshot = "bash -c 'mkdir -p $HOME/Pictures/screenshots/ && hyprshot -m region -o $HOME/Pictures/screenshots/'"

-- Hyprtile
V.tile = "hyprtile "
V.fw = V.tile .. "fw "
V.mw = V.tile .. "mw "
V.cw = V.tile .. "cw "
V.sw = V.tile .. "sw "

-- Keqing-shell IPC Calls
V.qs = "keqing-shell "
V.launcher = V.qs .. "launcher"
V.lock = V.qs .. "lock"
V.logout = V.qs .. "logout"
V.overview = V.qs .. "overview"
V.settings = V.qs .. "settings"

return V
