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
-- local zoomscrn   = pypr zoom                                    -- Zoom the screen toggle
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
