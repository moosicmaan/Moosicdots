local M = {}

-- MODS
M.MOD = "SUPER"
M.HYPER = M.MOD .. " + CTRL + ALT + SHIFT"
M.MEH = "CTRL + ALT + SHIFT"
M.prefix = "uwsm app -- "

-- FILES
M.my_dots = "/mnt/data/moosicmaan/CONFIG"
M.my_config = M.my_dots .. "/.config"
M.my_scripts = M.my_config .. "/.scripts"

-- APPLICATIONS
M.my_term = "footclient"
M.my_term2 = "kitty"
M.my_brows = M.prefix .. "brave"
M.my_brows2 = M.prefix .. "qutebrowser"
M.my_browsv = M.prefix .. "zen-browser"
M.my_email = M.prefix .. "thunderbird"
M.my_email2 = M.prefix .. "thunderbird"
M.my_editg = M.prefix .. "kate"
M.my_editc = M.prefix .. "neovide"
M.my_filesg = "dolphin"
M.my_filesc = M.my_term .. " -e yazi"
M.my_music = M.prefix .. "spotube"
M.my_media = "mpv --player-operation-mode=pseudo-gui"
M.my_office = M.prefix .. "onlyoffice-desktopeditors"
M.my_image = M.prefix .. "gimp"
M.emojis = "emote"
M.my_stream = M.prefix .. "obs"
M.aiassist = M.prefix .. "brave --app=https://chat.openai.com"
M.my_mux = M.prefix .. M.my_term2 .. " -e tmux"
M.prntscrn = M.my_scripts .. "/ut-screenshot"
M.my_calc = "pkill galculator || galculator"
M.videdit = M.prefix .. "org.kde.kdenlive"
M.zoomclient = M.prefix .. "zoom"

-- APPLICATION LAUNCHERS AND MENUS
M.logot = "wlogout"
M.menu_full = "nwg-drawer -c 7 -is 70 -spacing 20 -ovl"
M.bsearch = "pkill rofi || " .. M.my_scripts .. "/rofi-search"
M.clips = "pkill rofi || " .. M.my_scripts .. "/rofi-cliphist"
M.keybs = "pkill rofi || " .. M.my_scripts .. "/hypr-keybinds"
M.bbooks = "pkill rofi || " .. M.my_scripts .. "/rofi-bookmarks"
M.my_beats = "pkill rofi || " .. M.my_scripts .. "/rofi-beats"
M.my_favs = "pkill rofi || " .. M.my_scripts .. "/rofi-beat-favs"
M.menu_run = "pkill rofi || rofi -config " .. M.my_config .. "/rofi/dmenu.rasi -show run -run-command '{cmd}'"
M.menu_drun = "pkill rofi || rofi -config " .. M.my_config .. "/rofi/config.rasi -show drun -run-command '{cmd}'"
M.menu_win = "pkill rofi || rofi -config " .. M.my_config .. "/rofi/config.rasi -show window"
M.menu_files = "pkill rofi || rofi -config " .. M.my_config .. "/rofi/config.rasi -show filebrowser"
M.netwrk = "pkill rofi || networkmanager_dmenu"

-- ENVIRONMENT ACTIONS
M.bartog = "pkill waybar || " .. M.my_scripts .. "/wb-launch"
M.wallr = M.my_scripts .. "/ut-wallpaper --random"
M.barsel = M.my_scripts .. "/wb-switch"
M.walls = M.my_scripts .. "/ut-wallpaper --select"
M.kmndext = M.my_scripts .. "/ut-kbd-350"
M.kmndlap = M.my_scripts .. "/ut-kbd-lap"
M.visualh = M.my_scripts .. "/hypr-visuals"
M.gamemode = M.my_scripts .. "/hypr-gamemode"
M.rload = "hyprctl reload && " .. M.my_scripts .. "/ut-wallpaper --init"
M.rlmon1 = 'hyprctl eval \'hl.monitor({ output = "eDP-1", mode = "1920x1080@60", disabled = false })\''

-- MEDIA & MEDIA KEYS
M.volu = M.my_scripts .. "/media-vol --inc"
M.vold = M.my_scripts .. "/media-vol --dec"
M.volt = M.my_scripts .. "/media-vol --toggle"
M.micu = M.my_scripts .. "/media-vol --mic-inc"
M.micd = M.my_scripts .. "/media-vol --mic-dec"
M.mict = M.my_scripts .. "/media-vol --mic-toggle"
M.mpp = M.my_scripts .. "/media-ctrl --pause"
M.mstop = M.my_scripts .. "/media-ctrl --stop"
M.mnxt = M.my_scripts .. "/media-ctrl --nxt"
M.mprv = M.my_scripts .. "/media-ctrl --prv"
M.mnow = M.my_scripts .. "/media-ctrl --show"
M.brightu = M.my_scripts .. "/ut-monbrightness --inc"
M.brightd = M.my_scripts .. "/ut-monbrightness --dec"
M.brightmu = M.my_scripts .. "/ut-exmon-brightness --inc"
M.brightmd = M.my_scripts .. "/ut-exmon-brightness --dec"

return M
