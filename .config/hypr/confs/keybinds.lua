--[[
    -------------------------------------------------
    KEYBINDINGS
    -------------------------------------------------
--]]
require("vars")
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
