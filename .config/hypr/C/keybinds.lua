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
hl.bind(MOD .. " + T", hl.dsp.exec_cmd(vars.my_term2))
hl.bind(MOD .. " + Return", hl.dsp.exec_cmd(vars.my_term))
hl.bind(MOD .. " + SHIFT + Return", hl.dsp.exec_cmd(vars.my_filesg))
hl.bind(MOD .. " + CTRL + Return", hl.dsp.exec_cmd(vars.my_email))
hl.bind(MOD .. " + B", hl.dsp.exec_cmd(vars.my_brows))
hl.bind(MOD .. " + O", hl.dsp.exec_cmd(vars.my_browsv))
hl.bind(MOD .. " + I", hl.dsp.exec_cmd(vars.emojis))
hl.bind(MOD .. " + M", hl.dsp.exec_cmd(vars.my_music))
hl.bind(MOD .. " + N", hl.dsp.exec_cmd(vars.my_editc))
hl.bind(MOD .. " + SHIFT + M", hl.dsp.exec_cmd(vars.my_media))
hl.bind(MOD .. " + Print", hl.dsp.exec_cmd(vars.prntscrn))
hl.bind(" + Print", hl.dsp.exec_cmd(vars.prntscrn))
hl.bind("CTRL + ALT + T", hl.dsp.exec_cmd(vars.my_mux))
hl.bind("CTRL + ALT + M", hl.dsp.exec_cmd(vars.my_beats))
hl.bind("CTRL + ALT + A", hl.dsp.exec_cmd(vars.aiassist))

hl.bind("ALT + N", hl.dsp.submap("text-edit"))
hl.define_submap("text-edit", "reset", function()
	hl.bind("m", hl.dsp.exec_cmd("cd " .. vars.my_config .. " && " .. vars.my_editc))
	hl.bind("h", hl.dsp.exec_cmd(vars.my_editc .. " " .. vars.my_config .. "/hypr/"))
	hl.bind("s", hl.dsp.exec_cmd(vars.my_editc .. " " .. vars.my_config .. "/sway/"))
	hl.bind("d", hl.dsp.exec_cmd(vars.my_editc .. " " .. vars.my_config .. "/dwm/"))
	hl.bind("x", hl.dsp.exec_cmd(vars.my_editc .. " " .. vars.my_config .. "/.scripts/"))
	hl.bind("l", hl.dsp.exec_cmd(vars.my_editc .. " " .. vars.my_config .. "/nvim/"))
	hl.bind("escape", hl.dsp.submap("reset"))
end)

---- APPLICATION LAUNCHERS & MENUS ----
hl.bind(MOD .. " + P", hl.dsp.exec_cmd(vars.menu_run))
hl.bind(MOD .. " + SHIFT + P", hl.dsp.exec_cmd(vars.menu_drun))
hl.bind(MOD .. " + CTRL + P", hl.dsp.exec_cmd(vars.menu_files))
hl.bind(MOD .. " + ALT + P", hl.dsp.exec_cmd(vars.menu_win))
hl.bind(MOD .. " + SHIFT + O", hl.dsp.exec_cmd(vars.bbooks))
hl.bind(MOD .. " + CTRL + C", hl.dsp.exec_cmd(vars.clips))
hl.bind(MOD .. " + CTRL + V", hl.dsp.exec_cmd(vars.clips))
hl.bind(MOD .. " + CTRL + Q", hl.dsp.exec_cmd(vars.logot))
hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd(vars.logot))
hl.bind("CTRL + ALT + O", hl.dsp.exec_cmd(vars.bsearch))
hl.bind("CTRL + ALT + K", hl.dsp.exec_cmd(vars.keybs)) --TODO
hl.bind("CTRL + ALT + P", hl.dsp.exec_cmd(vars.menu_full))

---- FUNCTION KEYS/HOTLIST ----
hl.bind(MEH .. " + F1", hl.dsp.exec_cmd(vars.my_brows2))
hl.bind(MEH .. " + F2", hl.dsp.exec_cmd(vars.my_email2))
hl.bind(MEH .. " + F3", hl.dsp.exec_cmd(vars.my_filesc))
hl.bind(MEH .. " + F4", hl.dsp.exec_cmd(vars.my_editg))
hl.bind(MEH .. " + F5", hl.dsp.exec_cmd(vars.my_image))
hl.bind(MEH .. " + F6", hl.dsp.exec_cmd(vars.my_office))
hl.bind(MEH .. " + F7", hl.dsp.exec_cmd(vars.zoomclient))
hl.bind(MEH .. " + F8", hl.dsp.exec_cmd(vars.videdit))
hl.bind(MEH .. " + F9", hl.dsp.exec_cmd(vars.my_stream))
hl.bind(MEH .. " + F10", hl.dsp.exec_cmd(vars.menu_run))
hl.bind(MEH .. " + F11", hl.dsp.exec_cmd(vars.menu_drun))
hl.bind(MEH .. " + F12", hl.dsp.exec_cmd(vars.menu_full))

hl.bind(" + F11", hl.dsp.window.fullscreen({ action = "toggle" }))

---- ENVIRONMENT/THEME ACTIONS ----
hl.bind(MOD .. " + CTRL + R", hl.dsp.exec_cmd(vars.rload))
hl.bind(MOD .. " + CTRL + T", hl.dsp.exec_cmd(vars.barsel))
hl.bind(MOD .. " + CTRL + B", hl.dsp.exec_cmd(vars.bartog))
hl.bind(MOD .. " + CTRL + S", hl.dsp.exec_cmd(vars.walls))
hl.bind(MOD .. " + CTRL + W", hl.dsp.exec_cmd(vars.wallr))
hl.bind(MOD .. " + ALT + n", hl.dsp.exec_cmd(vars.netwrk))
hl.bind("CTRL + ALT + G", hl.dsp.exec_cmd(vars.gamemode))
hl.bind("CTRL + ALT + H", hl.dsp.exec_cmd(vars.visualh)) --TODO

---- WINDOWS ----
hl.bind(MOD .. " + Q", hl.dsp.window.close())
hl.bind(MOD .. " + C", hl.dsp.window.center())
hl.bind(MOD .. " + W", hl.dsp.window.pseudo())
hl.bind(MOD .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(MOD .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("ALT + T", hl.dsp.layout("togglesplit")) --only for dwindle
hl.bind("ALT + Tab", hl.dsp.window.swap({ direction = "right" }))
hl.bind(MOD .. " + Tab", hl.dsp.window.swap({ direction = "left" }))

-- Move focus with MOD +
hl.bind(MOD .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(MOD .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(MOD .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(MOD .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(MOD .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(MOD .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(MOD .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(MOD .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move window with MOD + SHIFT +
hl.bind(MOD .. " + SHIFT + left", hl.dsp.window.move({ direction = "left", group_aware = true }))
hl.bind(MOD .. " + SHIFT + right", hl.dsp.window.move({ direction = "right", group_aware = true }))
hl.bind(MOD .. " + SHIFT + up", hl.dsp.window.move({ direction = "up", group_aware = true }))
hl.bind(MOD .. " + SHIFT + down", hl.dsp.window.move({ direction = "down", group_aware = true }))
hl.bind(MOD .. " + SHIFT + H", hl.dsp.window.move({ direction = "left", group_aware = true }))
hl.bind(MOD .. " + SHIFT + L", hl.dsp.window.move({ direction = "right", group_aware = true }))
hl.bind(MOD .. " + SHIFT + K", hl.dsp.window.move({ direction = "up", group_aware = true }))
hl.bind(MOD .. " + SHIFT + J", hl.dsp.window.move({ direction = "down", group_aware = true }))

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
hl.bind("CTRL + ALT + E", hl.dsp.exec_cmd(vars.rlmon1))
hl.bind(MOD .. " + period", hl.dsp.focus({ monitor = "+1" }))
hl.bind(MOD .. " + comma", hl.dsp.workspace.swap_monitors({ monitor1 = "HDMI-A-1", monitor2 = "eDP-1" }))

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
hl.bind("ALT + mouse:272", function()
	zoomfunction(-0.1)
end, { mouse = true, repeating = true, description = "Misc: Zoom out" })
hl.bind("ALT + mouse:273", function()
	zoomfunction(0.1)
end, { mouse = true, repeating = true, description = "Misc: Zoom in" })

---- MEDIA & MEDIA KEYS ----
-- monitor brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
hl.bind("XF86ZoomIn", hl.dsp.exec_cmd(vars.brightu), { locked = true, repeating = true })
hl.bind("XF86ZoomOut", hl.dsp.exec_cmd(vars.brightd), { locked = true, repeating = true })
hl.bind("SHIFT + XF86ZoomIn", hl.dsp.exec_cmd(vars.brightmu), { locked = true })
hl.bind("SHIFT + XF86ZoomOut", hl.dsp.exec_cmd(vars.brightmd), { locked = true })
hl.bind(HYPER .. " + up", hl.dsp.exec_cmd(vars.brightmu), { locked = true })
hl.bind(HYPER .. " + down", hl.dsp.exec_cmd(vars.brightmd), { locked = true })
hl.bind(MEH .. " + up", hl.dsp.exec_cmd(vars.brightu), { locked = true, repeating = true })
hl.bind(MEH .. " + down", hl.dsp.exec_cmd(vars.brightd), { locked = true, repeating = true })

-- volume control
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(vars.volu), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(vars.vold), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(vars.volt), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(vars.mict), { locked = true })
hl.bind("XF86Calculator", hl.dsp.exec_cmd(vars.my_calc), { locked = true })
hl.bind("XF86AppSelect", hl.dsp.exec_cmd(vars.menu_full), { locked = true })
hl.bind(HYPER .. " + M", hl.dsp.exec_cmd(vars.micd), { locked = true, repeating = true })
hl.bind(HYPER .. " + comma", hl.dsp.exec_cmd(vars.micu), { locked = true, repeating = true })
hl.bind(HYPER .. " + period", hl.dsp.exec_cmd(vars.mict), { locked = true })

-- Player control
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(vars.mnxt), { locked = true })
hl.bind("XF86AudioStop", hl.dsp.exec_cmd(vars.mstop), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(vars.mpp), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(vars.mprv), { locked = true })
hl.bind("XF86AudioMedia", hl.dsp.exec_cmd(vars.mnow), { locked = true })
hl.bind(HYPER .. " + U", hl.dsp.exec_cmd(vars.mnow))
hl.bind(HYPER .. " + I", hl.dsp.exec_cmd(vars.my_favs))

---- System ----
hl.bind(MEH .. "  + K", hl.dsp.exec_cmd(vars.kmndext))
hl.bind(MEH .. "  + J", hl.dsp.exec_cmd(vars.kmndlap))
hl.bind(
	MOD .. " + SHIFT + Q",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
