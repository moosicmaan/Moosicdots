--[[
=====================================================
-----------------------------------------------------
|    H Y P R L A N D  C O N F I G U R A T I O N     |
|          .config/hypr/hyprland.lua                |
|           Jason Bradberry, 2024/26                |
|    https://wiki.hypr.land/Configuring/Start/      |
-----------------------------------------------------
=====================================================
--]]

--[[
    -------------------------------------------------
    LOAD REQUIREO FILES
    -------------------------------------------------
--]]
-- LOAD PYWAL COLOR FILE
local colors = require("confs.colorslink")
-- require("confs.colors")

-- Internal stuff --
require("confs.lib")
-- require("confs.services")

-- Default configurations --
-- require("confs.animation")
-- require("confs.autostart")
-- require("confs.cursor")
-- require("confs.environment")
-- require("confs.groups")
-- require("confs.inputs")
-- require("confs.keybinds")
-- require("confs.layouts")
-- require("confs.misc")
-- require("confs.outputs")
-- require("confs.vars")
-- require("confs.winDecorations")
-- require("confs.winRules")
-- require("confs.workspaces")

--[[
    -------------------------------------------------
    OUTPUTS
    -------------------------------------------------
--]]
---- MONITORS ----
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@60",
	position = "1920x0",
	scale = "1",
})
hl.monitor({
	output = "eDP-1",
	mode = "1920x1080@60",
	position = "0x0",
	scale = 1,
})

--[[
    -------------------------------------------------
    INPUTS
    -------------------------------------------------
--]]
hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		repeat_rate = 100,
		repeat_delay = 300,

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

--[[
    -------------------------------------------------
    VARIABLES
    -------------------------------------------------
--]]
---- MODS ----
local MOD = "SUPER" -- Sets "Windows" key as main modifier
local HYPER = MOD .. " + CTRL + ALT + SHIFT"
local MEH = "CTRL + ALT + SHIFT"
-- local reset = "hyprctl dispatch submap reset"
local prefix = "uwsm app -- "

---- FILES ----
local my_dots = "/mnt/data/moosicmaan/CONFIG"
local my_config = my_dots .. "/.config"
local my_scripts = my_config .. "/.scripts"

---- APPLICATIONS ----
local my_term = "foot" -- Launch default terminal
local my_term2 = "kitty" -- Launch alternate terminal
local my_brows = "brave" -- Launch default browser
local my_brows2 = "qutebrowser" -- Launch alternate browser
local my_browsv = "zen-browser" -- Launch VIM-based browser
local my_email = prefix .. "thunderbird" -- Launch default email client
local my_email2 = "thunderbird" -- Launch alternate email client
local my_editg = "kate" -- Launch GUI text editor
local my_editc = "neovide" -- Launch GUI tui-like text editor
local my_filesg = "dolphin" -- Launch GUI file browser
local my_filesc = my_term .. " -e yazi" -- Launch console file browser
local my_music = "elisa" -- Launch music player
local my_media = "mpv --player-operation-mode=pseudo-gui" -- Launch media player
local my_office = "onlyoffice-desktopeditors" -- Launch office suite
local my_image = "gimp" -- Launch GUI image editor
local emacsd = "emacs --daemon=serve" -- EMACS daemon
local emacsc = "emacsclient -c -a 'emacs'" -- EMACS client
local emojis = "emote" -- Launch emoji browser
local my_stream = "obs" -- Launch streaming software
local aiassist = "brave --app=https://chat.openai.com" -- Launch OpenAI web app
local my_mux = my_term2 .. " -e tmux" -- (alt) kitty -e sh -c
-- local lockscr = "swaylock -c 000000" -- Lock screen
local prntscrn = my_scripts .. "/ut-screenshot" -- Take a screenshot
local my_calc = "pkill galculator || galculator" -- Toggle calculator
local videdit = "org.kde.kdenlive" -- Video editing software
local zoomclient = "zoom" -- Conferencing software

---- APPLICATION LAUNCHERS AND MENUS ----
local logot = "wlogout" -- Launch power menu
local menu_full = "nwg-drawer -c 7 -is 70 -spacing 20 -ovl" -- Full screen app drawer
local bsearch = "pkill rofi || " .. my_scripts .. "/rofi-search" -- Start a online search
local clips = "pkill rofi || " .. my_scripts .. "/rofi-cliphist" -- Search clipboard history
local keybs = "pkill rofi || " .. my_scripts .. "/hypr-keybinds" -- Search keybindings
local bbooks = "pkill rofi || " .. my_scripts .. "/rofi-bookmarks" -- Search browser bookmarks
local my_beats = "pkill rofi || " .. my_scripts .. "/rofi-beats" -- Rofi Media and Radio Selector
local my_favs = "pkill rofi || " .. my_scripts .. "/rofi-beat-favs" -- Rofi Playlist Manager
local menu_run = "pkill rofi || rofi -config " .. my_config .. "/rofi/dmenu.rasi -show run -run-command '{cmd}'"
local menu_drun = "pkill rofi || rofi -config " .. my_config .. "/rofi/config.rasi -show drun -run-command '{cmd}'"
local menu_win = "pkill rofi || rofi -config " .. my_config .. "/rofi/config.rasi -show window"
local menu_files = "pkill rofi || rofi -config " .. my_config .. "/rofi/config.rasi -show filebrowser"
local netwrk = "pkill rofi || networkmanager_dmenu"

---- ENVIRONMENT ACTIONS ----
local bartog = "pkill waybar || " .. my_scripts .. "/wb-launch" -- Toggle status bar
-- local zoomscrn   = pypr zoom                                    -- Zoom the screen toggle --TODO
-- local zoomscrnu  = pypr zoom ++0.5                              -- Zoom the screen up
-- local zoomscrnd  = pypr zoom --0.5                              -- Zoom the screen down
local wallr = my_scripts .. "/ut-wallpaper --random" -- Select random wallpaper
local barsel = my_scripts .. "/wb-switch" -- Select status bar theme
local walls = my_scripts .. "/ut-wallpaper --select" -- Select wallpaper
local kmndext = my_scripts .. "/ut-kbd-350" -- Toggle external keyboard
local kmndlap = my_scripts .. "/ut-kbd-lap" -- Toggle laptop keyboard
local visualh = my_scripts .. "/hypr-visuals" -- Toggle visual element themes
local gamemode = my_scripts .. "/hypr-gamemode" -- Toggle game mode for hyprland
local rload = "hyprctl reload && " .. my_scripts .. "/hypr-mon-reload && " .. my_scripts .. "/ut-wallpaper --init" -- Reload gui environment

---- MEDIA & MEDIA KEYS ----
local volu = my_scripts .. "/media-vol --inc" -- Increase volume
local vold = my_scripts .. "/media-vol --dec" -- Decrease volume
local volt = my_scripts .. "/media-vol --toggle" -- Toggle mute
local micu = my_scripts .. "/media-vol --mic-inc" -- Increase mic volume
local micd = my_scripts .. "/media-vol --mic-dec" -- Decrease mic volume
local mict = my_scripts .. "/media-vol --mic-toggle" -- Toggle mic
local mpp = my_scripts .. "/media-ctrl --pause" -- Play/Pause media
local mstop = my_scripts .. "/media-ctrl --stop" -- Stop media
local mnxt = my_scripts .. "/media-ctrl --nxt" -- Next track
local mprv = my_scripts .. "/media-ctrl --prv" -- Previous track
local mnow = my_scripts .. "/media-ctrl --show" -- Show current track info
local brightu = my_scripts .. "/ut-monbrightness --inc" -- Increase brightness of laptop monitor
local brightd = my_scripts .. "/ut-monbrightness --dec" -- Decrease brightness of laptop monitor
local brightmu = my_scripts .. "/ut-exmon-brightness --inc" -- Increase brightness of external monitor
local brightmd = my_scripts .. "/ut-exmon-brightness --dec" -- Decrease brightness of external monitor

--[[
    -------------------------------------------------
    HYPRLAND EVENTS & ENVIRONMENT
    -------------------------------------------------
--]]
---- AUTOSTART ----
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
-- put former exec-once commands inside the func and former exec commands outside
hl.on("hyprland.start", function()
	hl.exec_cmd("uwsm app -- /usr/lib/hyprpolkitagent/hyprpolkitagent")
	-- hl.exec_cmd("uwsm app -- /usr/bin/pypr # --config $HOME/.config/hypr/plugins/pyprland.toml")
	hl.exec_cmd("uwsm app -- dunst")
	hl.exec_cmd("uwsm app -- wl-paste --watch cliphist store")
	hl.exec_cmd("uwsm app -- garuda-system-maintenance")
	hl.exec_cmd("/home/moosicmaan/.config/.scripts/ut-bluelight")
	hl.exec_cmd("uwsm app -- awww query || uwsm app -- awww-daemon")
	hl.exec_cmd("sleep 1 && $HOME/.config/.scripts/ut-wallpaper --init")
	hl.exec_cmd(
		-- "uwsm app -- swayidle - w timeout 900 'waylock' timeout 1600 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'waylock'"
		"uwsm app -- swayidle - w timeout 900 'swaylock -f' timeout 1600 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock -f'"
	)
end)

---- ENVIRONMENT VARIABLES ----
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.exec_cmd("hyprctl setcursor Catppuccin-Mocha-Dark-Cursors 36")
hl.env("XCURSOR_SIZE", "36")
hl.env("HYPRCURSOR_SIZE", "36")

----- PERMISSIONS -----
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons
-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })
-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

--[[
    -------------------------------------------------
    LOOK AND FEEL
    -------------------------------------------------
--]]
-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
---- GENERAL ----
hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 2,
		border_size = 2,
		col = {
			active_border = { colors = { "rgba(efefeffa)", colors.color5 }, angle = 65 },
			inactive_border = { colors = { colors.color5, "rgba(333333aa)" }, angle = 65 },
		},
		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,
		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,
		layout = "master",
	},
	decoration = {
		rounding = 0,
		rounding_power = 0,
		-- Change transparency of focused and unfocused windows
		active_opacity = 0.95,
		inactive_opacity = 0.85,
		fullscreen_opacity = 1.0,
		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},
		blur = {
			enabled = true,
			size = 5,
			passes = 2,
			vibrancy = 0.1696,
			xray = true,
		},
	},
	animations = {
		enabled = true,
	},
})

---- CURSOR ----
hl.config({
	cursor = {
		sync_gsettings_theme = true,
		no_hardware_cursors = 2,
		default_monitor = "HDMI-A-1",
		enable_hyprcursor = true,
		hide_on_key_press = true,
	},
})

---- ANIMATIONS ----
-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

---- LAYOUTS ----
-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})
-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
	master = {
		new_status = "slave",
		mfact = 0.5,
	},
})
-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

---- MISC ----
hl.config({
	misc = {
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
		allow_session_lock_restore = true,
	},
})

--[[
    -------------------------------------------------
    KEYBINDINGS
    -------------------------------------------------
--]]
---- APPLICATIONS ----
hl.bind(MOD .. " + T", hl.dsp.exec_cmd(my_term2))
hl.bind(MOD .. " + Return", hl.dsp.exec_cmd(my_term))
hl.bind(MOD .. " + SHIFT + Return", hl.dsp.exec_cmd(my_filesg))
hl.bind(MOD .. " + CTRL + Return", hl.dsp.exec_cmd(my_email))
hl.bind(MOD .. " + B", hl.dsp.exec_cmd(my_brows))
hl.bind(MOD .. " + O", hl.dsp.exec_cmd(my_browsv))
hl.bind("CTRL + ALT + A", hl.dsp.exec_cmd(aiassist))
hl.bind(MOD .. " + I", hl.dsp.exec_cmd(emojis))
hl.bind(MOD .. " + E", hl.dsp.exec_cmd(emacsc))
hl.bind(MOD .. " + SHIFT + E", hl.dsp.exec_cmd(emacsd))
hl.bind(MOD .. " + M", hl.dsp.exec_cmd(my_music))
hl.bind(MOD .. " + SHIFT + M", hl.dsp.exec_cmd(my_media))
hl.bind("CTRL + ALT + M", hl.dsp.exec_cmd(my_beats))
hl.bind(HYPER .. " + U", hl.dsp.exec_cmd(mnow))
hl.bind(HYPER .. " + I", hl.dsp.exec_cmd(my_favs))
hl.bind("CTRL + ALT + T", hl.dsp.exec_cmd(my_mux))
hl.bind(MOD .. " + Print", hl.dsp.exec_cmd(prntscrn))
hl.bind(" + Print", hl.dsp.exec_cmd(prntscrn))
hl.bind(MOD .. " + N", hl.dsp.exec_cmd(my_editc))

hl.bind("ALT + N", hl.dsp.submap("text-edit"))
hl.define_submap("text-edit", "reset", function()
	hl.bind("m", hl.dsp.exec_cmd("cd " .. my_config .. " && " .. my_editc))
	hl.bind("h", hl.dsp.exec_cmd(my_editc .. " " .. my_config .. "/hypr/"))
	hl.bind("s", hl.dsp.exec_cmd(my_editc .. " " .. my_config .. "/sway/"))
	hl.bind("d", hl.dsp.exec_cmd(my_editc .. " " .. my_config .. "/dwm/"))
	hl.bind("x", hl.dsp.exec_cmd(my_editc .. " " .. my_config .. "/.scripts/"))
	hl.bind("l", hl.dsp.exec_cmd(my_editc .. " " .. my_config .. "/nvim/"))
	hl.bind("escape", hl.dsp.submap("reset"))
end)

---- APPLICATION LAUNCHERS & MENUS ----
hl.bind(MOD .. " + P", hl.dsp.exec_cmd(menu_run))
hl.bind(MOD .. " + SHIFT + P", hl.dsp.exec_cmd(menu_drun))
hl.bind(MOD .. " + CTRL + P", hl.dsp.exec_cmd(menu_files))
hl.bind(MOD .. " + ALT + P", hl.dsp.exec_cmd(menu_win))
hl.bind("CTRL + ALT + P", hl.dsp.exec_cmd(menu_full))
hl.bind(MOD .. " + SHIFT + O", hl.dsp.exec_cmd(bbooks))
hl.bind(MOD .. " + CTRL + C", hl.dsp.exec_cmd(clips))
hl.bind(MOD .. " + CTRL + V", hl.dsp.exec_cmd(clips))
hl.bind(MOD .. " + CTRL + Q", hl.dsp.exec_cmd(logot))
hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd(logot))
hl.bind(
	MOD .. " + SHIFT + Q",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind("CTRL + ALT + O", hl.dsp.exec_cmd(bsearch))
hl.bind("CTRL + ALT + K", hl.dsp.exec_cmd(keybs)) --TODO

---- FUNCTION KEYS/HOTLIST ----
hl.bind(MEH .. " + F1", hl.dsp.exec_cmd(my_brows2))
hl.bind(MEH .. " + F2", hl.dsp.exec_cmd(my_email2))
hl.bind(MEH .. " + F3", hl.dsp.exec_cmd(my_filesc))
hl.bind(MEH .. " + F4", hl.dsp.exec_cmd(my_editg))
hl.bind(MEH .. " + F5", hl.dsp.exec_cmd(my_image))
hl.bind(MEH .. " + F6", hl.dsp.exec_cmd(my_office))
hl.bind(MEH .. " + F7", hl.dsp.exec_cmd(zoomclient))
hl.bind(MEH .. " + F8", hl.dsp.exec_cmd(videdit))
hl.bind(MEH .. " + F9", hl.dsp.exec_cmd(my_stream))
hl.bind(MEH .. " + F10", hl.dsp.exec_cmd(menu_run))
hl.bind(MEH .. " + F11", hl.dsp.exec_cmd(menu_drun))
hl.bind(MEH .. " + F12", hl.dsp.exec_cmd(menu_full))

hl.bind(" + F11", hl.dsp.window.fullscreen({ action = "toggle" }))

---- ENVIRONMENT/THEME ACTIONS ----
hl.bind(MOD .. " + CTRL + R", hl.dsp.exec_cmd(rload))
hl.bind(MOD .. " + CTRL + T", hl.dsp.exec_cmd(barsel))
hl.bind(MOD .. " + CTRL + B", hl.dsp.exec_cmd(bartog))
hl.bind(MOD .. " + CTRL + S", hl.dsp.exec_cmd(walls))
hl.bind(MOD .. " + CTRL + W", hl.dsp.exec_cmd(wallr))
hl.bind(MEH .. "  + K", hl.dsp.exec_cmd(kmndext))
hl.bind(MEH .. "  + J", hl.dsp.exec_cmd(kmndlap))
hl.bind("CTRL + ALT + G", hl.dsp.exec_cmd(gamemode)) --TODO
hl.bind("CTRL + ALT + H", hl.dsp.exec_cmd(visualh)) --TODO
hl.bind("CTRL + ALT + n", hl.dsp.exec_cmd(netwrk))

---- WINDOWS ----
hl.bind(MOD .. " + Q", hl.dsp.window.close())
hl.bind(MOD .. " + W", hl.dsp.window.pseudo())
hl.bind("ALT + T", hl.dsp.layout("togglesplit"))
hl.bind(MOD .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(MOD .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))
-- Move focus with MOD +
hl.bind(MOD .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(MOD .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(MOD .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(MOD .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(MOD .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(MOD .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(MOD .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(MOD .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move/resize windows with MOD + LMB/RMB and dragging
hl.bind(MOD .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(MOD .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("ALT + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
	hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
	hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind("up", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	hl.bind("down", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
	hl.bind("L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
	hl.bind("H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind("J", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	hl.bind("K", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
	hl.bind("escape", hl.dsp.submap("reset"))
end)

---- WORKSPACES ----
-- Switch workspaces with MOD + [0-9]
-- Move active window to a workspace with MOD + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(MOD .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(MOD .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with MOD + scroll
hl.bind(MOD .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(MOD .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

---- MONITORS ----
hl.bind(MOD .. " + period", hl.dsp.focus({ monitor = "+1" }))
hl.bind(MOD .. " + comma", hl.dsp.workspace.swap_monitors({ monitor1 = "HDMI-A-1", monitor2 = "eDP-1" }))

---- MEDIA & MEDIA KEYS ----
hl.bind(
	"XF86AudioRaiseVolume",
	-- hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	hl.dsp.exec_cmd(volu),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	-- hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	hl.dsp.exec_cmd(vold),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	-- hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	hl.dsp.exec_cmd(volt),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	-- hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	hl.dsp.exec_cmd(mict),
	{ locked = true, repeating = true }
)
hl.bind(HYPER .. " + M", hl.dsp.exec_cmd(micd), { locked = true, repeating = true })
hl.bind(HYPER .. " + comma", hl.dsp.exec_cmd(micu), { locked = true, repeating = true })
hl.bind(HYPER .. " + period", hl.dsp.exec_cmd(mict), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
hl.bind("XF86Calculator", hl.dsp.exec_cmd(my_calc), { locked = true, repeating = true })
-- hl.bind("XF86Lock", hl.dsp.exec_cmd(lockscr), { locked = true, repeating = true })
hl.bind("XF86AppSelect", hl.dsp.exec_cmd(menu_full), { locked = true, repeating = true })

hl.bind("XF86ZoomIn", hl.dsp.exec_cmd(brightu), { locked = true, repeating = true })
hl.bind("XF86ZoomOut", hl.dsp.exec_cmd(brightd), { locked = true, repeating = true })
hl.bind("SHIFT + XF86ZoomIn", hl.dsp.exec_cmd(brightmu), { locked = true, repeating = true })
hl.bind("SHIFT + XF86ZoomOut", hl.dsp.exec_cmd(brightmd), { locked = true, repeating = true })
hl.bind(HYPER .. " + up", hl.dsp.exec_cmd(brightmu), { locked = true, repeating = true })
hl.bind(HYPER .. " + down", hl.dsp.exec_cmd(brightmd), { locked = true, repeating = true })
hl.bind(MEH .. " + up", hl.dsp.exec_cmd(brightu), { locked = true, repeating = true })
hl.bind(MEH .. " + down", hl.dsp.exec_cmd(brightd), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(mnxt), { locked = true })
hl.bind("XF86AudioStop", hl.dsp.exec_cmd(mstop), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(mpp), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(mprv), { locked = true })
hl.bind("XF86AudioMedia", hl.dsp.exec_cmd(mnow), { locked = true })

--[[
    -------------------------------------------------
    WINDOWS, LAYERS, AND WORKSPACES RULES ----
    -------------------------------------------------
--]]
---- WORKSPACES RULES ----
-- "Smart gaps" / "No gaps when only"
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({
	name = "no-gaps-wtv1",
	match = { float = false, workspace = "w[tv1]" },
	border_size = 0,
	rounding = 0,
})
hl.window_rule({
	name = "no-gaps-f1",
	match = { float = false, workspace = "f[1]" },
	border_size = 0,
	rounding = 0,
})
hl.workspace_rule({ workspace = "10", monitor = "eDP-1", default = false })
hl.workspace_rule({ workspace = "1", monitor = "eDP-1", default = true })
hl.workspace_rule({ workspace = "2", monitor = "eDP-1", default = false, layout = "scrolling" })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1", default = false, layout = "scrolling" })
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-1", default = false })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-1", default = false })
hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "7", monitor = "HDMI-A-1", default = false })
hl.workspace_rule({ workspace = "8", monitor = "HDMI-A-1", default = false })
hl.workspace_rule({ workspace = "9", monitor = "HDMI-A-1", default = false })

---- WINDOWS RULES ----
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
hl.window_rule({
	name = "MPV rules",
	match = {
		class = "mpv",
	},
	border_size = 0,
	float = true,
	dim_around = true,
	center = true,
	suppress_event = "fullscreen",
	size = { 800, 450 },
	opacity = "1.0 override 1.0 override 1.0 override",
})
hl.window_rule({
	name = "VLC rules",
	match = {
		class = "vlc",
	},
	border_size = 0,
	float = true,
	dim_around = true,
	center = true,
	suppress_event = "fullscreen",
	size = { 800, 450 },
	opacity = "1.0 override 1.0 override 1.0 override",
})
hl.window_rule({
	name = "waypaper rules",
	match = {
		class = "waypaper",
	},
	border_size = 1,
	float = true,
	dim_around = true,
	center = true,
	stay_focused = true,
	suppress_event = "fullscreen",
	size = { 1530, 726 },
	opacity = "1.0 override 1.0 override 1.0 override",
})
hl.window_rule({
	name = "galculator rules",
	match = {
		class = "galculator",
	},
	border_size = 1,
	float = true,
	center = true,
	size = { 500, 300 },
	opacity = "1.0 override 1.0 override 1.0 override",
})
hl.window_rule({
	name = "cava rules",
	match = {
		class = "cava",
	},
	opacity = "0.8",
	float = true,
	size = { 800, 800 },
	fullscreen = false,
	xray = true,
	suppress_event = "activatefocus",
	border_size = 10,
})
local streaming_titles = ".*Watch.*|.*Picture%-in%-Picture.*|.*Tubi.*|.*Prime Video.*|"
	.. ".*amazon%.com.*|.*Crackle.*|.*Pluto.*|.*Freevie.*|.*Netflix.*|"
	.. ".*Disney.*|.*Peacock.*|.*Paramount.*|.*Vimeo.*|.*Vudu.*|"
	.. ".*Fandango.*|.*IMDb.*|.*YouTube.*|.*Popcornflix.*"
hl.window_rule({
	match = {
		title = streaming_titles,
	},
	opacity = "1.0 override",
})
hl.window_rule({
	match = {
		title = streaming_titles,
	},
	idle_inhibit = "fullscreen",
})
hl.window_rule({ match = { xwayland = true }, border_size = 3 })
hl.window_rule({ match = { class = "clamtk" }, float = true })
hl.window_rule({ match = { class = "elisa" }, float = true })
hl.window_rule({ match = { class = "org.kde.elisa" }, float = true })
hl.window_rule({ match = { class = "setup-assistant" }, float = true })
hl.window_rule({ match = { class = "btrfs-assistant" }, float = true })
hl.window_rule({ match = { class = "wihotspot" }, float = true })
hl.window_rule({ match = { class = "modem-manager-gui" }, float = true })
hl.window_rule({ match = { class = "nm-connection-editor" }, float = true })
hl.window_rule({ match = { class = "garuda*" }, float = true })
hl.window_rule({ match = { class = "floating" }, center = true })
-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = "20 monitor_h-120",
	float = true,
})
-- Example window rules that are useful
local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(true)
hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

---- LAYERS RULES ----
-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)
hl.layer_rule({
	name = "rofi rules",
	match = {
		namespace = "rofi",
	},
	dim_around = true,
})
hl.layer_rule({
	name = "logout",
	match = {
		namespace = "logout_dialog",
	},
	blur = true,
	xray = true,
})

--[[
    -------------------------------------------------
    SCRATCHPADS
    -------------------------------------------------
--]]
hl.workspace_rule({ workspace = "special:S-term", on_created_empty = "foot --app-id=Sterm" })
hl.workspace_rule({ workspace = "special:S-files", on_created_empty = "foot --app-id=Sfiles yazi" })
hl.workspace_rule({ workspace = "special:S-monitor", on_created_empty = "foot --app-id=Smonitor btop" })
hl.workspace_rule({ workspace = "special:S-moosic", on_created_empty = "foot --app-id=Smoosic pianobar" })
hl.workspace_rule({ workspace = "special:S-audio", on_created_empty = "foot --app-id=Saudio wiremix" })
hl.workspace_rule({ workspace = "special:S-bluet", on_created_empty = "foot --app-id=Sbluet bluetui" })
hl.workspace_rule({ workspace = "special:S-vial", on_created_empty = "Vial" })
hl.workspace_rule({ workspace = "special:S-notes", on_created_empty = "obsidian" })

hl.window_rule({
	match = {
		class = "obsidian",
	},
	border_size = 4,
	dim_around = true,
	float = true,
	center = true,
	size = { 1800, 1000 },
})
hl.window_rule({
	match = {
		class = "Vial",
	},
	border_size = 4,
	dim_around = true,
	float = true,
	center = true,
	size = { 1800, 1000 },
})
hl.window_rule({
	match = {
		class = "Sterm",
	},
	border_size = 4,
	dim_around = true,
	float = true,
	center = true,
	size = { 1300, 900 },
})
hl.window_rule({
	match = {
		class = "Sfiles",
	},
	border_size = 4,
	dim_around = true,
	float = true,
	center = true,
	size = { 1700, 900 },
})
hl.window_rule({
	match = {
		class = "Smonitor",
	},
	border_size = 4,
	dim_around = true,
	float = true,
	center = true,
	size = { 1500, 900 },
})
hl.window_rule({
	match = {
		class = "Saudio",
		"Sbluet",
	},
	border_size = 4,
	dim_around = true,
	float = true,
	center = true,
	size = { 900, 700 },
})
hl.window_rule({
	match = {
		class = "Sbluet",
	},
	border_size = 4,
	dim_around = true,
	float = true,
	center = true,
	size = { 900, 900 },
})
hl.window_rule({
	match = {
		class = "Smoosic",
	},
	border_size = 4,
	dim_around = true,
	float = true,
	center = true,
	size = { 800, 700 },
})
hl.bind(MOD .. " + ALT + D", hl.dsp.workspace.toggle_special("S-term"))
hl.bind(MOD .. " + ALT + H", hl.dsp.workspace.toggle_special("S-files"))
hl.bind(MOD .. " + ALT + S", hl.dsp.workspace.toggle_special("S-monitor"))
hl.bind(MOD .. " + ALT + M", hl.dsp.workspace.toggle_special("S-moosic"))
hl.bind(MOD .. " + ALT + X", hl.dsp.workspace.toggle_special("S-audio"))
hl.bind(MOD .. " + ALT + B", hl.dsp.workspace.toggle_special("S-bluet"))
hl.bind(MOD .. " + ALT + V", hl.dsp.workspace.toggle_special("S-vial"))
hl.bind(MOD .. " + ALT + O", hl.dsp.workspace.toggle_special("S-notes"))
hl.bind(MOD .. " + ALT + T", hl.dsp.workspace.toggle_special("magic"))
hl.bind(MOD .. " + SHIFT + T", hl.dsp.window.move({ workspace = "special:magic" }))
