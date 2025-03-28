-- ===============================================
-- -----------------------------------------------
--[[
     AwesomeWM Configuration
     https://github.com/awesomeWM

     Freedesktop : https://github.com/lcpz/awesome-freedesktop
     Copycats themes : https://github.com/lcpz/awesome-copycats
     lain : https://github.com/lcpz/lain

     Made to work with the standard simple BlackArch setup
     Moosicmaan, 2025

--]]
-- -----------------------------------------------
-- ===============================================

-- {{{ Required libraries
local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
naughty.config.defaults["icon_size"] = 100

local lain = require("lain")
local freedesktop = require("freedesktop")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
local hotkeys_popup = require("awful.hotkeys_popup").widget
require("awful.hotkeys_popup.keys")
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
local dpi = require("beautiful.xresources").apply_dpi
-- }}}

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors,
	})
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		-- Make sure we don't go into an endless error loop
		if in_error then
			return
		end
		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = err,
		})
		in_error = false
	end)
end
-- }}}

-- {{{ Autostart windowless processes
local function run_once(cmd_arr)
	for _, cmd in ipairs(cmd_arr) do
		awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
	end
end

run_once({ "unclutter -root" }) -- entries must be comma-separated
-- }}}

-- -----------------------------------------------
-- {{{ VARIABLE DEFINITIONS
-- -----------------------------------------------
-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
-- modkey = "Mod4"
local modkey = "Mod4"
local altkey = "Mod1"
local modkey1 = "Control"

-- Themes define colours, icons, and wallpapers
-- beautiful.init("/home/moosicmaan/.config/awesome/themes/blackarch/theme.lua")
-- keep themes in alfabetical order for ATT
local themes = {
	"blackburn", -- 1
	"copland", -- 2
	"multicolor", -- 3
	"powerarrow", -- 4
	"powerarrow-blue", -- 5
	"powerarrow-dark", -- 6
	"blackarch", -- 7
}

-- choose your theme here
local chosen_theme = themes[7]

local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme)
beautiful.init(theme_path)

-- -----------------------------------------------
-- Default Applications
-- -----------------------------------------------
-- DIRECTORIES
local my_dots = "/mnt/data/moosicmaan/CONFIG"
local my_config = "$my_dots/.config"
local my_scripts = "$my_dots/.config/.scripts"

-- APPLICATIONS
local my_term = "wezterm" -- Launch default terminal
local my_term2 = "ghostty" -- Launch alternate terminal
local my_brows = "zen-browser" -- Launch default browser
local my_brows2 = "firefox" -- Launch alternate browser
local my_browsv = "qutebrowser" -- Launch VIM-based browser
local my_email = "thunderbird" -- Launch default email client
local my_email2 = "bluemail" -- Launch alternate email client
local my_editg = "geany" -- Launch GUI text editor
local my_editc = "neovide" -- Launch terminal or console-like text editor
local my_filesg = "pcmanfm-qt" -- Launch GUI file browser
local my_filesc = "wezterm -e yazi" -- Launch console file browser
local my_music = "spotube" -- Launch music player
local my_media = "vlc" -- Launch media player
local my_office = "libreoffice" -- Launch office suite
local my_image = "org.gimp.GIMP" -- Launch GUI image editor
local emacsd = "emacs --daemon=serve" -- EMACS daemon
local emacsc = "emacsclient -c -a 'emacs'" -- EMACS client
local emojis = "emote" -- Launch emoji browser
local my_stream = "obs" -- Launch streaming software
local chatgpt = "brave --app=https://chat.openai.com" -- Launch OpenAI web app
local my_mux = "wezterm -e tmux" -- (alt) kitty -e sh -c 'kitty @ set-spacing padding=0; tmux' Launch TMUX in kitty
local lockscr = "swaylock -c 000000" -- Lock screen
local prntscrn = "$my_scripts/ut-screenshot" -- Take a screenshot
local my_calc = "pkill galculator || galculator" -- Toggle calculator

-- APPLICATION LAUNCHERS AND MENUS
local logot = "wlogout" -- Launch power menu
local menu_full = "nwg-drawer -c 7 -is 70 -spacing 20 -ovl" -- Full screen app drawer
local menu_run = "pkill rofi || rofi -config $my_config/rofi/dmenu.rasi -show run -run-command '$ex {cmd}'" -- Launch RUN menu
local menu_drun = "pkill rofi || rofi -config $my_config/rofi/config.rasi -show drun -run-command '$ex {cmd}'" -- Launch DRUN menu
local menu_win = "pkill rofi || rofi -config $my_config/rofi/config.rasi -show window" -- Launch active window selector
local menu_files = "pkill rofi || rofi -config $my_config/rofi/config.rasi -show filebrowser" -- Launch FILEbrowser selector
local bsearch = "pkill rofi || $my_scripts/rofi-search" -- Start a online search
local clips = "pkill rofi || $my_scripts/rofi-cliphist" -- Search clipboard history
local keybs = "pkill rofi || $my_scripts/hypr-keybinds" -- Search keybindings
local bbooks = "pkill rofi || $my_scripts/rofi-bookmarks" -- Search browser bookmarks
local my_radio = "pkill rofi || $my_scripts/rofi-beats" -- Rofi Media and Radio Selector

-- ENVIRONMENT ACTIONS
local bartog = "pkill waybar || $my_scripts/hypr-barlaunch" -- Toggle status bar
local zoomscrn = "pypr zoom" --"#Zoom the screen toggle
local rload = "hyprctl reload && $my_scripts/hypr-mon-reload && $my_scripts/ut-wallpaper init" --"#Reload gui environment
local wallr = "$my_scripts/ut-wallpaper --random" --"#Select random wallpaper
local barsel = "$my_scripts/hypr-barswitch" --"#Select status bar theme
local walls = "$my_scripts/ut-wallpaper --select" --"# Select wallpaper
local kmndext = "$my_scripts/ut-kbd-350" --"#Toggle external keyboard
local kmndlap = "$my_scripts/ut-kbd-lap" --"#Toggle laptop keyboard
local visualh = "$my_scripts/hypr-visuals" --"#Toggle visual element themes

-- MEDIA KEYS
local volu = "$my_scripts/media-vol --inc"
local vold = "$my_scripts/media-vol --dec"
local volt = "$my_scripts/media-vol --toggle"
local mpp = "$my_scripts/media-ctrl --pause"
local mstop = "$my_scripts/media-ctrl --pause"
local mnxt = "$my_scripts/media-ctrl --nxt"
local mprv = "$my_scripts/media-ctrl --prv"
local brightu = "$my_scripts/ut-monbrightness --inc"
local brightd = "$my_scripts/ut-monbrightness --dec"
local brightmu = "$my_scripts/ut-exmon-brightness --inc"
local brightmd = "$my_scripts/ut-exmon-brightness --dec"

-- -----------------------------------------------
-- awesome variables
-- -----------------------------------------------
-- This is used later as the default terminal and editor to run.
-- awful.util.terminal = my_term
terminal = "kitty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

awful.layout.suit.tile.left.mirror = true

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts = {
	awful.layout.suit.spiral,
	awful.layout.suit.spiral.dwindle,
	awful.layout.suit.tile,
	awful.layout.suit.floating,
	awful.layout.suit.tile.left,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.tile.top,
	awful.layout.suit.fair,
	awful.layout.suit.fair.horizontal,
	awful.layout.suit.max,
	awful.layout.suit.max.fullscreen,
	awful.layout.suit.magnifier,
	awful.layout.suit.corner.nw,
	awful.layout.suit.corner.ne,
	awful.layout.suit.corner.sw,
	awful.layout.suit.corner.se,
	lain.layout.cascade,
	lain.layout.cascade.tile,
	lain.layout.centerwork,
	lain.layout.termfair.center,
}
-- }}}

-- {{{ Wallpaper
if beautiful.wallpaper then
	for s = 1, screen.count() do
		gears.wallpaper.maximized(beautiful.wallpaper, s, true)
	end
end
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
	-- Each screen has its own tag table.
	tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, layouts[1])
end
-- }}}

-- {{{ Menu
dofile("/home/moosicmaan/.config/awesome/menu_items.lua")
-- Create a laucher widget and a main menu
mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock()

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
	awful.button({}, 1, awful.tag.viewonly),
	awful.button({ modkey }, 1, awful.client.movetotag),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, awful.client.toggletag),
	awful.button({}, 4, function(t)
		awful.tag.viewnext(awful.tag.getscreen(t))
	end),
	awful.button({}, 5, function(t)
		awful.tag.viewprev(awful.tag.getscreen(t))
	end)
)
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			-- Without this, the following
			-- :isvisible() makes no sense
			c.minimized = false
			if not c:isvisible() then
				awful.tag.viewonly(c:tags()[1])
			end
			-- This will also un-minimize
			-- the client, if needed
			client.focus = c
			c:raise()
		end
	end),
	awful.button({}, 3, function()
		if instance then
			instance:hide()
			instance = nil
		else
			instance = awful.menu.clients({ width = 250 })
		end
	end),
	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
		if client.focus then
			client.focus:raise()
		end
	end),
	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
		if client.focus then
			client.focus:raise()
		end
	end)
)

for s = 1, screen.count() do
	-- Create a promptbox for each screen
	mypromptbox[s] = awful.widget.prompt()
	-- Create an imagebox widget which will contains an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	mylayoutbox[s] = awful.widget.layoutbox(s)
	mylayoutbox[s]:buttons(awful.util.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(layouts, 1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(layouts, -1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(layouts, 1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(layouts, -1)
		end)
	))
	-- Create a taglist widget
	mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

	-- Create a tasklist widget
	mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

	-- Create the wibox
	mywibox[s] = awful.wibox({ position = "top", screen = s })

	-- Widgets that are aligned to the left
	local left_layout = wibox.layout.fixed.horizontal()
	left_layout:add(mylauncher)
	left_layout:add(mytaglist[s])
	left_layout:add(mypromptbox[s])

	-- Widgets that are aligned to the right
	local right_layout = wibox.layout.fixed.horizontal()
	if s == 1 then
		right_layout:add(wibox.widget.systray())
	end
	right_layout:add(mytextclock)
	right_layout:add(mylayoutbox[s])

	-- Now bring it all together (with the tasklist in the middle)
	local layout = wibox.layout.align.horizontal()
	layout:set_left(left_layout)
	layout:set_middle(mytasklist[s])
	layout:set_right(right_layout)

	mywibox[s]:set_widget(layout)
end
-- }}}

-- ===============================================
-- -----------------------------------------------
-- {{{ Mouse bindings
-- -----------------------------------------------
-- ===============================================
root.buttons(awful.util.table.join(
	awful.button({}, 3, function()
		mymainmenu:toggle()
	end),
	awful.button({}, 4, awful.tag.viewnext),
	awful.button({}, 5, awful.tag.viewprev)
))
-- }}}

-- ===============================================
-- -----------------------------------------------
-- {{{ Key bindings
-- -----------------------------------------------
-- ===============================================
globalkeys = awful.util.table.join(

	awful.key({ modkey }, "Left", awful.tag.viewprev),
	awful.key({ modkey }, "Right", awful.tag.viewnext),
	awful.key({ modkey }, "Escape", awful.tag.history.restore),

	awful.key({ modkey }, "j", function()
		awful.client.focus.byidx(1)
		if client.focus then
			client.focus:raise()
		end
	end),
	awful.key({ modkey }, "k", function()
		awful.client.focus.byidx(-1)
		if client.focus then
			client.focus:raise()
		end
	end),
	awful.key({ modkey, "Shift" }, "p", function()
		mymainmenu:show()
	end),

	-- Layout manipulation
	awful.key({ modkey, "Shift" }, "j", function()
		awful.client.swap.byidx(1)
	end),
	awful.key({ modkey, "Shift" }, "k", function()
		awful.client.swap.byidx(-1)
	end),
	awful.key({ modkey }, ".", function()
		awful.screen.focus_relative(1)
	end),
	awful.key({ modkey }, ",", function()
		awful.screen.focus_relative(-1)
	end),
	awful.key({ modkey }, "u", awful.client.urgent.jumpto),
	awful.key({ modkey }, "Tab", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end),

	-- Standard program
	awful.key({ modkey }, "Return", function()
		awful.util.spawn(terminal)
	end),
	awful.key({ modkey, "Control" }, "r", awesome.restart),
	awful.key({ modkey, "Shift" }, "q", awesome.quit),

	awful.key({ modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end),
	awful.key({ modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end),
	awful.key({ modkey, "Shift" }, "h", function()
		awful.tag.incnmaster(1)
	end),
	awful.key({ modkey, "Shift" }, "l", function()
		awful.tag.incnmaster(-1)
	end),
	awful.key({ modkey, "Control" }, "h", function()
		awful.tag.incncol(1)
	end),
	awful.key({ modkey, "Control" }, "l", function()
		awful.tag.incncol(-1)
	end),
	awful.key({ modkey }, "space", function()
		awful.layout.inc(layouts, 1)
	end),
	awful.key({ modkey, "Shift" }, "space", function()
		awful.layout.inc(layouts, -1)
	end),

	awful.key({ modkey, "Control" }, "n", awful.client.restore),

	-- Prompt
	awful.key({ modkey }, "r", function()
		mypromptbox[mouse.screen.index]:run()
	end),

	awful.key({ modkey }, "x", function()
		awful.prompt.run(
			{ prompt = "Run Lua code: " },
			mypromptbox[mouse.screen].widget,
			awful.util.eval,
			nil,
			awful.util.getdir("cache") .. "/history_eval"
		)
	end),
	-- Menubar
	awful.key({ modkey }, "p", function()
		menubar.show()
	end)
)

clientkeys = awful.util.table.join(
	awful.key({ modkey }, "f", function(c)
		c.fullscreen = not c.fullscreen
	end),
	awful.key({ modkey }, "q", function(c)
		c:kill()
	end),
	awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle),
	awful.key({ modkey, "Control" }, "Return", function(c)
		c:swap(awful.client.getmaster())
	end),
	awful.key({ modkey }, "o", awful.client.movetoscreen),
	awful.key({ modkey }, "t", function(c)
		c.ontop = not c.ontop
	end),
	awful.key({ modkey }, "n", function(c)
		-- The client currently has the input focus, so it cannot be
		-- minimized, since minimized clients can't have the focus.
		c.minimized = true
	end),
	awful.key({ modkey }, "m", function(c)
		c.maximized_horizontal = not c.maximized_horizontal
		c.maximized_vertical = not c.maximized_vertical
	end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = awful.util.table.join(
		globalkeys,
		awful.key({ modkey }, "#" .. i + 9, function()
			local screen = mouse.screen
			local tag = awful.tag.gettags(screen)[i]
			if tag then
				awful.tag.viewonly(tag)
			end
		end),
		awful.key({ modkey, "Control" }, "#" .. i + 9, function()
			local screen = mouse.screen
			local tag = awful.tag.gettags(screen)[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end),
		awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = awful.tag.gettags(client.focus.screen)[i]
				if tag then
					awful.client.movetotag(tag)
				end
			end
		end),
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = awful.tag.gettags(client.focus.screen)[i]
				if tag then
					awful.client.toggletag(tag)
				end
			end
		end)
	)
end

clientbuttons = awful.util.table.join(
	awful.button({}, 1, function(c)
		client.focus = c
		c:raise()
	end),
	awful.button({ modkey }, 1, awful.mouse.client.move),
	awful.button({ modkey }, 3, awful.mouse.client.resize)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			keys = clientkeys,
			buttons = clientbuttons,
		},
	},
	{ rule = { class = "MPlayer" }, properties = { floating = true } },
	{ rule = { class = "pinentry" }, properties = { floating = true } },
	{ rule = { class = "gimp" }, properties = { floating = true } },
	-- Set Firefox to always map on tags number 2 of screen 1.
	-- { rule = { class = "Firefox" },
	--   properties = { tag = tags[1][2] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c, startup)
	-- Enable sloppy focus
	c:connect_signal("mouse::enter", function(c)
		if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier and awful.client.focus.filter(c) then
			client.focus = c
		end
	end)

	if not startup then
		-- Set the windows at the slave,
		-- i.e. put it at the end of others instead of setting it master.
		-- awful.client.setslave(c)

		-- Put windows in a smart way, only if they does not set an initial position.
		if not c.size_hints.user_position and not c.size_hints.program_position then
			awful.placement.no_overlap(c)
			awful.placement.no_offscreen(c)
		end
	end

	local titlebars_enabled = false
	if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
		-- buttons for the titlebar
		local buttons = awful.util.table.join(
			awful.button({}, 1, function()
				client.focus = c
				c:raise()
				awful.mouse.client.move(c)
			end),
			awful.button({}, 3, function()
				client.focus = c
				c:raise()
				awful.mouse.client.resize(c)
			end)
		)

		-- Widgets that are aligned to the left
		local left_layout = wibox.layout.fixed.horizontal()
		left_layout:add(awful.titlebar.widget.iconwidget(c))
		left_layout:buttons(buttons)

		-- Widgets that are aligned to the right
		local right_layout = wibox.layout.fixed.horizontal()
		right_layout:add(awful.titlebar.widget.floatingbutton(c))
		right_layout:add(awful.titlebar.widget.maximizedbutton(c))
		right_layout:add(awful.titlebar.widget.stickybutton(c))
		right_layout:add(awful.titlebar.widget.ontopbutton(c))
		right_layout:add(awful.titlebar.widget.closebutton(c))

		-- The title goes in the middle
		local middle_layout = wibox.layout.flex.horizontal()
		local title = awful.titlebar.widget.titlewidget(c)
		title:set_align("center")
		middle_layout:add(title)
		middle_layout:buttons(buttons)

		-- Now bring it all together
		local layout = wibox.layout.align.horizontal()
		layout:set_left(left_layout)
		layout:set_right(right_layout)
		layout:set_middle(middle_layout)

		awful.titlebar(c):set_widget(layout)
	end
end)

client.connect_signal("focus", function(c)
	c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal
end)
-- }}}
