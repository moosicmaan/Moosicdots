---- BIND CONFIGS ----
hl.config({
	binds = {
		workspace_back_and_forth = false,
		hide_special_on_workspace_change = false,
	},
})

---- VARS/MODS ----
local vars = require("C.vars")
local MOD = vars.MOD
local HYPER = vars.HYPER
local MEH = vars.MEH

---- APPLICATIONS ----
hl.bind(MOD .. " + T", hl.dsp.exec_cmd(vars.my_term2), { description = "Open the alterate terminal emulator" })
hl.bind(MOD .. " + Return", hl.dsp.exec_cmd(vars.my_term), { description = "Open the default terminal emulator" })
hl.bind(
	MOD .. " + SHIFT + Return",
	hl.dsp.exec_cmd(vars.my_filesg),
	{ description = "Open the graphical file explorer" }
)
hl.bind(MOD .. " + CTRL + Return", hl.dsp.exec_cmd(vars.my_email), { description = "Open the email program" })
hl.bind(MOD .. " + B", hl.dsp.exec_cmd(vars.my_brows), { description = "Open internet browser" })
hl.bind(MOD .. " + O", hl.dsp.exec_cmd(vars.my_browsv), { description = "Open vim-like internet browser" })
hl.bind(MOD .. " + I", hl.dsp.exec_cmd(vars.emojis), { description = "Toggle emojis browser" })
hl.bind(MOD .. " + M", hl.dsp.exec_cmd(vars.my_music), { description = "Open music player" })
hl.bind(
	MOD .. " + N",
	hl.dsp.exec_cmd("cd " .. vars.my_dots .. " && " .. vars.my_editc),
	{ description = "Edit .config" }
)
hl.bind(MOD .. " + SHIFT + M", hl.dsp.exec_cmd(vars.my_media), { description = "Open video player" })
hl.bind(MOD .. " + Print", hl.dsp.exec_cmd(vars.prntscrn), { description = "Take a screenshot" })
hl.bind("Print", hl.dsp.exec_cmd(vars.prntscrn), { description = "Take a screenshot" })
hl.bind("CTRL + ALT + T", hl.dsp.exec_cmd(vars.my_mux), { description = "Start a TMUX session" })
hl.bind("CTRL + ALT + M", hl.dsp.exec_cmd(vars.my_beats), { description = "Rofi Jams - play Music" })
hl.bind("CTRL + ALT + A", hl.dsp.exec_cmd(vars.aiassist), { description = "Get AI help" })

hl.bind("ALT + N", hl.dsp.submap("text-edit"), { description = "Start text-edit submap" })
hl.define_submap("text-edit", "reset", function()
	hl.bind("n", hl.dsp.exec_cmd("cd " .. vars.my_dots .. " && " .. vars.my_editc))
	hl.bind("m", hl.dsp.exec_cmd(vars.my_editc .. " " .. vars.my_config))
	hl.bind("h", hl.dsp.exec_cmd(vars.my_editc .. " " .. vars.my_config .. "/hypr/"))
	hl.bind("s", hl.dsp.exec_cmd(vars.my_editc .. " " .. vars.my_config .. "/sway/"))
	hl.bind("d", hl.dsp.exec_cmd(vars.my_editc .. " " .. vars.my_config .. "/dwm/"))
	hl.bind("x", hl.dsp.exec_cmd(vars.my_editc .. " " .. vars.my_config .. "/.scripts/"))
	hl.bind("l", hl.dsp.exec_cmd(vars.my_editc .. " " .. vars.my_config .. "/nvim/"))
	hl.bind("escape", hl.dsp.submap("reset"))
end)

---- APPLICATION LAUNCHERS & MENUS ----
hl.bind(MOD .. " + P", hl.dsp.exec_cmd(vars.menu_run), { description = "Dmenu-like app selector" })
hl.bind(MOD .. " + SHIFT + P", hl.dsp.exec_cmd(vars.menu_drun), { description = "Rofi app selector" })
hl.bind(MOD .. " + CTRL + P", hl.dsp.exec_cmd(vars.menu_files), { description = "Rofi file selector" })
hl.bind(MOD .. " + ALT + P", hl.dsp.exec_cmd(vars.menu_win), { description = "Rofi current window selector" })
hl.bind(MOD .. " + SHIFT + O", hl.dsp.exec_cmd(vars.bbooks), { description = "Bookmark selector" })
hl.bind(MOD .. " + CTRL + C", hl.dsp.exec_cmd(vars.clips), { description = "Rofi clipboard copy selector" })
hl.bind(MOD .. " + CTRL + V", hl.dsp.exec_cmd(vars.clips), { description = "Rofi clipboard paste selector" })
hl.bind(MOD .. " + CTRL + Q", hl.dsp.exec_cmd(vars.logot), { description = "System menu" })
hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd(vars.logot), { description = "System menu" })
hl.bind("CTRL + ALT + O", hl.dsp.exec_cmd(vars.bsearch), { description = "Online search" })
hl.bind("CTRL + ALT + K", hl.dsp.exec_cmd(vars.keybs), { description = "Keybind search and execute" })
hl.bind("CTRL + ALT + P", hl.dsp.exec_cmd(vars.menu_full), { description = "Apple-like menu" })

---- FUNCTION KEYS/HOTLIST ----
hl.bind(MEH .. " + F1", hl.dsp.exec_cmd(vars.my_brows2), { description = "Open alt internet browser" })
hl.bind(MEH .. " + F2", hl.dsp.exec_cmd(vars.my_email2), { description = "Open alt email" })
hl.bind(MEH .. " + F3", hl.dsp.exec_cmd(vars.my_filesc), { description = "Open cli file browesr" })
hl.bind(MEH .. " + F4", hl.dsp.exec_cmd(vars.my_editg), { description = "Open graphical editor" })
hl.bind(MEH .. " + F5", hl.dsp.exec_cmd(vars.my_image), { description = "Open image editor" })
hl.bind(MEH .. " + F6", hl.dsp.exec_cmd(vars.my_office), { description = "Open Office suite" })
hl.bind(MEH .. " + F7", hl.dsp.exec_cmd(vars.zoomclient), { description = "Open Zoom client" })
hl.bind(MEH .. " + F8", hl.dsp.exec_cmd(vars.videdit), { description = "Open video editor" })
hl.bind(MEH .. " + F9", hl.dsp.exec_cmd(vars.my_stream), { description = "Open streaming software" })
hl.bind(MEH .. " + F10", hl.dsp.exec_cmd(vars.menu_run), { description = "Dmenu-like app selector" })
hl.bind(MEH .. " + F11", hl.dsp.exec_cmd(vars.menu_drun), { description = "Rofi app selector" })
hl.bind(MEH .. " + F12", hl.dsp.exec_cmd(vars.menu_full), { description = "Apple-like app selector" })

hl.bind(" + F11", hl.dsp.window.fullscreen({ action = "toggle" }), { description = "Toggle fullscreen" })

---- ENVIRONMENT/THEME ACTIONS ----
hl.bind(MOD .. " + CTRL + R", hl.dsp.exec_cmd(vars.rload), { description = "Reload config" })
hl.bind(MOD .. " + CTRL + u", hl.dsp.exec_cmd(vars.keytog), { release = true, description = "Toggle USB keyboard" })
hl.bind(MOD .. " + CTRL + T", hl.dsp.exec_cmd(vars.barsel), { description = "Select statusbar" })
hl.bind(MOD .. " + CTRL + B", hl.dsp.exec_cmd(vars.bartog), { description = "Toggle statusbar" })
hl.bind(MOD .. " + CTRL + S", hl.dsp.exec_cmd(vars.walls), { description = "Select wallpaper" })
hl.bind(MOD .. " + CTRL + W", hl.dsp.exec_cmd(vars.wallr), { description = "Random wallpaper" })
hl.bind(MOD .. " + ALT + n", hl.dsp.exec_cmd(vars.netwrk), { description = "Select WiFi" })
hl.bind("CTRL + ALT + G", hl.dsp.exec_cmd(vars.gamemode), { description = "Toggle gamemode" })
-- hl.bind("CTRL + ALT + H", hl.dsp.exec_cmd(vars.visualh), { description = "Garuda visuals" }) --TODO

---- WINDOWS ----
hl.bind(MOD .. " + Q", hl.dsp.window.close(), { description = "Close a window" })
hl.bind(MOD .. " + C", hl.dsp.window.center(), { description = "Center a window" })
hl.bind(MOD .. " + W", hl.dsp.window.pseudo(), { description = "Pseudo tile a window" })
hl.bind(MOD .. " + F", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle window float" })
hl.bind(
	MOD .. " + SHIFT + F",
	hl.dsp.window.fullscreen({ action = "toggle" }),
	{ description = "Toggle window fullscreen" }
)
hl.bind(MOD .. " + Tab", hl.dsp.window.swap({ direction = "left" }), { description = "Swap window next" })
hl.bind("ALT + Tab", hl.dsp.window.swap({ direction = "right" }), { description = "Swap window prev" })

hl.bind("ALT + W", hl.dsp.submap("windows"), { description = "Start windows submap" })
hl.define_submap("windows", function()
	hl.bind("left", hl.dsp.window.move({ direction = "left", group_aware = true }))
	hl.bind("right", hl.dsp.window.move({ direction = "right", group_aware = true }))
	hl.bind("up", hl.dsp.window.move({ direction = "up", group_aware = true }))
	hl.bind("down", hl.dsp.window.move({ direction = "down", group_aware = true }))
	hl.bind("H", hl.dsp.window.move({ direction = "left", group_aware = true }))
	hl.bind("L", hl.dsp.window.move({ direction = "right", group_aware = true }))
	hl.bind("K", hl.dsp.window.move({ direction = "up", group_aware = true }))
	hl.bind("J", hl.dsp.window.move({ direction = "down", group_aware = true }))
	hl.bind("F", hl.dsp.window.float({ action = "toggle" }))
	hl.bind("SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))
	--Dwindle
	-- hl.bind("S", hl.dsp.layout("togglesplit"))
	--Master
	hl.bind("S", hl.dsp.layout("swapwithmaster"))
	hl.bind("N", hl.dsp.layout("rollnext"))
	hl.bind("P", hl.dsp.layout("rollprev"))
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Move focus with MOD +
hl.bind(MOD .. " + left", hl.dsp.focus({ direction = "left" }), { description = "Focus window left" })
hl.bind(MOD .. " + right", hl.dsp.focus({ direction = "right" }), { description = "Focus window right" })
hl.bind(MOD .. " + up", hl.dsp.focus({ direction = "up" }), { description = "Focus window up" })
hl.bind(MOD .. " + down", hl.dsp.focus({ direction = "down" }), { description = "Focus window down" })
hl.bind(MOD .. " + H", hl.dsp.focus({ direction = "left" }), { description = "Focus window left" })
hl.bind(MOD .. " + L", hl.dsp.focus({ direction = "right" }), { description = "Focus window right" })
hl.bind(MOD .. " + K", hl.dsp.focus({ direction = "up" }), { description = "Focus window up" })
hl.bind(MOD .. " + J", hl.dsp.focus({ direction = "down" }), { description = "Focus window down" })

-- Move window with MOD + SHIFT +
hl.bind(
	MOD .. " + SHIFT + left",
	hl.dsp.window.move({ direction = "left", group_aware = true }),
	{ description = "Swap window to the left" }
)
hl.bind(
	MOD .. " + SHIFT + right",
	hl.dsp.window.move({ direction = "right", group_aware = true }),
	{ description = "Swap window to the right" }
)
hl.bind(
	MOD .. " + SHIFT + up",
	hl.dsp.window.move({ direction = "up", group_aware = true }),
	{ description = "Swap window up" }
)
hl.bind(
	MOD .. " + SHIFT + down",
	hl.dsp.window.move({ direction = "down", group_aware = true }),
	{ description = "Swap window down" }
)
hl.bind(
	MOD .. " + SHIFT + H",
	hl.dsp.window.move({ direction = "left", group_aware = true }),
	{ description = "Swap window to the left" }
)
hl.bind(
	MOD .. " + SHIFT + L",
	hl.dsp.window.move({ direction = "right", group_aware = true }),
	{ description = "Swap window to the right" }
)
hl.bind(
	MOD .. " + SHIFT + K",
	hl.dsp.window.move({ direction = "up", group_aware = true }),
	{ description = "Swap window up" }
)
hl.bind(
	MOD .. " + SHIFT + J",
	hl.dsp.window.move({ direction = "down", group_aware = true }),
	{ description = "Swap window down" }
)

-- Move/resize windows with MOD + LMB/RMB and dragging
hl.bind(MOD .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Drag the window" })
hl.bind(MOD .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize the window" })

hl.bind("ALT + R", hl.dsp.submap("resize"), { description = "Start resize submap" })
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
	hl.bind(MOD .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "Go to workspace" .. i })
	hl.bind(
		MOD .. " + SHIFT + " .. key,
		hl.dsp.window.move({ workspace = i, follow = false }),
		{ description = "Move window to workspace" .. i }
	)
end

-- Scroll through existing workspaces with MOD + scroll
hl.bind(MOD .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Go to next workspace" })
hl.bind(MOD .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { description = "Go to previous workspace" })

---- MONITORS ----
hl.bind("CTRL + ALT + E", hl.dsp.exec_cmd(vars.rlmon1), { description = "Show Mon0" })
hl.bind("CTRL + ALT + SHIFT + E", hl.dsp.exec_cmd(vars.rlmon0), { description = "Hide Mon0" })
hl.bind(MOD .. " + period", hl.dsp.focus({ monitor = "+1" }), { description = "Focus on the next monitor" })
hl.bind(
	MOD .. " + comma",
	hl.dsp.workspace.swap_monitors({ monitor1 = "HDMI-A-1", monitor2 = "eDP-1" }),
	{ description = "Swap the two main monitors" }
)

--# Zoom
local function zoomfunction(value)
	local zoomvalue = hl.get_config("cursor:zoom_factor")
	if (zoomvalue + value) > 3.0 then
		hl.config({ cursor = { zoom_factor = 3.0 } })
	elseif (zoomvalue + value) < 1.0 then
		hl.config({ cursor = { zoom_factor = 1.0 } })
	else
		hl.config({ cursor = { zoom_factor = zoomvalue + value } })
	end
end

hl.bind("ALT + up", function()
	zoomfunction(-0.1)
end, { repeating = true, description = "Zoom out" })
hl.bind("ALT + down", function()
	zoomfunction(0.1)
end, { repeating = true, description = "Zoom in" })

hl.bind(MOD .. " + SHIFT + Z", function()
	zoomfunction(-0.1)
end, { repeating = true, description = "Zoom out" })
hl.bind(MOD .. " + Z", function()
	zoomfunction(0.1)
end, { repeating = true, description = "Zoom in" })

---- MEDIA & MEDIA KEYS ----
-- zoom
hl.bind("XF86ZoomIn", function()
	zoomfunction(0.1)
end, { locked = true, repeating = true, description = "Zoom in" })
hl.bind("XF86ZoomOut", function()
	zoomfunction(-0.1)
end, { locked = true, repeating = true, description = "Zoom out" })

-- monitor brightness
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
	{ locked = true, repeating = true, description = "Brightness up" }
)
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
	{ locked = true, repeating = true, description = "Brightness down" }
)
hl.bind(HYPER .. " + b", hl.dsp.exec_cmd(vars.brightmu), { locked = true, description = "Monitor brightness up" })
hl.bind(HYPER .. " + d", hl.dsp.exec_cmd(vars.brightmd), { locked = true, description = "Monitor brightness down" })
hl.bind(
	MEH .. " + b",
	hl.dsp.exec_cmd(vars.brightu),
	{ locked = true, repeating = true, description = "Screen brightness up" }
)
hl.bind(
	MEH .. " + d",
	hl.dsp.exec_cmd(vars.brightd),
	{ locked = true, repeating = true, description = "Screen brightncss down" }
)

-- volume control
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd(vars.volu),
	{ locked = true, repeating = true, description = "Audio up" }
)
hl.bind(HYPER .. " + up", hl.dsp.exec_cmd(vars.volu), { locked = true, repeating = true, description = "Audio up" })
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd(vars.vold),
	{ locked = true, repeating = true, description = "Audio down" }
)
hl.bind(HYPER .. " + down", hl.dsp.exec_cmd(vars.vold), { locked = true, repeating = true, description = "Audio down" })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(vars.volt), { locked = true, description = "Mute audio" })
hl.bind(HYPER .. " + t", hl.dsp.exec_cmd(vars.volt), { locked = true, description = "Mute audio" })
hl.bind(
	HYPER .. " + m",
	hl.dsp.exec_cmd(vars.micd),
	{ locked = true, repeating = true, description = "Mic volume down" }
)
hl.bind(
	HYPER .. " + comma",
	hl.dsp.exec_cmd(vars.micu),
	{ locked = true, repeating = true, description = "Mic volume up" }
)
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(vars.mict), { locked = true, description = "Mic mute" })
hl.bind(HYPER .. " + period", hl.dsp.exec_cmd(vars.mict), { locked = true, description = "Mic toggle" })

-- Player control
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(vars.mnxt), { locked = true, description = "Media next" })
hl.bind(HYPER .. " + n", hl.dsp.exec_cmd(vars.mnxt), { locked = true, description = "Media next" })
hl.bind("XF86AudioStop", hl.dsp.exec_cmd(vars.mstop), { locked = true, description = "Media stop" })
hl.bind(HYPER .. " + x", hl.dsp.exec_cmd(vars.mstop), { locked = true, description = "Media stop" })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(vars.mpp), { locked = true, description = "Media play/pause" })
hl.bind(HYPER .. " + y", hl.dsp.exec_cmd(vars.mpp), { locked = true, description = "Media play/pause" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(vars.mprv), { locked = true, description = "Media previous" })
hl.bind(HYPER .. " + p", hl.dsp.exec_cmd(vars.mprv), { locked = true, description = "Media previous" })
hl.bind("XF86AudioMedia", hl.dsp.exec_cmd(vars.mnow), { locked = true, description = "Display currently playing" })
hl.bind(HYPER .. " + u", hl.dsp.exec_cmd(vars.mnow), { description = "Display currently playing" })
hl.bind(HYPER .. " + i", hl.dsp.exec_cmd(vars.my_favs), { description = "Manage audio playlists" })

-- Other
hl.bind("XF86Calculator", hl.dsp.exec_cmd(vars.my_calc), { locked = true, description = "Toggle calculator" })
hl.bind(HYPER .. " + c", hl.dsp.exec_cmd(vars.my_calc), { locked = true, description = "Toggle calculator" })

---- System ----
hl.bind(MEH .. "  + K", hl.dsp.exec_cmd(vars.kmndext), { description = "kmonad for external keyboard" })
hl.bind(MEH .. "  + J", hl.dsp.exec_cmd(vars.kmndlap), { description = "kmoned for laptop keybaurd" })
hl.bind(
	MOD .. " + SHIFT + Q",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"),
	{ description = "Quit hyprland" }
)
